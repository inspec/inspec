# InSpec homepage

## Development

Get all dependencies:

```bash
bundle install
```

To build the `docs/` child pages run:

```bash
bundle exec rake docs
```

To run it live run:

```bash
bundle exec middleman server
```

For the online demo, take a look at `www/demo`.

## Building

To build the site to a local static folder (without demo):

```bash
bundle exec middleman build
```
* _if you get an error building the css files it could be because you don't have node.js installed. e.g._ 
```
  == Request: /stylesheets/vendor/fontawesome.min.css
  == Finishing Request: stylesheets/vendor/fontawesome.min.css (0.0s)
         error  build/stylesheets/vendor/fontawesome.min.css
```

To build everything including the online demo:

```
bundle exec rake www:build
```

## Releasing

To build everything and push a new version of the website, be in the www folder of this repository and run:

```
bundle install
bundle exec rake www
```

It will clear everything and build from scratch and create a local `gh-pages` branch with a static version of the website.
Before pushing, it will ask you if you are happy with it.

**Please verify the site now!** To host the current folder you can run:

```
ruby -run -e httpd . -p 8000
```

Open your browser to [localhost:8000](http://localhost:8000).

If you are happy, you can confirm the site and let the release task push it live.

### Flushing the Fastly Cache

The `www` Rake task will flush the cache at Fastly if you have the following environment variables set:

 * `FASTLY_API_KEY`
 * `FASTLY_SERVICE_ID`

These can be found in Chef's shared password manager. If these aren't set, the cache will not be flushed and will expire on its own. The cache can be flushed without doing a full website release by running `rake www:flush`
