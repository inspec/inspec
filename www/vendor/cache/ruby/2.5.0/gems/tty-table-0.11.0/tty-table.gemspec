lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tty/table/version'

Gem::Specification.new do |spec|
  spec.name          = 'tty-table'
  spec.version       = TTY::Table::VERSION
  spec.authors       = ["Piotr Murach"]
  spec.email         = ["me@piotrmurach.com"]
  spec.summary       = %q{A flexible and intuitive table generator}
  spec.description   = %q{A flexible and intuitive table generator}
  spec.homepage      = "https://piotrmurach.github.io/tty/"
  spec.license       = "MIT"
  if spec.respond_to?(:metadata=)
    spec.metadata = {
      "allowed_push_host" => "https://rubygems.org",
      "bug_tracker_uri"   => "https://github.com/piotrmurach/tty-table/issues",
      "changelog_uri"     => "https://github.com/piotrmurach/tty-table/blob/master/CHANGELOG.md",
      "documentation_uri" => "https://www.rubydoc.info/gems/tty-table",
      "homepage_uri"      => spec.homepage,
      "source_code_uri"   => "https://github.com/piotrmurach/tty-table"
    }
  end
  spec.files         = Dir['{lib,spec,examples}/**/*.rb']
  spec.files        += Dir['{bin,tasks}/*', 'tty-table.gemspec']
  spec.files        += Dir['README.md', 'CHANGELOG.md', 'LICENSE.txt', 'Rakefile']
  spec.test_files    = spec.files.grep(%r{^(spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_dependency 'equatable',   '~> 0.6'
  spec.add_dependency 'necromancer', '~> 0.5'
  spec.add_dependency 'pastel',      '~> 0.7.2'
  spec.add_dependency 'tty-screen',  '~> 0.7'
  spec.add_dependency 'strings',     '~> 0.1.5'

  spec.add_development_dependency 'bundler', '>= 1.5.0'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.1'
end
