# Migrating from version`0.10` to `0.11`

## Unicode normalization

The client no longer normalizes unicode strings in path parameters. This may affect
some applications using multibyte strings that were previously normalized.:
To restore the previous behavior, use the `normalize_unicode` request option.

## Type change for large numbers

Previously, types declared as 64 bit numbers were mapped to strings. These are now mapped to
`Fixednum`/`Bignum`.

## Timeouts

Timeout options have been moved from `RequestOptions` to `ClientOptions`.

Old                               | New
----------------------------------|-----------------
`RequestOptions.open_timeout_sec` | `ClientOptions.open_timeout_sec`
`RequestOptions.timeout_sec`      | `ClientOptions.read_timeout_sec`
`RequestOptions.timeout_sec`      | `ClientOptions.send_timeout_sec`

## Batch requests across services no longer supported

It is no longer possible to combine multiple services (e.g. Gail & Drive)
in a batch request. If batching requests that span services, group
requests for each service in their own batch request.

# Migrating from version `0.9.x` to `0.10`

Only one minor breaking change was introduced in the `to_json` method due to a version bump for the `representable` gem from `2.3` to `3.0`. If you used the `skip_undefined` in `to_json`, you should replace that with `user_options: { skip_undefined: true }`.

ex:
```ruby
foo.to_json(skip_undefined: true)
```
to
```ruby
foo.to_json(user_options: { skip_undefined: true })
```

# Migrating from version `0.8.x` to `0.9` or above

Many changes and improvements have been made to the `google-api-ruby-client`
library to bring it to `0.9`. If you are starting a new project or haven't used
this library before version `0.9`, see the [README](README.md) to get started
as you won't need to migrate anything.

Code written against the `0.8.x` version of this library will not work with the `0.9`
version without modification.

## Discovery

In `0.8.x` the library would "discover" APIs on the fly, introducing
additional network calls and instability. That has been fixed in `0.9`.

To get the `drive` client in `0.8.x` required this:

```ruby
require 'google/api_client'

client = Google::APIClient.new
drive = client.discovered_api('drive', 'v2')
```

In `0.9` the same thing can be accomplished like this:

```ruby
require 'google/apis/drive_v2'

drive = Google::Apis::DriveV2::DriveService.new
```

All APIs are immediately accessible without requiring additional network calls or runtime code generation.

## API Methods

The calling style for API methods has changed. In `0.8.x` all calls were via a generic `execute` method. In `0.9`
the generated services have fully defined method signatures for all available methods.

To get a file using the Google Drive API in `0.8.x` required this:

```ruby
file = client.execute(:api_method => drive.file.get, :parameters => { 'id' => 'abc123' })
```

In `0.9` the same thing can be accomplished like this:

```ruby
file = drive.get_file('abc123')
```

Full API definitions including available methods, parameters, and data classes can be found in the `generated` directory.

## Authorization

In the 0.9 version of this library, the authentication and authorization code was moved
to the new [googleauth](https://github.com/google/google-auth-library-ruby) library. While the new library provides
significantly simpler APIs for some use cases, not all features have been migrated. Missing features
are expected to be added by end of Q2 2015.

The underlying [Signet](https://github.com/google/signet) is still used for authorization. OAuth 2 credentials obtained
previously will continue to work with the `0.9` version. OAuth 1 is no longer supported.

If you were using a PKCS12 file to authorize, we recommend you generate a new key for the service account using the JSON format ( client_secret.json) file with googleauth.

## Media uploads

Media uploads are significantly simpler in `0.9`.

The old `0.8.x` way of uploading media:

```ruby
media = Google::APIClient::UploadIO.new('mymovie.m4v', 'video/mp4')
metadata = {
  'title' => 'My movie',
  'description' => 'The best home movie ever made'
}
client.execute(:api_method => drive.files.insert,
               :parameters => { 'uploadType' => 'multipart' },
               :body_object => metadata,
               :media => media )
```

The new way in `0.9` using `upload_source` and `content_type` parameters:

```ruby
metadata = {
  title: 'My movie',
  description: 'The best home movie ever made'
}
drive.insert_file(metadata, upload_source: 'mymovie.m4v', content_type: 'video/mp4')
```

`upload_source` can be either a path to a file, an `IO` stream, or a `StringIO` instance.

Uploads are resumable and will be automatically retried if interrupted.

## Media downloads

`0.9` introduces support for media downloads (`alt=media`). To download content, use the `download_dest` parameter:

```ruby
drive.get_file('abc123', download_dest: '/tmp/myfile.txt')
```

`download_dest` may be either a path to a file or an `IO` stream.

## Batch Requests

The old `0.8.x` way of performing batch requests:

```ruby
client = Google::APIClient.new
urlshortener = client.discovered_api('urlshortener')

batch = Google::APIClient::BatchRequest.new do |result|
    puts result.data
end

batch.add(:api_method => urlshortener.url.insert,
          :body_object => { 'longUrl' => 'http://example.com/foo' })
batch.add(:api_method => urlshortener.url.insert,
          :body_object => { 'longUrl' => 'http://example.com/bar' })
client.execute(batch)
```

In `0.9`, the equivalent code is:

```ruby
require 'google/apis/urlshortener_v1'

urlshortener = Google::Apis::UrlshortenerV1::UrlshortenerService.new

urlshortener.batch do |urlshortener|
  urlshortener.insert_url({long_url: 'http://example.com/foo'}) do |res, err|
    puts res
  end
  urlshortener.insert_url({long_url: 'http://example.com/bar'}) do |res, err|
    puts res
  end
end
```

Or if sharing the same block:

```ruby
require 'google/apis/urlshortener_v1'

urlshortener = Google::Apis::UrlshortenerV1::UrlshortenerService.new

callback = lambda { |res, err| puts res }
urlshortener.batch do |urlshortener|
  urlshortener.insert_url({long_url: 'http://example.com/foo'}, &callback)
  urlshortener.insert_url({long_url: 'http://example.com/bar'}, &callback)
end
```

## JRuby

Jruby 1.7.4 in 2.0 compatibility mode is supported. To enable for a specific script:

```
jruby --2.0 myscript.rb
```

Or set as the default:

```
export JRUBY_OPTS=--2.0
```

JRuby 9000 will be supported once released.

