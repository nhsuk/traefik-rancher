FROM traefik

COPY traefik.toml /etc/traefik/traefik.toml

COPY docker-entrypoint.sh /

ENTRYPOINT ["sh", "/docker-entrypoint.sh"]

CMD ["/traefik"]
