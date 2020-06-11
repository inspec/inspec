# Middleman Search Engine Sitemap

[![Build Status](https://travis-ci.org/Aupajo/middleman-search_engine_sitemap.png?branch=master)](https://travis-ci.org/Aupajo/middleman-search_engine_sitemap)
[![Code Climate](https://codeclimate.com/github/Aupajo/middleman-search_engine_sitemap.png)](https://codeclimate.com/github/Aupajo/middleman-search_engine_sitemap)
[![Dependency Status](https://gemnasium.com/Aupajo/middleman-search_engine_sitemap.svg)](https://gemnasium.com/Aupajo/middleman-search_engine_sitemap)
[![Gem
Version](https://badge.fury.io/rb/middleman-search_engine_sitemap.svg)](http://badge.fury.io/rb/middleman-search_engine_sitemap)

[Sitemaps](http://www.sitemaps.org/) are an open standard to tell search engines (such as Google) about each page on your site, how often they're updated, and how important each page is, relative to other pages on your site.

This project aims to simplify including the sitemap XML file along with your Middleman site, so that you can better instruct search engines on how to index your pages.

For more information on the standard itself, please visit http://www.sitemaps.org/.

## Installation

Add this line to your Middleman site's `Gemfile`:

```ruby
gem 'middleman-search_engine_sitemap'
```

And then execute:

    $ bundle

## Usage

Place the following inside your `config.rb`:

```ruby
set :url_root, 'http://example.com'

activate :search_engine_sitemap
```

The sitemap will become available at [http://localhost:4567/sitemap.xml](http://localhost:4567/sitemap.xml).

## Excluding pages

You can add a `hide_from_sitemap` attribute to your page's frontmatter to omit it from the sitemap:

```erb
---
title: My hidden page
hide_from_sitemap: true
---

Shh. Don't tell anyone I'm here.
```

If you would like to use a different frontmatter attribute, you can specify it in the extension options:

```ruby
activate :search_engine_sitemap, exclude_attr: 'hidden'
```

You would then be able to use `hidden: true` in place of `hide_from_sitemap: true`.

## Settings

Pages have a priority of 0.5 and a change frequency of `monthly` by default.

### Specifying priority and change frequency for a page

You can change these values by passing in options to the `activate` directive:

```ruby
activate :search_engine_sitemap, default_priority: 0.5,
                                 default_change_frequency: "monthly"
```

You can override the priority or change frequency for a particular page by using frontmatter:

```erb
---
title: Blog
priority: 1.0
change_frequency: daily
---

Welcome to my blog!
```

### Priority

A number between 0.0 and 1.0, representing how important the page is, relevant to other pages on your site.

The default value is 0.5.

From [sitemaps.org](http://www.sitemaps.org/protocol.html):

> Valid values range from 0.0 to 1.0. **This value does not affect how your pages are compared to pages on other sites**–it only lets the search engines know which pages you deem most important for the crawlers.

> Please note that the priority you assign to a page is not likely to influence the position of your URLs in a search engine's result pages. Search engines may use this information when selecting between URLs on the same site, so you can use this tag to increase the likelihood that your most important pages are present in a search index.

> Also, please note that assigning a high priority to all of the URLs on your site is not likely to help you. Since the priority is relative, it is only used to select between URLs on your site.

### Change Frequency

Possible values are: `always`, `hourly`, `daily`, `weekly`, `monthly`, `yearly`, `never`.

The default value is `monthly`.

### Custom page exclusion

You can also use `exclude_if` to exclude pages based on more complex requirements. For example:

```ruby
# Exclude all pages which have a date that's after today
activate :search_engine_sitemap, exclude_if: ->(resource) {
  resource.data.date && resource.data.date > Date.today
}
```

### Customising the URL

Sometimes, you might want to perform some processing the URL:

```ruby
activate :search_engine_sitemap, process_url: -> (url) { url.chomp('/') }
```

The example above would remove a trailing slash from a URL.

The value passed into `process_url` is any object that responds to `call`.

## Contributing

1. Fork it ( http://github.com/Aupajo/middleman-search_engine_sitemap/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
