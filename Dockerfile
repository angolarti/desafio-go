FROM golang:1.17.1-alpine3.14 AS builder

WORKDIR /app
COPY . .
RUN go mod init angolar.com/m

RUN env GOOS=linux go build -o rocks

FROM scratch

WORKDIR /app
COPY --from=builder /app/rocks .

CMD [ "./rocks" ]