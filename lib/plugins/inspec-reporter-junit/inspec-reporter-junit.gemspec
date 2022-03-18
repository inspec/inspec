# .gemspec file is added to add plugin details
# These specs are used in plugin list and search command

Gem::Specification.new do |spec|
  spec.name          = "inspec-reporter-junit"
  spec.summary       = "JUnit XML reporter plugin"
  spec.description   = "`junit` is the legacy Chef InSpec JUnit reporter, which is retained for backwards compatibility. It generates an XML report in Apache Ant JUnit format. The output format is considered nonstandard in several ways. New users are advised to use `junit2`."
  spec.license       = "Apache-2.0"
end