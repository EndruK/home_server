FROM grafana/grafana
ENV GF_PLUGINS_ALLOW_LOADING_UNSIGNED_PLUGINS=grafana-mqtt-datasource,grafana-azure-data-explorer-datasource
ENV GF_DATE_FORMATS_INTERVAL_SECOND="HH:mm:ss"
ENV GF_DATE_FORMATS_INTERVAL_MINUTE="HH:mm"
ENV GF_DATE_FORMATS_INTERVAL_HOUR="DD.MM. HH:mm"
ENV GF_DATE_FORMATS_INTERVAL_DAY="DD.MM."
ENV GF_DATE_FORMATS_INTERVAL_MONTH="YYYY-MM"
ENV GF_DATE_FORMATS_INTERVAL_YEAR="YYYY"
ENV GF_AUTH_ANONYMOUS_ENABLED=true
ENV GF_SECURITY_ALLOW_EMBEDDING=true
EXPOSE 3000
USER grafana
RUN grafana-cli plugins install grafana-azure-data-explorer-datasource
RUN grafana-cli plugins install frser-sqlite-datasource
ENTRYPOINT [ "/run.sh" ]
