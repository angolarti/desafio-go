FROM golang:1.17.1-alpine3.14 AS builder

WORKDIR /app
COPY . .
RUN go mod init angolar.com/m

RUN env GOOS=linux go build -o rooks

FROM scratch

WORKDIR /app
COPY --from=builder /app/rooks .

CMD [ "./rooks" ]