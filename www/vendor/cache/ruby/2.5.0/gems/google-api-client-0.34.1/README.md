# Google API Client [![Documentation](https://img.shields.io/badge/docs-Google%3A%3AApis-red.svg)](https://googleapis.dev/ruby/google-api-client/latest/Google/Apis.html) [![Gem Version](https://badge.fury.io/rb/google-api-client.svg)](https://badge.fury.io/rb/google-api-client)

These client libraries are officially supported by Google.  However, the libraries are considered complete and are in maintenance mode. This means that we will address critical bugs and security issues but will not add any new features.

## Google Cloud Platform

For Google Cloud Platform APIs such as Datastore, Cloud Storage or Pub/Sub, we recommend using [GoogleCloudPlatform/google-cloud-ruby](https://github.com/GoogleCloudPlatform/google-cloud-ruby) which is under active development.

## Migrating from 0.8.x

See [MIGRATING](MIGRATING.md) for additional details on how to migrate to the latest version.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'google-api-client', '~> 0.11'

```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install google-api-client

## Usage

### Basic usage

To use an API, include the corresponding generated file and instantiate the service. For example to use the Drive API:

```ruby
require 'google/apis/drive_v2'

Drive = Google::Apis::DriveV2 # Alias the module
drive = Drive::DriveService.new
drive.authorization = ... # See Googleauth or Signet libraries

# Search for files in Drive (first page only)
files = drive.list_files(q: "title contains 'finances'")
files.items.each do |file|
  puts file.title
end

# Upload a file
metadata = Drive::File.new(title: 'My document')
metadata = drive.insert_file(metadata, upload_source: 'test.txt', content_type: 'text/plain')

# Download a file
drive.get_file(metadata.id, download_dest: '/tmp/myfile.txt')
```
### Naming conventions vs JSON representation

Object properties in the ruby client use the standard ruby convention for naming -- snake_case. This differs from the underlying JSON representation which typically uses camelCase for properties. There are a few notable exceptions to this rule:

* For properties that are defined as hashes with user-defined keys, no translation is performed on the key.
* For embedded field masks in requests (for example, the Sheets API), specify the camelCase form when referencing fields.

Outside those exceptions, if a property is specified using camelCase in a request, it will be ignored during serialization and omitted from the request.

### Media

Methods that allow media operations have additional parameters to specify the upload source or download destination.

For uploads, the `upload_source` parameter can be specified with either a path to a file, an `IO` stream, or `StringIO`
instance.

For downloads, the `download_dest` parameter can also be either a path to a file, an `IO` stream, or `StringIO` instance.

Both uploads & downloads are resumable. If an error occurs during transmission the request will be automatically
retried from the last received byte.

### Errors & Retries

Retries are disabled by default, but enabling retries is strongly encouraged. The number of retries can be configured
via `Google::Apis::RequestOptions`. Any number greater than 0 will enable retries.

To enable retries for all services:

```ruby
Google::Apis::RequestOptions.default.retries = 5
```

With retries enabled globally, retries can be disabled for specific calls by including a retry value of 0 in the
request options:

```ruby
drive.insert_file(metadata, upload_source: 'test.txt', content_type: 'text/plain', options: { retries: 0 })
```

When retries are enabled, if a server or rate limit error occurs during a request it is automatically retried with
an exponentially increasing delay on subsequent retries. If a request can not be retried or if the maximum number
of retries is exceeded, an exception is thrown.

### Callbacks

A block can be specified when making calls. If present, the block will be called with the result or error, rather than
returning the result from the call or raising the error. Example:

```ruby
# Search for files in Drive (first page only)
drive.list_files(q: "title contains 'finances'") do |res, err|
  if err
    # Handle error
  else
    # Handle response
  end
end
```

This calling style is required when making batch requests as responses are not available until the entire batch
is complete.

### Paging

To fetch multiple pages of data, use the `fetch_all` method to wrap the paged query. This returns an
`Enumerable` that automatically fetches additional pages as needed.

```ruby
# List all calendar events
now = Time.now.iso8601
items = calendar.fetch_all do |token|
  calendar.list_events('primary',
                        single_events: true,
                        order_by: 'startTime',
                        time_min: now,
                        page_token: token)
end
items.each { |event| puts event.summary }
```

For APIs that use a field other than `items` to contain the results, an alternate field name can be supplied.

```ruby
# List all files in Drive
items = drive.fetch_all(items: :files) { |token| drive.list_files(page_token: token) }
items.each { |file| puts file.name }
```

### Batches

Multiple requests can be batched together into a single HTTP request to reduce overhead. Batched calls are executed
in parallel and the responses processed once all results are available


```ruby
# Fetch a bunch of files by ID
ids = ['file_id_1', 'file_id_2', 'file_id_3', 'file_id_4']
drive.batch do |drive|
  ids.each do |id|
    drive.get_file(id) do |res, err|
      # Handle response
    end
  end
end
```

Media operations -- uploads & downloads -- can not be included in batch with other requests.

However, some APIs support batch uploads. To upload multiple files in a batch, use the `batch_upload` method instead.
Batch uploads should only be used when uploading multiple small files. For large files, upload files individually to
take advantage of the libraries built-in resumable upload support.

### Hashes

While the API will always return instances of schema classes, plain hashes are accepted in method calls for
convenience. Hash keys must be symbols matching the attribute names on the corresponding object the hash is meant
to replace. For example:

```ruby
file = {id: '123', title: 'My document', labels: { starred: true }}
file = drive.create_file(file, {}) # Returns a Drive::File instance
```

is equivalent to:

```ruby
file = Drive::File.new(id: '123', title: 'My document')
file.labels = Drive::File::Labels.new(starred: true)
file = drive.update_file(file) # Returns a Drive::File instance
```

IMPORTANT: Be careful when supplying hashes for request objects. If it is the last argument to a method, ruby will interpret the hash as keyword arguments. To prevent this, appending an empty hash as an extra parameter will avoid misinterpretation.

```ruby
file = {id: '123', title: 'My document', labels: { starred: true }}
file = drive.create_file(file) # Raises ArgumentError: unknown keywords: id, title, labels
file = drive.create_file(file, {}) # Returns a Drive::File instance
```

### Using raw JSON

To handle JSON serialization or deserialization in the application, set `skip_serialization` or
or `skip_deserializaton` options respectively. When setting `skip_serialization` in a request,
the body object must be a string representing the serialized JSON.

When setting `skip_deserialization` to true, the response from the API will likewise
be a string containing the raw JSON from the server.

## Authorization

[OAuth 2](https://developers.google.com/accounts/docs/OAuth2) is used to authorize applications. This library uses
both [Signet](https://github.com/google/signet) and
[Google Auth Library for Ruby](https://github.com/google/google-auth-library-ruby) for OAuth 2 support.

The [Google Auth Library for Ruby](https://github.com/google/google-auth-library-ruby) provides an implementation of
[application default credentials] for Ruby. It offers a simple way to get authorization credentials for use in
calling Google APIs, best suited for cases when the call needs to have the same identity
and authorization level for the application independent of the user. This is
the recommended approach to authorize calls to Cloud APIs, particularly when
you're building an application that uses Google Compute Engine.

For per-user authorization, use [Signet](https://github.com/google/signet) to obtain user authorization.

### Passing authorization to requests

Authorization can be specified for the entire client, for an individual service instance, or on a per-request basis.

Set authorization for all service:

```ruby
Google::Apis::RequestOptions.default.authorization = authorization
# Services instantiated after this will inherit the authorization
```

On a per-service level:

```ruby
drive = Google::Apis::DriveV2::DriveService.new
drive.authorization = authorization

# All requests made with this service will use the same authorization
```

Per-request:

```ruby
drive.get_file('123', options: { authorization: authorization })
```

### Authorization using API keys

Some APIs allow using an API key instead of OAuth2 tokens. For these APIs, set
the `key` attribute of the service instance. For example:

```ruby
require 'google/apis/translate_v2'

translate = Google::Apis::TranslateV2::TranslateService.new
translate.key = 'YOUR_API_KEY_HERE'
result = translate.list_translations('Hello world!', 'es', source: 'en')
puts result.translations.first.translated_text
```

### Authorization using environment variables

The [GoogleAuth Library for Ruby](https://github.com/google/google-auth-library-ruby) also supports authorization via
environment variables if you do not want to check in developer credentials
or private keys. Simply set the following variables for your application:

```sh
GOOGLE_ACCOUNT_TYPE="YOUR ACCOUNT TYPE" # ie. 'service'
GOOGLE_CLIENT_EMAIL="YOUR GOOGLE DEVELOPER EMAIL"
GOOGLE_PRIVATE_KEY="YOUR GOOGLE DEVELOPER API KEY"
```

## Logging

The client includes a `Logger` instance that can be used to capture debugging information.

When running in a Rails environment, the client will default to using `::Rails.logger`. If you
prefer to use a separate logger instance for API calls, you can provide a new logger instance:

```ruby
Google::Apis.logger = Logger.new(STDERR)
```

Or, you can set the environment variable `GOOGLE_API_USE_RAILS_LOGGER` to any value other than `'true'`; this will send all logging information to STDOUT.

To set the logging level for the client:

```ruby
Google::Apis.logger.level = Logger::DEBUG
```

## Customizing endpoints

By default, client objects will connect to the default Google endpoints for =
their respective APIs. If you need to connect to a regional endpoint, a test
endpoint, or other custom endpoint, modify the `root_url` attribute of the
client object. For example:

```ruby
require "google/apis/docs_v1"
docs_service = Google::Apis::DocsV1::DocsService.new

docs_service.root_url = "https://my-custom-docs-endpoint.example.com/"

document = docs_service.get_document("my-document-id")
```

## Samples

See the [samples](https://github.com/google/google-api-ruby-client/tree/master/samples) for examples on how to use the client library for various
services.

Contributions for additional samples are welcome. See [CONTRIBUTING](CONTRIBUTING.md).

## Generating APIs

For [Cloud Endpoints](https://cloud.google.com/endpoints/) or other APIs not included in the gem, ruby code can be
generated from the discovery document.

To generate from a local discovery file:

    $ generate-api gen <outdir> --file=<path>

A URL can also be specified:

    $ generate-api gen <outdir> --url=<url>

## TODO

*  ETag support (if-not-modified)
*  Caching
*  Model validations

## Supported Ruby Versions
This library is currently supported on Ruby 1.9+.  
However, Ruby 2.4 or later is strongly recommended, as earlier releases have
reached or are nearing end-of-life. After March 31, 2019, Google will provide
official support only for Ruby versions that are considered current and
supported by Ruby Core (that is, Ruby versions that are either in normal
maintenance or in security maintenance).
See https://www.ruby-lang.org/en/downloads/branches/ for further details.

## License

This library is licensed under Apache 2.0. Full license text is
available in [LICENSE](LICENSE).

## Contributing

See [CONTRIBUTING](.github/CONTRIBUTING.md).

## Support

Please [report bugs at the project on Github](https://github.com/google/google-api-ruby-client/issues). Don't
hesitate to [ask questions](http://stackoverflow.com/questions/tagged/google-api-ruby-client) about the client or APIs
on [StackOverflow](http://stackoverflow.com).
