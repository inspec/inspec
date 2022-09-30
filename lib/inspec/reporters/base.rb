require_relative "../utils/run_data_filters"
require "inspec/attestations"

module Inspec::Reporters
  class Base
    include Inspec::Utils::RunDataFilters

    attr_reader :run_data
    attr_accessor :enhanced_outcomes

    def initialize(config)
      @config = config
      @run_data = config[:run_data] || {}
      apply_run_data_filters_to_hash

      # only try for attestation when attestation file is passed
      Inspec::Attestations.attest(@run_data) if Inspec::Config.cached[:attestation_file]
      @output = ""
    end

    def output(str, newline = true)
      @output << str
      @output << "\n" if newline
    end

    def rendered_output
      @output
    end

    # each reporter must implement #render
    def render
      raise NotImplementedError, "#{self.class} must implement a `#render` method to format its output."
    end
  end
end
