FROM golang:1.18.3-alpine as dev

ENV ROOT=/go/src/app
ENV CGO_ENABLED 0
WORKDIR ${ROOT}

RUN apk update && apk add git
COPY go.mod go.sum ./
RUN go mod download

ENV DB_USER recipinder
ENV DB_PASSWORD recipinder_pass
ENV DB_IP mysql
ENV DB_PORT 3306
ENV DB_NAME recipinder

EXPOSE 8080
EXPOSE 9000
CMD ["go", "run", "main.go"]