#Dated 03/31/2020-DIGEST:sha256:9d43bebe9f3a5d27647231e1fa760644fafcc09a1ad85eeae1df40c491841bd9
FROM python:alpine AS dashboard-generator
RUN pip install grafanalib
# # COPY templates /tmp/templates
# RUN mkdir /tmp/rendered && \
# 	generate-dashboards /tmp/templates/* && \
# 	mv /tmp/templates/*.json /tmp/rendered

FROM grafana/grafana:latest
#
# COPY provisioning /etc/grafana/provisioning
# COPY dashboards /var/lib/grafana/dashboards
# COPY --from=dashboard-generator /tmp/rendered /var/lib/grafana/dashboards
# FROM debian:stretch-slim
#
# ARG GRAFANA_URL="https://dl.grafana.com/oss/release/grafana-6.7.1.linux-amd64.tar.gz"
# ARG GF_UID="472"
# ARG GF_GID="472"
#
# ENV PATH=/usr/share/grafana/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin \
#     GF_PATHS_CONFIG="/etc/grafana/grafana.ini" \
#     GF_PATHS_DATA="/var/lib/grafana" \
#     GF_PATHS_HOME="/usr/share/grafana" \
#     GF_PATHS_LOGS="/var/log/grafana" \
#     GF_PATHS_PLUGINS="/var/lib/grafana/plugins" \
#     GF_PATHS_PROVISIONING="/etc/grafana/provisioning"
#
# RUN apt-get update && apt-get install -qq -y tar libfontconfig curl ca-certificates && \
#     mkdir -p "$GF_PATHS_HOME/.aws" && \
#     curl "$GRAFANA_URL" | tar xfvz - --strip-components=1 -C "$GF_PATHS_HOME" && \
#     apt-get autoremove -y && \
#     rm -rf /var/lib/apt/lists/* && \
#     groupadd -r -g $GF_GID grafana && \
#     useradd -r -u $GF_UID -g grafana grafana && \
#     mkdir -p "$GF_PATHS_PROVISIONING/datasources" \
#              "$GF_PATHS_PROVISIONING/dashboards" \
#              "$GF_PATHS_LOGS" \
#              "$GF_PATHS_PLUGINS" \
#              "$GF_PATHS_DATA" && \
#     cp "$GF_PATHS_HOME/conf/sample.ini" "$GF_PATHS_CONFIG" && \
#     cp "$GF_PATHS_HOME/conf/ldap.toml" /etc/grafana/ldap.toml && \
#     chown -R grafana:grafana "$GF_PATHS_DATA" "$GF_PATHS_HOME/.aws" "$GF_PATHS_LOGS" "$GF_PATHS_PLUGINS" && \
#     chmod 777 "$GF_PATHS_DATA" "$GF_PATHS_HOME/.aws" "$GF_PATHS_LOGS" "$GF_PATHS_PLUGINS"
#
# EXPOSE 3000
#
# COPY ./run.sh /run.sh
#
# USER grafana
# WORKDIR /
# # ENTRYPOINT [ "/run.sh" ]
#
# CMD [ "/bin/bash", "-ce", "tail -f /dev/null" ]
