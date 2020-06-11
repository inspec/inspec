# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'middleman/search_engine_sitemap/version'

Gem::Specification.new do |spec|
  spec.name          = "middleman-search_engine_sitemap"
  spec.version       = Middleman::SearchEngineSitemap::VERSION
  spec.authors       = ["Pete Nicholls"]
  spec.email         = ["pete@metanation.com"]
  spec.summary       = %q{Adds a sitemap.xml file to your Middleman site for search engines.}
  spec.description   = %q{Adds a sitemap.xml file (following the sitemaps.org protocol) to your Middleman site for major search engines including Google.}
  spec.homepage      = "https://github.com/Aupajo/middleman-search_engine_sitemap"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "middleman-core", "~> 4.0"
  spec.add_runtime_dependency "builder"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "pry"
end
