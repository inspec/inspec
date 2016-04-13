FROM ruby:alpine
RUN mkdir /share
RUN apk add --update \
  build-base \
  libxml2-dev \
  libffi-dev
RUN gem install inspec --no-document
ENTRYPOINT ["inspec"]
CMD ["help"]
VOLUME ["/share"]
WORKDIR /share
