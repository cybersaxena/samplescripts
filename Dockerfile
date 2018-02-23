FROM golang:latest
RUN mkdir -p /go/src/github.com/app
ADD . /go/src/github.com/app  
WORKDIR /go/src/github.com/app
RUN ls /go/src/github.com/app
ENV GOPATH="/go"
RUN export GOPATH
RUN go env
#RUN mkdir -p /go/src/github.com/app/oc-tool
#ADD oc-tool /go/src/github.com/app/oc-tool
#RUN ls /go/src/github.com/app/oc-tool
#RUN cd oc-tool
#ENV PATH="/go/src/github.com/app/oc-tool:$PATH"
#RUN export PATH
RUN cd /go/src/github.com/app
RUN go get -u github.com/gorilla/mux
RUN go get
RUN rm -rf /go/src/github.com/app/logs 
RUN mkdir -p /go/src/github.com/app/logs && chmod -R 777 /go/src/github.com/app/logs 
RUN go build
EXPOSE 8090
CMD ["./app"]

