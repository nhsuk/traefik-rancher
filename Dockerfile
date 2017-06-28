FROM traefik:1.3-alpine

COPY traefik.toml /etc/traefik/traefik.toml

COPY docker-entrypoint.sh /

ENTRYPOINT ["sh", "/docker-entrypoint.sh"]

CMD ["/usr/local/bin/traefik"]
