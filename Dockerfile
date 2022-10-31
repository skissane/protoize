FROM debian/eol:wheezy
RUN apt-get update && apt-get install -y gcc protoize
RUN mkdir -p /work
WORKDIR /work
