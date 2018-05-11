# How do RSpec and InSpec work together?

## Obligatory Youtube Reference

https://youtu.be/Vg5cwSBnyQU?t=3m11s

## Motivation

Some Chef staff were working on a resource pack, trying to add unit tests.  We started with a simple test helper file, from the [archived inspec-aws project](https://github.com/chef/inspec-aws/blob/master/test/unit/helper.rb).  However, we found that the modern inspec main project mentioned RSpec directly, and that now caused problems:

### Minimal Helper

With this test_helper.rb:

```
require "minitest/autorun"
require 'minitest/spec'
require 'inspec/resource'
require_relative '../libraries/support/azure'
```

running the unit tests would result in this trace:

```
Traceback (most recent call last):
	15: from /Users/cwolfe/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/rake-12.3.1/lib/rake/rake_test_loader.rb:5:in `<main>'
	14: from /Users/cwolfe/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/rake-12.3.1/lib/rake/rake_test_loader.rb:5:in `select'
	13: from /Users/cwolfe/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/rake-12.3.1/lib/rake/rake_test_loader.rb:17:in `block in <main>'
	12: from /Users/cwolfe/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/rake-12.3.1/lib/rake/rake_test_loader.rb:17:in `require'
	11: from /Users/cwolfe/sandbox/inspec/cis-azure-prototype/azure_rest_demo/test/libraries/azure_security_center_policy_test.rb:1:in `<top (required)>'
	10: from /Users/cwolfe/sandbox/inspec/cis-azure-prototype/azure_rest_demo/test/libraries/azure_security_center_policy_test.rb:1:in `require'
	 9: from /Users/cwolfe/sandbox/inspec/cis-azure-prototype/azure_rest_demo/test/test_helper.rb:10:in `<top (required)>'
	 8: from /Users/cwolfe/sandbox/inspec/cis-azure-prototype/azure_rest_demo/test/test_helper.rb:10:in `require'
	 7: from /Users/cwolfe/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/inspec-2.1.59/lib/inspec/resource.rb:81:in `<top (required)>'
	 6: from /Users/cwolfe/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/inspec-2.1.59/lib/inspec/resource.rb:81:in `require'
	 5: from /Users/cwolfe/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/inspec-2.1.59/lib/resource_support/aws.rb:26:in `<top (required)>'
	 4: from /Users/cwolfe/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/inspec-2.1.59/lib/resource_support/aws.rb:26:in `require'
	 3: from /Users/cwolfe/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/inspec-2.1.59/lib/resources/aws/aws_iam_password_policy.rb:2:in `<top (required)>'
	 2: from /Users/cwolfe/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/inspec-2.1.59/lib/resources/aws/aws_iam_password_policy.rb:93:in `<class:AwsIamPasswordPolicy>'
	 1: from /Users/cwolfe/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/inspec-2.1.59/lib/resources/aws/aws_iam_password_policy.rb:93:in `each'
/Users/cwolfe/.rbenv/versions/2.5.1/lib/ruby/gems/2.5.0/gems/inspec-2.1.59/lib/resources/aws/aws_iam_password_policy.rb:102:in `block in <class:AwsIamPasswordPolicy>': uninitialized constant AwsIamPasswordPolicy::RSpec (NameError)
```

AwsIamPasswordPolicy uses `RSpec::Matcher.alias_matcher` to override the renaming that RSpec performs on predicates.

### Adding RSpec

```
require "minitest/autorun"
require 'minitest/spec'
require 'inspec/resource'
require 'rspec'
require_relative '../libraries/support/azure'
```