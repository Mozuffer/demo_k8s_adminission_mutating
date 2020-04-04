FROM golang:alpine AS build-env

ADD src /src
WORKDIR /src
RUN go mod init github.com/mozuffer/demo_k8s_adminission_mutating && \
    go get -v ./... && \
    go build -o main

# final stage
FROM alpine
WORKDIR /app
COPY --from=build-env /src/main /app/
ENTRYPOINT ./main