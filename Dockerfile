FROM golang:alpine AS build-env
WORKDIR /go/src
COPY . /go/src/go-examples
RUN ls -l
RUN cd /go/src/go-examples && go build .

FROM alpine
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk*
WORKDIR /app
COPY --from=build-env /go/src/go-examples/go-examples /app
COPY --from=build-env /go/src/go-examples/assets/ /app/assets/

EXPOSE 8080
ENTRYPOINT [ "./go-examples" ]