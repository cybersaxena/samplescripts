FROM golang:latest
RUN mkdir -p /go/src/github.com/autoscaler
ADD . /go/src/github.com/autoscaler
WORKDIR /go/src/github.com/autoscaler
RUN ls /go/src/github.com/autoscaler
ENV GOPATH="/go"
RUN export GOPATH
RUN go env
#RUN mkdir -p /go/src/github.com/autoscaler/oc-tool
#ADD oc-tool /go/src/github.com/autoscaler/oc-tool
#RUN ls /go/src/github.com/autoscaler/oc-tool
#RUN cd oc-tool
#ENV PATH="/go/src/github.com/autoscaler/oc-tool:$PATH"
#RUN export PATH
RUN cd /go/src/github.com/autoscaler
RUN go get -u github.com/gorilla/mux
RUN go get
RUN rm -rf /go/src/github.com/autoscaler/logs 
RUN mkdir -p /go/src/github.com/autoscaler/logs && chmod -R 777 /go/src/github.com/autoscaler/logs 
RUN go build
EXPOSE 8090
CMD ["./autoscaler"]

