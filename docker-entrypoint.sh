#!/bin/sh

if [ -n "$RANCHER_SERVER" ]; then
  sed -i "s/___RANCHER_SERVER___/${RANCHER_SERVER}/g" /etc/traefik/traefik.toml
fi

if [ -n "$RANCHER_ACCESS_KEY" ]; then
  sed -i "s/___RANCHER_ACCESS_KEY___/${RANCHER_ACCESS_KEY}/g" /etc/traefik/traefik.toml
fi

if [ -n "$RANCHER_SECRET_KEY" ]; then
  sed -i "s/___RANCHER_SECRET_KEY___/${RANCHER_SECRET_KEY}/g" /etc/traefik/traefik.toml
fi

if [ -n "$DEFAULT_DOMAIN" ]; then
  sed -i "s/___DEFAULT_DOMAIN___/${DEFAULT_DOMAIN}/g" /etc/traefik/traefik.toml
fi


exec "$@"
