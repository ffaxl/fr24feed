FROM debian:latest
MAINTAINER Evgeniy Slizevich <evgeniy@slizevich.net>

WORKDIR /

RUN apt-get update && apt-get install -y wget gawk && rm -rf /var/lib/apt/lists/*
RUN wget -qO - `wget -qO - http://feed.flightradar24.com/ | grep -Eo 'http://.*?fr24feed_.*?_amd64.tgz'` | tar xzf -

ADD fr24feed /fr24feed

EXPOSE 8754

ENTRYPOINT ["/fr24feed"]
