FROM openjdk:11-jre-slim

ENV OPENFIRE_VERSION=5.0.1

RUN apt-get update && apt-get install -y wget gnupg && \
    wget https://www.igniterealtime.org/downloadServlet?filename=openfire/openfire_${OPENFIRE_VERSION}_all.deb -O openfire.deb && \
    dpkg -i openfire.deb || apt-get install -f -y && \
    rm openfire.deb && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 5222 5223 7070 7443 9090 9091

CMD ["/opt/openfire/bin/openfire.sh"]
