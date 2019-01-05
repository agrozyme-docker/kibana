FROM agrozyme/alpine:3.8
COPY source /

RUN set -euxo pipefail \
  && chmod +x /usr/local/bin/*.sh \
  # && apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing kibana \
  && apk add --no-cache nodejs \
  && wget -q -O /tmp/kibana.rpm https://artifacts.elastic.co/downloads/kibana/kibana-6.5.4-$(uname -m).rpm \
  && rpm --install --nodeps /tmp/kibana.rpm \
  && rm -rf /usr/share/kibana/node /tmp/kibana.rpm \
  && mkdir -p /var/log/kibana /usr/share/kibana/node/bin \
  && ln -s /usr/bin/node /usr/share/kibana/node/bin/node

EXPOSE 5601
CMD ["agrozyme.kibana.command.sh"]
