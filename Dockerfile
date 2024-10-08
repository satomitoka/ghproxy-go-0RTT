FROM wjqserver/caddy:latest

RUN mkdir -p /data/www
RUN mkdir -p /data/ghproxy/config
RUN mkdir -p /data/ghproxy/log
RUN wget -O /data/www/index.html https://raw.githubusercontent.com/WJQSERVER/ghproxy-go-0RTT/main/pages/index.html
RUN wget -O /data/www/favicon.ico https://raw.githubusercontent.com/WJQSERVER/ghproxy-go-0RTT/main/pages/favicon.ico
RUN wget -O /data/caddy/Caddyfile https://raw.githubusercontent.com/WJQSERVER/ghproxy-go-0RTT/main/Caddyfile
RUN VERSION=$(curl -s https://raw.githubusercontent.com/WJQSERVER/ghproxy-go-0RTT/main/VERSION) && \
    wget -O /data/ghproxy/ghproxy https://github.com/WJQSERVER/ghproxy-go-0RTT/releases/download/$VERSION/ghproxy
RUN wget -O /data/ghproxy/config.yaml https://raw.githubusercontent.com/WJQSERVER/ghproxy-go-0RTT/main/config/config.yaml
RUN wget -O /usr/local/bin/init.sh https://raw.githubusercontent.com/WJQSERVER/ghproxy-go-0RTT/main/init.sh
RUN chmod +x /data/ghproxy/ghproxy
RUN chmod +x /usr/local/bin/init.sh

CMD ["/usr/local/bin/init.sh"]

