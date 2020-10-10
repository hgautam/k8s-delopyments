FROM scratch
EXPOSE 8080
ENTRYPOINT ["/go-examples"]
COPY ./bin/ /
COPY ./assets /