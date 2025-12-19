ARG version=v3.6
FROM traefik:${version}

COPY docker-entrypoint-init.sh /docker-entrypoint-init.sh
RUN chmod +x /docker-entrypoint-init.sh

ENTRYPOINT ["/docker-entrypoint-init.sh", "/entrypoint.sh"]
CMD ["traefik"]
