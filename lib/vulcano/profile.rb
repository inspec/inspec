# encoding: utf-8
# Copyright 2015 Dominik Richter. All rights reserved.
# author: Dominik Richter
# author: Christoph Hartmann

require 'vulcano/metadata'

module Vulcano
  class Profile
    def self.from_path(path, options = nil)
      opt = options.dup || {}
      opt[:path] = path
      Profile.new(opt)
    end

    attr_reader :params
    attr_reader :metadata

    def initialize(options = nil)
      @options = options || {}
      @params = {}
      @logger = options.delete(:logger) || Logger.new(nil)
      @profile_id = options.delete(:profile_id)

      @path = @options[:path]
      fail 'Cannot read an empty path.' if @path.nil? || @path.empty?
      fail "Cannot find directory #{@path}" unless File.directory?(@path)

      @metadata = read_metadata
      @params = @metadata.params unless @metadata.nil?

      @params['rules'] = rules = {}
      @runner = Runner.new(
        id: @profile_id,
        backend: :mock,
      )
      @runner.add_tests([@path])
      @runner.rules.each do |id, rule|
        rules[id] = {
          title: rule.title,
          desc: rule.desc,
          impact: rule.impact,
          code: rule.instance_variable_get(:@__code),
          checks: rule.instance_variable_get(:@checks),
        }
      end
    end

    def info
      res = @params.dup
      rules = {}
      res['rules'].each do |id, rule|
        next if id.to_s.empty?

        data = rule.dup
        data.delete(:checks)
        data[:impact] ||= 0.5
        data[:impact] = 1.0 if data[:impact] > 1.0
        data[:impact] = 0.0 if data[:impact] < 0.0
        rules[id] = data
      end
      res['rules'] = rules
      res
    end

    # Check if the profile is internall well-structured. The logger will be
    # used to print information on errors and warnings which are found.
    #
    # @return [Boolean] true if no errors were found, false otherwise
    def check # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
      no_errors = true
      no_warnings = true
      warn = ->(msg) { @logger.warn(msg); no_warnings = false }
      error = ->(msg) { @logger.error(msg); no_warnings = false; no_errors = false }

      @logger.info "Checking profile in #{@path}"

      if @params['name'].to_s.empty?
        error.call('No profile name defined')
      elsif !(@params['name'].to_s =~ %r{^\S+\/\S+$})
        error.call('Profile name must be defined as: OWNER/ID')
      end

      warn.call('No version defined') if @params['version'].to_s.empty?
      warn.call('No title defined') if @params['title'].to_s.empty?
      warn.call('No maintainer defined') if @params['maintainer'].to_s.empty?
      warn.call('No supports defined') if @params['supports'].empty?
      @logger.info 'Metadata OK.' if no_warnings

      no_warnings = true
      if @params['rules'].empty?
        warn.call('No rules were found.')
      else
        @logger.debug "Found #{@params['rules'].length} rules."
      end

      @params['rules'].each do |id, rule|
        error.call('Avoid rules with empty IDs') if id.nil? or id.empty?
        warn.call("Rule #{id} has no title") if rule[:title].to_s.empty?
        warn.call("Rule #{id} has no description") if rule[:desc].to_s.empty?
        warn.call("Rule #{id} has impact > 1.0") if rule[:impact].to_f > 1.0
        warn.call("Rule #{id} has impact < 0.0") if rule[:impact].to_f < 0.0
        warn.call("Rule #{id} has no tests defined") if rule[:checks].nil? or rule[:checks].empty?
      end

      @logger.info 'Rule definitions OK.' if no_warnings
      no_errors
    end

    private

    def read_metadata
      mpath = File.join(@path, 'metadata.rb')
      @metadata = Metadata.from_file(mpath, @profile_id, @logger)
    end
  end
end
