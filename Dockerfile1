FROM golang AS build-env
WORKDIR /go/src
COPY main.go . 
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

# final stage
FROM alpine
WORKDIR /root/
COPY --from=build-env /go/src/main .   
CMD ["./main"]
EXPOSE 8500
