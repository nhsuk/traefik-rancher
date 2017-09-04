#!/usr/bin/env bash

function log {
        echo `date` $ME - $@
}

function serviceCheck {
    log "[ Generating ${SERVICE_NAME} configuration... ]"
    ${SERVICE_HOME}/bin/traefik.toml.sh
}

function deployCerts {
  echo "$TRAEFIK_SSL_CERT" > ${SERVICE_HOME}/certs/ssl.crt
  echo "$TRAEFIK_SSL_KEY"  > ${SERVICE_HOME}/certs/ssl.key
}

function serviceStart {
    serviceCheck
    deployCerts
    ${SERVICE_HOME}/bin/traefik --configFile=${SERVICE_HOME}/etc/traefik.toml
    echo $! > ${SERVICE_HOME}/traefik.pid
    log $(cat ${SERVICE_HOME}/traefik.pid)
}

if [ "$@" == "traefik" ]; then
  serviceStart
else
  exec "$@"
fi
