# InSpec homepage

## Development

Get all dependencies:

```bash
bundle install
```

To run it live run:

```bash
bundle exec middleman server
```

For the online tutorial, take a look at `www/tutorial`.

## Building

To build the site to a local static folder (without tutorial):

```bash
bundle exec middleman build
```

To build everything including the online tutorial:

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
