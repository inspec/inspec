$LOAD_PATH.uniq!

require "rubygems"
require "signet"
require "rspec"
require "simplecov"
require "faraday"

SimpleCov.start if ENV["COVERAGE"]
Faraday::Adapter.load_middleware :test
