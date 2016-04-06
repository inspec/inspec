# Contributing to InSpec

We are glad you want to contribute to InSpec!

We utilize **Github Issues** for issue tracking and contributions. You can contribute in two ways:

1. Reporting an issue or making a feature request [here](#issues).
2. Adding features or fixing bugs yourself and contributing your code to InSpec.

## Contribution Process

We have a 3 step process that utilizes **Github Issues**:

1. Sign or be added to an existing [Contributor License Agreement (CLA)](https://supermarket.chef.io/become-a-contributor).
2. Create a Github Pull Request.
3. Do [Code Review](#cr) with the **InSpec Team** on the pull request.

### <a name="pulls"></a> Chef Pull Requests

We strive to ensure high quality throughout the InSpec experience. In order to ensure
  this, we require a couple of things for all pull requests to InSpec:

1. **Tests:** To ensure high quality code and protect against future regressions, we require all the
  code in InSpec to have at least unit test coverage. See the [test/unit](https://github.com/chef/inspec/tree/master/test/unit)
  directory for the existing tests and use ```bundle exec rake test``` to run them.
2. **Green Travis Run:** We use [Travis CI](https://travis-ci.org/) in order to run our tests
  continuously on all the pull requests. We require the Travis runs to succeed on every pull
  request before being merged.
3. **Up-to-date Documentation:**  Every code change should be reflected in an update for our [documentation](https://github.com/chef/inspec/tree/master/docs). We expect PRs to update the documentation with the code change.

In addition to this it would be nice to include the description of the problem you are solving
  with your change. You can use [Chef Issue Template](#issuetemplate) in the description section
  of the pull request.

### <a name="cr"></a> Chef Code Review Process

The Chef Code Review process happens on Github pull requests. See
  [this article](https://help.github.com/articles/using-pull-requests) if you're not
  familiar with Github Pull Requests.

Once you a pull request, the **InSpec Team**  will review your code
  and respond to you with any feedback they might have. The process at this point is as follows:

1. thumbs-ups are required from the **InSpec Team** for all merges.
2. When ready, your pull request will be merged into `master`, we may require you to rebase your PR to the latest `master`.
3. Once the PR is merged, you will be included in `CHANGELOG.md`.


### Contributor License Agreement (CLA)
Licensing is very important to open source projects. It helps ensure the
  software continues to be available under the terms that the author desired.

Chef uses [the Apache 2.0 license](https://github.com/chef/chef/blob/master/LICENSE)
  to strike a balance between open contribution and allowing you to use the
  software however you would like to.

The license tells you what rights you have that are provided by the copyright holder.
  It is important that the contributor fully understands what rights they are
  licensing and agrees to them. Sometimes the copyright holder isn't the contributor,
  such as when the contributor is doing work for a company.

To make a good faith effort to ensure these criteria are met, Chef requires an Individual CLA
  or a Corporate CLA for contributions. This agreement helps ensure you are aware of the
  terms of the license you are contributing your copyrighted works under, which helps to
  prevent the inclusion of works in the projects that the contributor does not hold the rights
  to share.

It only takes a few minutes to complete a CLA, and you retain the copyright to your contribution.

You can complete our
  [Individual CLA](https://supermarket.chef.io/icla-signatures/new) online.
  If you're contributing on behalf of your employer and they retain the copyright for your works,
  have your employer fill out our
  [Corporate CLA](https://supermarket.chef.io/ccla-signatures/new) instead.
