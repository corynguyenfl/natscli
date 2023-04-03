FROM golang:1.19-alpine as builder

WORKDIR /app

COPY . .
RUN go build nats/main.go

# build running image
FROM alpine:3.16

COPY --from=builder /app/main /usr/local/bin/

WORKDIR /usr/local/bin/

ENTRYPOINT ["main"]
