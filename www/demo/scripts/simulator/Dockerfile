FROM ruby:alpine

# install libraries
RUN apk add --update build-base libxml2-dev libffi-dev

# copy gems
COPY install /install
RUN cd /install && sh bootstrap.sh

COPY filesystem /filesystem

WORKDIR /filesystem
CMD ["/bin/sh"]
