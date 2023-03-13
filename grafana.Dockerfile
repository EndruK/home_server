#FROM golang:alpine as plugin-builder
#RUN apk add --no-cache yarn git nodejs npm
#RUN git clone https://github.com/magefile/mage --depth=1
#RUN git clone https://github.com/grafana/mqtt-datasource.git --depth=1
#RUN cd mage && go run bootstrap.go
#RUN cd mqtt-datasource && yarn install && yarn build
#
FROM grafana/grafana
#COPY --from=plugin-builder /go/mqtt-datasource $GF_PATHS_PLUGINS/mqtt-datasource
ENV GF_PLUGINS_ALLOW_LOADING_UNSIGNED_PLUGINS=grafana-mqtt-datasource,grafana-azure-data-explorer-datasource
EXPOSE 3000
USER grafana
RUN grafana-cli plugins install grafana-azure-data-explorer-datasource
RUN grafana-cli plugins install frser-sqlite-datasource
ENTRYPOINT [ "/run.sh" ]