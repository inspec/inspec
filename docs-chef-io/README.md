# Chef InSpec Documentation

This is the home of the InSpec Documentation that is deployed on
https://docs.chef.io/inspec/ using Hugo modules.

## The Fastest Way to Contribute

There are two steps to updating the Chef InSpec documentation:

1. Update the documentation in the `inspec/inspec` repository.
1. Update the InSpec repository module in chef-web-docs

### Update Content in `inspec/inspec`

The fastest way to change the documentation is to edit a page on the
GitHub website using the GitHub UI.

To perform edits using the GitHub UI, click on the `[edit on GitHub]` link at
the top of the page that you want to edit. The link takes you to that topic's GitHub
page. In GitHub, click on the pencil icon and make your changes. You can preview
how they'll look right on the page ("Preview Changes" tab).

We also require contributors to include their [DCO signoff](https://github.com/chef/chef/blob/master/CONTRIBUTING.md#developer-certification-of-origin-dco)
in the comment section of every pull request, except for obvious fixes. You can
add your DCO signoff to the comments by including `Signed-off-by:`, followed by
your name and email address, like this:

`Signed-off-by: Julia Child <juliachild@chef.io>`

See our [blog post](https://blog.chef.io/introducing-developer-certificate-of-origin/)
for more information about the DCO and why we require it.

After you've added your DCO signoff, add a comment about your proposed change,
then click on the "Propose file change" button at the bottom of the page and
confirm your pull request. The CI system will do some checks and add a comment
to your PR with the results.

The Chef documentation team can normally merge pull requests within seven days.
We'll fix build errors before we merge, so you don't have to
worry about passing all the CI checks, but it might add an extra
few days. The important part is submitting your change.

### Update the InSpec Repository Module In `chef/chef-web-docs`

We use [Hugo modules](https://gohugo.io/hugo-modules/) to build Chef's documentation
from multiple repositories. Expeditor will submit a pull request that updates the documentation
in `chef/chef-web-docs` the next time InSpec is promoted.

The Docs Team can also update the InSpec documentation if changes need to be made
before the next promotion.

## Local Development Environment

We use [Hugo](https://gohugo.io/), [Go](https://golang.org/), and[NPM](https://www.npmjs.com/)
to build the Chef Documentation website. You will need Hugo 0.78.1 or higher
installed and running to build and view our documentation properly.

To install Hugo, NPM, and Go on Windows and macOS:

- On macOS run: `brew install hugo node go`
- On Windows run: `choco install hugo nodejs golang -y`

To install Hugo on Linux, run:

- `apt install -y build-essential`
- `snap install node --classic --channel=12`
- `snap install hugo --channel=extended`

## Preview Workstation Documentation

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
running `make clean_all` will delete the SASS files, node modules, and fonts in
`docs-chef-io/chef-web-docs/themes/docs-new` used to
build the docs site in the cloned copy of chef-web-docs. Hugo will reinstall these
the next time you run `make serve`.

## Creating New Pages

Please keep all of the InSpec documentation in the `content/inspec` directory.
To add a new Markdown file, run the following command from the `www` directory:

```
hugo new content/inspec/<filename>.md
```

If it's a new resource page, run:

```
hugo new -k resource content/inspec/resources/<filename>.md
```

This will create a draft page with enough front matter to get you going. Note that
resource pages must have a platform specified in the page frontmatter. See
the [Resource pages](#resource-pages) section below for more information.

Hugo uses [Goldmark](https://github.com/yuin/goldmark) which is a
superset of Markdown that includes GitHub styled tables, task lists, and
definition lists.

See our [Style Guide](https://docs.chef.io/style_guide/) for more information
about formatting documentation using Markdown.

## Resource Pages

The resource pages are located in `www/content/inspec/resources/`.

The InSpec resources index page is located in `www/content/inspec/resources/_index.md`
and can be found on https://docs.chef.io/inspec/resources/

The resource index page has a shortcode called `inspec_resources` that lists
resource pages by platform. To use the shortcode, add the shortcode and
specify the platform parameter: `{{< inspec_resources platform="<platform>" >}}`

A resource page must be located in `www/content/inspec/resources` and must have
the platform parameter set in its frontmatter. Add `platform = <platform>` to
the page frontmatter to add the platform parameter. For example, the
`aide_conf.md` resource frontmatter has `platform = "linux"` in its page
frontmatter.
### Documentation Content
```
.
├── docs-chef-io
│   ├── content
│   │   ├── inspec                 # where to keep markdown file documentation
│   │   │   ├── resources          # where to keep resource page documentation
|   ├── static
|   |   ├── images
|   |   |   ├── inspec/inspec        # where to keep any images you need to reference in your documentation
```

### What is happening behind the scenes

The [Chef Documentation](https://docs.chef.io) site uses [Hugo modules](https://gohugo.io/hugo-modules/)
to load content directly from the `docs-chef-io` directory in the `inspec/inspec`
repository. Every time `inspec/inspec` is promoted to stable, Expeditor
instructs Hugo to update the version of the `inspec/inspec` repository
that Hugo uses to build Chef InSpec documentation on the [Chef Documentation](https://docs.chef.io)
site. This is handled by the Expeditor subscriptions in the `chef/chef-web-docs` GitHub repository.

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

