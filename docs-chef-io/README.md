# Chef InSpec Documentation

This is the home of the InSpec Documentation that is deployed on
https://docs.chef.io/inspec/ using Hugo modules.

## Updating InSpec Docs Content

There are two steps to updating the Chef InSpec documentation on docs.chef.io:

1. Update the documentation in the `inspec/inspec` repository.
1. Update the InSpec [repository module in chef-web-docs](#update-the-inspec-docs-content-on-docchefio).

## Documentation Content

Please keep all of the InSpec documentation in the `content/inspec` directory.

The diagram below shows how documentation content should be organized:

```
.
├── docs-chef-io
│   ├── archetypes                 # page templates
│   ├── content
│   │   ├── inspec                 # InSpec documentation
│   │   │   ├── resources          # InSpec resource documentation
│   ├── static
│   |   ├── images
│   │   |   ├── inspec             # images
│   ├── layouts
│   |   ├── shortcodes             # reusable text files
```

To add a new Markdown page, run the following command from the `docs-chef-io` directory:

```
hugo new content/inspec/FILENAME.md
```

This will create a draft page with enough front matter to get you going.

Hugo uses [Goldmark](https://github.com/yuin/goldmark) which is a
superset of Markdown that includes GitHub styled tables, task lists, and
definition lists.

See our [Style Guide](https://docs.chef.io/style_guide/) for more information
about formatting documentation using Markdown.

### Page Front Matter

At the top of each page is a block of front matter that Hugo uses to add a title to each page and locate each page in the left navigation menu in <docs.chef.io>. Below is an example of a page's front matter:

```toml
+++
title = "PAGE TITLE"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "PAGE TITLE"
    identifier = "inspec/PAGE TITLE"
    parent = "inspec"
    weight = WEIGHT
+++
```

`title` is the page title.

`gh_repo = "inspec"` adds an "[edit on GitHub]" link to the top of each page that links to the Markdown page in the inspec/inspec repository.

`[menu.inspec]` places the page in the Chef InSpec section of the left navigation menu in <docs.chef.io>. All the parameters following this configure the link in the left navigation menu to the page.

`title` is the title of page in the Chef InSpec menu.

`identifier` is the identifier for a page in the menu. It should formatted like this: `inspec/RESOURCE NAME`. Change `PLATFORM` to the same value as the platform parameter above. Change `RESOURCE NAME` to the name of the resource.

`parent` is the identifier for the section of the menu that the page will be found in. This value is set in the [chef-web-docs menu config](https://github.com/chef/chef-web-docs/blob/main/config/_default/menu.toml). Set this value to the section of the InSpec menu that you want the page to located in.

`weight` sorts the page in the menu relative to other pages. Higher weights are lower in the menu. Pages without a weight are sorted alphabetically by page title.

### Resource Pages

All resource pages are located in `docs-chef-io/content/inspec/resources/`.

#### InSpec Resources Index Page

The InSpec resources index page is located in [`docs-chef-io/content/inspec/resources/_index.md`](content/inspec/resources/_index.md)
and can be found on <https://docs.chef.io/inspec/resources/>.

The resources on this page are organized by platform. All resources in a platform are added to this page using the `inspec_resources` shortcode.
To add a new group of resources of a specific platform, add the shortcode and
specify the platform parameter: `{{< inspec_resources platform="PLATFORM" >}}`

The `inspec_resources` shortcode searches for the `platform` parameter in all pages in the `content/inspec/resources` directory and then creates a list of those pages that have the specified parameter.

#### New Resource Pages

Create a new resource page by running `hugo new -k resource inspec/resources/RESOURCE_NAME.md` from the `docs-chef-io` directory.

This will create a new resource page with enough content preformatted to get you started.

#### Resource Page Front Matter

At the top of each resource is a block of front matter that Hugo uses to add a title to each page and locate each page in the left navigation menu in <docs.chef.io>. Below is an example of a page's front matter:

```toml
+++
title = "RESOURCE NAME resource"
platform = "PLATFORM"
gh_repo = "inspec"

[menu.inspec]
title = "RESOURCE NAME"
identifier = "inspec/resources/PLATFORM/RESOURCE NAME"
parent = "inspec/resources/PLATFORM"
+++
```

`title` is the page title.

`platform = PLATFORM` sorts each page into the correct category in the [Chef InSpec resources list page](https://docs.chef.io/inspec/resources/). Specify the platform that this page should be listed under in the resources list page.

`gh_repo = "inspec"` adds an "[edit on GitHub]" link to the top of each page that links to the Markdown page in the inspec/inspec repository.

`[menu.inspec]` places the page in the Chef InSpec section of the left navigation menu in <docs.chef.io>. All the parameters following this configure the link in the left navigation menu to the page.

`title` is the title of page in the Chef InSpec menu.

`identifier` is the identifier for a page in the menu. It should formatted like this: `inspec/resources/PLATFORM/RESOURCE NAME`. Change `PLATFORM` to the same value as the platform parameter above. Change `RESOURCE NAME` to the name of the resource.

`parent = "inspec/resources/PLATFORM"` is the identifier for the section of the menu that the page will be found in. This value is set in the [chef-web-docs menu config](https://github.com/chef/chef-web-docs/blob/main/config/_default/menu.toml). Change `PLATFORM` to the same value as the platform parameter.

### Shortcodes

A shortcode is a file with a block of text that can be added in multiple places in our documentation by referencing the shortcode file name.

There are two types of shortcodes: Markdown and HTML.

Add a Markdown shortcode to a page by wrapping the filename, without the `.md` file suffix, in double curly braces and percent symbols. For example: `{{% inspec_filter_table %}}`.

Add an HTML shortcode to a page by wrapping the filename, without the `.html` file suffix, in double curly braces and greater than and lesser than symbols. For example: `{{< shortcode_name >}}`.

Some shortcodes take parameters; for example, the `inspec_resources` shortcode requires a platform parameter: `{{< inspec_resources platform="PLATFORM" >}}`

## Local Development Environment

We use [Hugo](https://gohugo.io/), [Go](https://golang.org/), and[NPM](https://www.npmjs.com/)
to build the Chef Documentation website. You will need Hugo 0.83.1 or higher
installed and running to build and view our documentation properly.

To install Hugo, NPM, and Go on Windows and macOS:

- On macOS run: `brew install hugo node go`
- On Windows run: `choco install hugo-extended nodejs golang`

To install Hugo on Linux, run:

- `apt install -y build-essential`
- `snap install node --classic --channel=12`
- `snap install hugo --channel=extended`

## Preview InSpec Documentation

There are two ways to preview the documentation in `inspec`:

- submit a PR
- `make serve`

### Submit a PR

When you submit a PR to `inspec/inspec`, Netlify will build the documentation
and add a notification to the GitHub pull request page. You can review your
documentation changes as they would appear on docs.chef.io.

### make serve

Running `make serve` will clone a copy of `chef/chef-web-docs` into `docs-chef-io`.
That copy will be configured to build the InSpec documentation from `docs-chef-io`
and live reload if any changes are made while the Hugo server is running.

- Run `make serve`
- go to http://localhost:1313

#### Clean Your Local Environment

If you have a local copy of chef-web-docs cloned into `docs-chef-io`,
running `make clean_all` will delete the cloned copy of chef-web-docs. Hugo will rebuild everything from scratch
the next time you run `make serve`.

## Update the InSpec Docs Content on doc.chef.io

We use [Hugo modules](https://gohugo.io/hugo-modules/) to build Chef's documentation
from multiple repositories. Expeditor will submit a pull request that updates the documentation
in `chef/chef-web-docs` the next time InSpec is promoted.

The Docs Team can also update the InSpec documentation if changes need to be made
before the next promotion.

You can also submit a pull request to chef-web-docs to update the InSpec docs content on docs.chef.io.
See the [chef-web-docs readme](https://github.com/chef/chef-web-docs#update-hugo-modules) for information on updating a
Hugo module in chef-web-docs.

## Documentation Feedback

We love getting feedback, questions, or comments.

**Email**

Send an email to Chef-Docs@progress.com for documentation bugs,
ideas, thoughts, and suggestions. This email address is not a
support email address. If you need support, contact [Chef Support](https://www.chef.io/support/).

**GitHub issues**

Submit an issue to the [InSpec repo](https://github.com/inspec/inspec/issues)
for "important" documentation bugs that may need visibility among a larger group,
especially in situations where a doc bug may also surface a product bug.

Submit an issue to [chef-web-docs](https://github.com/chef/chef-web-docs/issues) for
doc feature requests and minor documentation issues.
