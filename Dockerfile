FROM caddy:alpine

RUN printf ':10000 {\n\
    reverse_proxy https://integrate.api.nvidia.com {\n\
        header_up Host integrate.api.nvidia.com\n\
        header_up -X-Forwarded-For\n\
        header_up -X-Real-IP\n\
        header_up -CF-Connecting-IP\n\
    }\n\
}\n' > /etc/caddy/Caddyfile

EXPOSE 10000
CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile"]
