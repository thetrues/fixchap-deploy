# FixChap — website, dashboard and mobile API (Next.js), from the prebuilt ./dist
# (made on the developer machine by `fixchap-next/packing.sh`, shipped as dist.zip, unzipped by deployme.sh).
FROM node:22-alpine
WORKDIR /app
ENV NODE_ENV=production \
    NEXT_TELEMETRY_DISABLED=1 \
    PORT=3000 \
    HOSTNAME=0.0.0.0

# Fixed uid/gid 1001 so host folders for uploaded photos can be given to this user (deployme.sh does it)
RUN addgroup -S -g 1001 fixchap && adduser -S -u 1001 -G fixchap fixchap \
 && mkdir -p /data/storage /data/handyman_img /app/secrets

COPY dist/ ./

# dist/ was built on macOS; install the Linux build of the image library (used for website images)
RUN SHARP_VERSION=$(node -p "require('./node_modules/sharp/package.json').version") \
 && rm -rf node_modules/sharp node_modules/@img \
 && mkdir -p /tmp/sharp && cd /tmp/sharp && npm init -y >/dev/null \
 && npm install --no-audit --no-fund --omit=dev "sharp@$SHARP_VERSION" \
 && cp -R node_modules/sharp node_modules/@img /app/node_modules/ \
 && cp -Rn node_modules/. /app/node_modules/ \
 && cd / && rm -rf /tmp/sharp /root/.npm \
 && chown -R fixchap:fixchap /app /data

USER fixchap
EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=5s --start-period=30s --retries=3 \
  CMD wget -qO- http://127.0.0.1:3000/api/health >/dev/null || exit 1
CMD ["node", "server.js"]
