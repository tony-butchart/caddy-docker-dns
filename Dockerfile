FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/lucaslorentz/caddy-docker-proxy/v2 \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/tony-butchart/caddy-auto-windns

FROM caddy:latest

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["caddy", "docker-proxy"]