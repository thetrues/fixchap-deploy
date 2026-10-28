Put the Firebase service-account file here as `credentials-file.json`
(the same file as `FixChap/credentials-file.json` in the Laravel project — ideally a newly created key).

This folder is mounted read-only into the app container at /app/secrets.
Keep it private: `chmod 600 credentials-file.json`.
