FROM traefik

COPY traefik.toml /etc/traefik/traefik.toml

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/traefik"]
