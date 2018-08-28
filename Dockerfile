FROM golang:alpine AS build-env
RUN addgroup -S lusers && adduser -h /home/luser1 -S -G lusers luser1 
USER luser1
RUN mkdir -p /home/luser1/main
WORKDIR /home/luser1/main
ADD . /home/luser1/main
COPY main.go . 
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

# final stage
FROM alpine
RUN addgroup -S lusers && adduser -h /home/luser1 -S -G lusers luser1
USER luser1
RUN mkdir -p /home/luser1/main
WORKDIR /home/luser1/main
COPY --from=build-env /home/luser1/main .   
CMD ["./main"]
EXPOSE 8500
