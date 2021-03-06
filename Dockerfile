ARG GRAFANA_VERSION="latest"

FROM grafana/grafana:${GRAFANA_VERSION}

USER root

ENV GF_PATHS_PLUGINS="/var/lib/grafana-plugins"

RUN mkdir -p "$GF_PATHS_PLUGINS" && \
    chown -R grafana:grafana "$GF_PATHS_PLUGINS"

USER grafana

ARG GF_INSTALL_PLUGINS="flant-statusmap-panel"

RUN if [ ! -z "${GF_INSTALL_PLUGINS}" ]; then \
    OLDIFS=$IFS; \
    IFS=','; \
    for plugin in ${GF_INSTALL_PLUGINS}; do \
    IFS=$OLDIFS; \
    grafana-cli --pluginsDir "$GF_PATHS_PLUGINS" plugins install ${plugin}; \
    done; \
    fi

ENV GF_PATHS_PROVISIONING="/etc/grafana/provisioning"

COPY ./grafana "$GF_PATHS_PROVISIONING"

ENV GF_USERS_DEFAULT_THEME="light"

ENV GF_DASHBOARDS_DEFAULT_HOME_DASHBOARD_PATH='${GF_PATHS_PROVISIONING}/dashboards/home.json'

