FROM alpine

WORKDIR /app
RUN apk add --no-cache tree
ADD . .

RUN tree -a