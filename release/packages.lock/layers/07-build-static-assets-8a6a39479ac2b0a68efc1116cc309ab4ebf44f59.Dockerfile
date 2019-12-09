ARG BASE_IMAGE
FROM $BASE_IMAGE
COPY . ./
RUN go-bindata-assetfs -o bindata_assetfs.go -pkg http -prefix pkg -modtime 1480000000 -tags ui ./pkg/web_ui/...
RUN mkdir -p http && mv bindata_assetfs.go http/
RUN goimports -w http/bindata_assetfs.go