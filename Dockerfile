FROM golang:alpine AS build-env
WORKDIR /go/src
COPY . /go/src/go-examples
RUN cd /go/src/go-examples && CGO_ENABLED=0 go build .

FROM scratch
WORKDIR /app
COPY --from=build-env /go/src/go-examples/go-examples /app
COPY --from=build-env /go/src/go-examples/assets/ /app/assets/

EXPOSE 8080
ENTRYPOINT [ "./go-examples" ]