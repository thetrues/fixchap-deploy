# FixChap — Docker deployment

Everything the server needs to run FixChap: the public website, the staff dashboard and the API for the FixChap and Fundi apps (one Next.js container), PostgreSQL, and nginx with Let's Encrypt HTTPS.

```
fixchap-deploy/                    (a git repository, pulled on the server)
  dist.zip            the built app — made by fixchap-next/packing.sh
  deployme.sh         unzip + nginx config + docker-compose up --build
  sslrenew.sh         first HTTPS certificate, then renewals
  Dockerfile          image for the app (from the unzipped dist/)
  docker-compose.yml  app + PostgreSQL + nginx (+ certbot and migration tools on demand)
  nginx-prod/         nginx config (templates/ = HTTPS, bootstrap/ = HTTP-only until the first certificate)
  .env.example        settings template → copy to .env on the server
  secrets/            Firebase credentials-file.json (not in git)
  database/           schema and the MySQL → Postgres migration template
  scripts/            migrate, backups, restore, create-admin, end-old-sessions
```

Not in git (see `.gitignore`): `.env`, `secrets/`, `backups/`, `data/` (photos), `certbot/` (certificates), and the unzipped `dist/` and `nginx/`.

## How a release works

**On your computer** (in `fixchap-next`):

```bash
./packing.sh
```

It installs packages, builds the production app (`npm run forprodlocal`), zips it into `../fixchap-deploy/dist.zip`, and commits and pushes this repository. Local `.env` files are removed from the build, and the script refuses to finish if any remain.

The public address is baked into the build, so `fixchap-next/.env.production` must exist (copy `.env.production.example`):

```
APP_URL=https://fixchap.co.tz
NEXT_PUBLIC_GOOGLE_MAPS_KEY=
```

**On the server:**

```bash
cd /opt/deployments/fixchap-deploy
git pull
./deployme.sh
```

## First-time server setup

### 1. Docker

```bash
sudo apt update && sudo apt install -y git unzip curl
curl -fsSL https://get.docker.com | sudo sh
sudo usermod -aG docker $USER      # log out and back in
docker compose version
```

Ports 80 and 443 must be free: nginx runs inside Docker. If the old Laravel site's nginx or Apache uses them, stop it at cutover (`sudo systemctl stop nginx` / `apache2`), or set `HTTP_PORT`/`HTTPS_PORT` in `.env` for a test run on other ports.

### 2. Get the files

```bash
sudo mkdir -p /opt/deployments && sudo chown $USER /opt/deployments
cd /opt/deployments
git clone <your fixchap-deploy repository url> fixchap-deploy
cd fixchap-deploy
```

(One-time, on your computer, if the deploy folder isn't a git repository yet: `cd fixchap-deploy && git init -b main && git remote add origin <url> && git add . && git commit -m "initial" && git push -u origin main`.)

### 3. Settings

```bash
cp .env.example .env
nano .env
```

| Setting | Value |
|---|---|
| `APP_URL` | public address, same as in `.env.production` (e.g. `https://fixchap.co.tz`) |
| `SERVER_NAMES` | every domain nginx serves, **in quotes**, e.g. `"fixchap.co.tz www.fixchap.co.tz admin.fixchap.co.tz"`. Include `admin.fixchap.co.tz` so the mobile apps keep working without a new release |
| `PRIMARY_DOMAIN` | the first of those names |
| `LETSENCRYPT_EMAIL` | where certificate expiry warnings go |
| `POSTGRES_PASSWORD` | `openssl rand -hex 24` |
| `AUTH_SECRET` | `openssl rand -hex 32` |
| `APP_TIMEZONE` | same as the Laravel `.env` (usually `UTC`) |
| `SMS_USERNAME` / `SMS_PASSWORD` | sms.co.tz (login codes) |
| `MAIL_*` | SMTP for office emails |
| `STORAGE_HOST_DIR` / `HANDYMAN_IMG_HOST_DIR` | the Laravel photo folders, to keep existing photos |

Put the Firebase key in `secrets/credentials-file.json` (`chmod 600`).

The DNS records for all `SERVER_NAMES` must point to this server before step 6.

### 4. Database

**Moving from Laravel** (`php artisan down` first, then export the MySQL database to `fixchap.sql`):

```bash
scripts/migrate-from-dump.sh /path/to/fixchap.sql   # prints ✓ for every table whose row count matches
scripts/end-old-sessions.sh                          # app users log in again (old session codes were guessable)
```

**Or a fresh install:**

```bash
docker compose up -d db
scripts/init-db.sh
```

### 5. Start

```bash
./deployme.sh
```

With no certificate yet, nginx starts in HTTP-only mode and the site works on `http://`.

### 6. HTTPS

```bash
./sslrenew.sh
```

The first run requests a certificate for every name in `SERVER_NAMES` and switches nginx to HTTPS, with HTTP redirecting to HTTPS. Then schedule renewals:

```bash
crontab -e
# renew weekly (only renews when less than 30 days are left), back up the database nightly
0 3 * * 1 /opt/deployments/fixchap-deploy/sslrenew.sh >> /opt/deployments/fixchap-deploy/backups/ssl.log 2>&1
0 2 * * * /opt/deployments/fixchap-deploy/scripts/backup-db.sh >> /opt/deployments/fixchap-deploy/backups/backup.log 2>&1
```

### 7. Dashboard login

Migrated users keep their passwords. To add one or reset a password:

```bash
scripts/create-admin.sh <username> <email> admin     # or: staff
```

## Daily use

| Task | Command |
|---|---|
| Release a new version | computer: `./packing.sh` → server: `git pull && ./deployme.sh` |
| Which build is running | `cat dist/VERSION.json` |
| Status | `docker compose ps` |
| App logs | `docker compose logs -f app` |
| nginx logs | `docker compose logs -f nginx` |
| Restart the app | `docker compose restart app` |
| Stop everything (data is kept) | `docker compose down` |
| Backup now / restore | `scripts/backup-db.sh` / `scripts/restore-db.sh backups/<file>.dump` |
| Database shell | `docker compose exec db psql -U fixchap fixchap` |
| Renew HTTPS now | `./sslrenew.sh` |

Copy `backups/` to another machine regularly; a backup on the same disk doesn't help if the server is lost.

## Problems with .env

Run `./scripts/check-env.sh` (`deployme.sh` also runs it). It points to the exact line, and fixes Windows line endings by itself.

- **`.env not found`**: `.env` is not in git, so create it on the server with `cp .env.example .env && nano .env`.
- **Format**: one `KEY=value` per line. Values with spaces, `&`, `;`, `(` or `!` work as they are; quotes are optional (`SERVER_NAMES="a.tz b.tz"`).
- **`# FixChap — Docker deployment

Everything the server needs to run FixChap: the public website, the staff dashboard and the API for the FixChap and Fundi apps (one Next.js container), PostgreSQL, and nginx with Let's Encrypt HTTPS.

```
fixchap-deploy/                    (a git repository, pulled on the server)
  dist.zip            the built app — made by fixchap-next/packing.sh
  deployme.sh         unzip + nginx config + docker-compose up --build
  sslrenew.sh         first HTTPS certificate, then renewals
  Dockerfile          image for the app (from the unzipped dist/)
  docker-compose.yml  app + PostgreSQL + nginx (+ certbot and migration tools on demand)
  nginx-prod/         nginx config (templates/ = HTTPS, bootstrap/ = HTTP-only until the first certificate)
  .env.example        settings template → copy to .env on the server
  secrets/            Firebase credentials-file.json (not in git)
  database/           schema and the MySQL → Postgres migration template
  scripts/            migrate, backups, restore, create-admin, end-old-sessions
```

Not in git (see `.gitignore`): `.env`, `secrets/`, `backups/`, `data/` (photos), `certbot/` (certificates), and the unzipped `dist/` and `nginx/`.

## How a release works

**On your computer** (in `fixchap-next`):

```bash
./packing.sh
```

It installs packages, builds the production app (`npm run forprodlocal`), zips it into `../fixchap-deploy/dist.zip`, and commits and pushes this repository. Local `.env` files are removed from the build, and the script refuses to finish if any remain.

The public address is baked into the build, so `fixchap-next/.env.production` must exist (copy `.env.production.example`):

```
APP_URL=https://fixchap.co.tz
NEXT_PUBLIC_GOOGLE_MAPS_KEY=
```

**On the server:**

```bash
cd /opt/deployments/fixchap-deploy
git pull
./deployme.sh
```

## First-time server setup

### 1. Docker

```bash
curl -fsSL https://get.docker.com | sudo sh
sudo usermod -aG docker $USER      # log out and back in
docker compose version
```

Ports 80 and 443 must be free: nginx runs inside Docker. If the old Laravel site's nginx or Apache uses them, stop it at cutover (`sudo systemctl stop nginx` / `apache2`), or set `HTTP_PORT`/`HTTPS_PORT` in `.env` for a test run on other ports.

### 2. Get the files

```bash
sudo mkdir -p /opt/deployments && sudo chown $USER /opt/deployments
cd /opt/deployments
git clone <your fixchap-deploy repository url> fixchap-deploy
cd fixchap-deploy
```

(One-time, on your computer, if the deploy folder isn't a git repository yet: `cd fixchap-deploy && git init -b main && git remote add origin <url> && git add . && git commit -m "initial" && git push -u origin main`.)

### 3. Settings

```bash
cp .env.example .env
nano .env
```

| Setting | Value |
|---|---|
| `APP_URL` | public address, same as in `.env.production` (e.g. `https://fixchap.co.tz`) |
| `SERVER_NAMES` | every domain nginx serves, **in quotes**, e.g. `"fixchap.co.tz www.fixchap.co.tz admin.fixchap.co.tz"`. Include `admin.fixchap.co.tz` so the mobile apps keep working without a new release |
| `PRIMARY_DOMAIN` | the first of those names |
| `LETSENCRYPT_EMAIL` | where certificate expiry warnings go |
| `POSTGRES_PASSWORD` | `openssl rand -hex 24` |
| `AUTH_SECRET` | `openssl rand -hex 32` |
| `APP_TIMEZONE` | same as the Laravel `.env` (usually `UTC`) |
| `SMS_USERNAME` / `SMS_PASSWORD` | sms.co.tz (login codes) |
| `MAIL_*` | SMTP for office emails |
| `STORAGE_HOST_DIR` / `HANDYMAN_IMG_HOST_DIR` | the Laravel photo folders, to keep existing photos |

Put the Firebase key in `secrets/credentials-file.json` (`chmod 600`).

The DNS records for all `SERVER_NAMES` must point to this server before step 6.

### 4. Database

**Moving from Laravel** (`php artisan down` first, then export the MySQL database to `fixchap.sql`):

```bash
scripts/migrate-from-dump.sh /path/to/fixchap.sql   # prints ✓ for every table whose row count matches
scripts/end-old-sessions.sh                          # app users log in again (old session codes were guessable)
```

**Or a fresh install:**

```bash
docker compose up -d db
scripts/init-db.sh
```

### 5. Start

```bash
./deployme.sh
```

With no certificate yet, nginx starts in HTTP-only mode and the site works on `http://`.

### 6. HTTPS

```bash
./sslrenew.sh
```

The first run requests a certificate for every name in `SERVER_NAMES` and switches nginx to HTTPS, with HTTP redirecting to HTTPS. Then schedule renewals:

```bash
crontab -e
# renew weekly (only renews when less than 30 days are left), back up the database nightly
0 3 * * 1 /opt/deployments/fixchap-deploy/sslrenew.sh >> /opt/deployments/fixchap-deploy/backups/ssl.log 2>&1
0 2 * * * /opt/deployments/fixchap-deploy/scripts/backup-db.sh >> /opt/deployments/fixchap-deploy/backups/backup.log 2>&1
```

### 7. Dashboard login

Migrated users keep their passwords. To add one or reset a password:

```bash
scripts/create-admin.sh <username> <email> admin     # or: staff
```

## Daily use

| Task | Command |
|---|---|
| Release a new version | computer: `./packing.sh` → server: `git pull && ./deployme.sh` |
| Which build is running | `cat dist/VERSION.json` |
| Status | `docker compose ps` |
| App logs | `docker compose logs -f app` |
| nginx logs | `docker compose logs -f nginx` |
| Restart the app | `docker compose restart app` |
| Stop everything (data is kept) | `docker compose down` |
| Backup now / restore | `scripts/backup-db.sh` / `scripts/restore-db.sh backups/<file>.dump` |
| Database shell | `docker compose exec db psql -U fixchap fixchap` |
| Renew HTTPS now | `./sslrenew.sh` |

Copy `backups/` to another machine regularly; a backup on the same disk doesn't help if the server is lost.

 in a value** (often in passwords): Docker Compose treats it as a variable and changes the value. Put the value in single quotes (`POSTGRES_PASSWORD='ab$cd'`) or use a password without `# FixChap — Docker deployment

Everything the server needs to run FixChap: the public website, the staff dashboard and the API for the FixChap and Fundi apps (one Next.js container), PostgreSQL, and nginx with Let's Encrypt HTTPS.

```
fixchap-deploy/                    (a git repository, pulled on the server)
  dist.zip            the built app — made by fixchap-next/packing.sh
  deployme.sh         unzip + nginx config + docker-compose up --build
  sslrenew.sh         first HTTPS certificate, then renewals
  Dockerfile          image for the app (from the unzipped dist/)
  docker-compose.yml  app + PostgreSQL + nginx (+ certbot and migration tools on demand)
  nginx-prod/         nginx config (templates/ = HTTPS, bootstrap/ = HTTP-only until the first certificate)
  .env.example        settings template → copy to .env on the server
  secrets/            Firebase credentials-file.json (not in git)
  database/           schema and the MySQL → Postgres migration template
  scripts/            migrate, backups, restore, create-admin, end-old-sessions
```

Not in git (see `.gitignore`): `.env`, `secrets/`, `backups/`, `data/` (photos), `certbot/` (certificates), and the unzipped `dist/` and `nginx/`.

## How a release works

**On your computer** (in `fixchap-next`):

```bash
./packing.sh
```

It installs packages, builds the production app (`npm run forprodlocal`), zips it into `../fixchap-deploy/dist.zip`, and commits and pushes this repository. Local `.env` files are removed from the build, and the script refuses to finish if any remain.

The public address is baked into the build, so `fixchap-next/.env.production` must exist (copy `.env.production.example`):

```
APP_URL=https://fixchap.co.tz
NEXT_PUBLIC_GOOGLE_MAPS_KEY=
```

**On the server:**

```bash
cd /opt/deployments/fixchap-deploy
git pull
./deployme.sh
```

## First-time server setup

### 1. Docker

```bash
curl -fsSL https://get.docker.com | sudo sh
sudo usermod -aG docker $USER      # log out and back in
docker compose version
```

Ports 80 and 443 must be free: nginx runs inside Docker. If the old Laravel site's nginx or Apache uses them, stop it at cutover (`sudo systemctl stop nginx` / `apache2`), or set `HTTP_PORT`/`HTTPS_PORT` in `.env` for a test run on other ports.

### 2. Get the files

```bash
sudo mkdir -p /opt/deployments && sudo chown $USER /opt/deployments
cd /opt/deployments
git clone <your fixchap-deploy repository url> fixchap-deploy
cd fixchap-deploy
```

(One-time, on your computer, if the deploy folder isn't a git repository yet: `cd fixchap-deploy && git init -b main && git remote add origin <url> && git add . && git commit -m "initial" && git push -u origin main`.)

### 3. Settings

```bash
cp .env.example .env
nano .env
```

| Setting | Value |
|---|---|
| `APP_URL` | public address, same as in `.env.production` (e.g. `https://fixchap.co.tz`) |
| `SERVER_NAMES` | every domain nginx serves, **in quotes**, e.g. `"fixchap.co.tz www.fixchap.co.tz admin.fixchap.co.tz"`. Include `admin.fixchap.co.tz` so the mobile apps keep working without a new release |
| `PRIMARY_DOMAIN` | the first of those names |
| `LETSENCRYPT_EMAIL` | where certificate expiry warnings go |
| `POSTGRES_PASSWORD` | `openssl rand -hex 24` |
| `AUTH_SECRET` | `openssl rand -hex 32` |
| `APP_TIMEZONE` | same as the Laravel `.env` (usually `UTC`) |
| `SMS_USERNAME` / `SMS_PASSWORD` | sms.co.tz (login codes) |
| `MAIL_*` | SMTP for office emails |
| `STORAGE_HOST_DIR` / `HANDYMAN_IMG_HOST_DIR` | the Laravel photo folders, to keep existing photos |

Put the Firebase key in `secrets/credentials-file.json` (`chmod 600`).

The DNS records for all `SERVER_NAMES` must point to this server before step 6.

### 4. Database

**Moving from Laravel** (`php artisan down` first, then export the MySQL database to `fixchap.sql`):

```bash
scripts/migrate-from-dump.sh /path/to/fixchap.sql   # prints ✓ for every table whose row count matches
scripts/end-old-sessions.sh                          # app users log in again (old session codes were guessable)
```

**Or a fresh install:**

```bash
docker compose up -d db
scripts/init-db.sh
```

### 5. Start

```bash
./deployme.sh
```

With no certificate yet, nginx starts in HTTP-only mode and the site works on `http://`.

### 6. HTTPS

```bash
./sslrenew.sh
```

The first run requests a certificate for every name in `SERVER_NAMES` and switches nginx to HTTPS, with HTTP redirecting to HTTPS. Then schedule renewals:

```bash
crontab -e
# renew weekly (only renews when less than 30 days are left), back up the database nightly
0 3 * * 1 /opt/deployments/fixchap-deploy/sslrenew.sh >> /opt/deployments/fixchap-deploy/backups/ssl.log 2>&1
0 2 * * * /opt/deployments/fixchap-deploy/scripts/backup-db.sh >> /opt/deployments/fixchap-deploy/backups/backup.log 2>&1
```

### 7. Dashboard login

Migrated users keep their passwords. To add one or reset a password:

```bash
scripts/create-admin.sh <username> <email> admin     # or: staff
```

## Daily use

| Task | Command |
|---|---|
| Release a new version | computer: `./packing.sh` → server: `git pull && ./deployme.sh` |
| Which build is running | `cat dist/VERSION.json` |
| Status | `docker compose ps` |
| App logs | `docker compose logs -f app` |
| nginx logs | `docker compose logs -f nginx` |
| Restart the app | `docker compose restart app` |
| Stop everything (data is kept) | `docker compose down` |
| Backup now / restore | `scripts/backup-db.sh` / `scripts/restore-db.sh backups/<file>.dump` |
| Database shell | `docker compose exec db psql -U fixchap fixchap` |
| Renew HTTPS now | `./sslrenew.sh` |

Copy `backups/` to another machine regularly; a backup on the same disk doesn't help if the server is lost.

 (`openssl rand -hex 24`).
- **Database password changed after the first start**: PostgreSQL keeps the password it was created with. Either set it back, or change it inside the database with `docker compose exec db psql -U fixchap -c "ALTER USER fixchap PASSWORD 'new'"`.

## Checks after going live

- `https://<domain>/`, `/pricing`, `/login` → dashboard
- `https://<domain>/api/health` → `{"status":"ok","database":"ok"}`
- Both apps: log in with a real number (SMS arrives), post a request with a photo, accept it in the Fundi app, and check push notifications.
- Old photos show on request pages (if the photo folders point at Laravel's).

## Notes

- **Size of the git repository:** `dist.zip` (~25 MB) is committed on every release, so the repository grows. The commented `git filter-repo` lines in `packing.sh` remove old copies from history when it gets too big.
- **Building on a Mac:** `dist/` is built on macOS, and the Dockerfile installs the Linux version of the image library during `docker compose build`. So the server needs internet access when building.
- **Rebuilding for build-time settings:** `APP_URL` and the Google Maps key are baked in by `packing.sh`. Change them in `fixchap-next/.env.production` and release again. Other settings only need `docker compose up -d` on the server.
- **Network exposure:** the app port (3000) and PostgreSQL are only reachable from the server itself. All public traffic goes through nginx.
