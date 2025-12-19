FROM traefik:v3.6

COPY docker-entrypoint-init.sh /docker-entrypoint-init.sh
RUN chmod +x /docker-entrypoint-init.sh

ENTRYPOINT ["/docker-entrypoint-init.sh", "/entrypoint.sh"]
CMD ["traefik"]
