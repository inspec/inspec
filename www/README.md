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

## Building

To build to a local static folder, run:

```bash
bundle exec middleman build
```

## Releasing

To push a new version of the website, make sure that you have built the site
(see previous section) and that you are happy with the results. If so, run:

```
bundle exec rake www:release
```

It will clear and create a local `gh-pages` branch, add the site to it,
and ask you before it pushes everything to `origin/gh-pages` i.e. the live
website.
