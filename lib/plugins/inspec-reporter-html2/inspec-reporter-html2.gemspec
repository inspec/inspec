# .gemspec file is added to add plugin details
# These specs are used in plugin list and search command

Gem::Specification.new do |spec|
  spec.name          = "inspec-reporter-html2"
  spec.summary       = "Improved HTML reporter plugin"
  spec.description   = "An improved HTML output reporter specifically for Chef InSpec. Unlike the default html reporter, which is RSpec-based, this reporter knows about Chef InSpec structures like Controls and Profiles, and includes full metadata such as control tags, etc."
  spec.license       = "Apache-2.0"
end