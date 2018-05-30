# encoding: utf-8

require 'yaml'

module Inspec::Reporters
  class Yaml < Base
    def render
      config = {}
      config[:run_data] = run_data
      # output(Inspec::Reporters::Json.new(config).report.to_yaml, false)
    end
  end
end
