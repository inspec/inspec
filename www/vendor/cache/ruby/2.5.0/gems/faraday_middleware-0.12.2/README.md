Faraday Middleware
==================

A collection of useful [Faraday][] middleware. [See the documentation][docs].

    gem install faraday_middleware

Dependencies
------------

Some dependent libraries are needed only when using specific middleware:

* FaradayMiddleware::EncodeJson & FaradayMiddleware::ParseJson: "json"
  for ruby older than 1.9
* FaradayMiddleware::ParseXml: "multi_xml"
* FaradayMiddleware::OAuth: "simple_oauth"
* FaradayMiddleware::Mashify: "hashie"
* FaradayMiddleware::Rashify: "rash_alt" (Make sure to uninstall original rash gem to avoid conflict)
* FaradayMiddleware::Instrumentation: "activesupport"

Examples
--------

``` rb
require 'faraday_middleware'

## in Faraday 0.8 or above:
connection = Faraday.new 'http://example.com/api' do |conn|
  conn.request :oauth2, 'TOKEN'
  conn.request :json

  conn.response :xml,  :content_type => /\bxml$/
  conn.response :json, :content_type => /\bjson$/

  conn.use :instrumentation
  conn.adapter Faraday.default_adapter
end

## with Faraday 0.7:
connection = Faraday.new 'http://example.com/api' do |builder|
  builder.use FaradayMiddleware::OAuth2, 'TOKEN'
  builder.use FaradayMiddleware::EncodeJson

  builder.use FaradayMiddleware::ParseXml,  :content_type => /\bxml$/
  builder.use FaradayMiddleware::ParseJson, :content_type => /\bjson$/

  builder.use FaradayMiddleware::Instrumentation
  builder.adapter Faraday.default_adapter
end
```


  [faraday]: https://github.com/lostisland/faraday#readme
  [docs]: https://github.com/lostisland/faraday_middleware/wiki
