FROM alpine:3.5

# Set environment
ENV SERVICE_NAME=traefik \
    SERVICE_HOME=/opt/traefik \
    SERVICE_VERSION=v1.3.5 \
    SERVICE_URL=https://github.com/containous/traefik/releases/download
ENV SERVICE_RELEASE=${SERVICE_URL}/${SERVICE_VERSION}/traefik_linux-amd64 \
    PATH=${PATH}:${SERVICE_HOME}/bin

# Download and install traefik
RUN apk add --no-cache bash curl ca-certificates && \
    mkdir -p -- ${SERVICE_HOME}/bin ${SERVICE_HOME}/etc ${SERVICE_HOME}/log ${SERVICE_HOME}/certs ${SERVICE_HOME}/acme && \
    cd ${SERVICE_HOME}/bin && \
    curl -L "${SERVICE_RELEASE}" -O && \
    mv traefik_linux-amd64 traefik && \
    chmod +x ${SERVICE_HOME}/bin/traefik && \
    apk del curl


ADD opt /opt/
RUN chmod +x ${SERVICE_HOME}/bin/*

EXPOSE 8000
EXPOSE 80
EXPOSE 443

WORKDIR $SERVICE_HOME
ENTRYPOINT ["/opt/traefik/bin/traefik-service.sh","start"]
