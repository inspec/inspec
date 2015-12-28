# encoding: utf-8
# Copyright 2015 Dominik Richter. All rights reserved.
# author: Dominik Richter
# author: Christoph Hartmann

require 'inspec/metadata'
require 'pathname'

module Inspec
  class Profile # rubocop:disable Metrics/ClassLength
    def self.from_path(path, options = nil)
      opt = {}
      options.each { |k, v| opt[k.to_sym] = v } unless options.nil?
      opt[:path] = path
      Profile.new(opt)
    end

    attr_reader :params
    attr_reader :path

    def initialize(options = nil)
      @options = options || {}

      @params = {}
      @logger = options[:logger] || Logger.new(nil)

      @path = @options[:path]
      fail 'Cannot read an empty path.' if @path.nil? || @path.empty?
      fail "Cannot find directory #{@path}" unless File.directory?(@path)

      @metadata = read_metadata
      @params = @metadata.params
      # use the id from parameter, name or fallback to nil
      @profile_id = options[:id] || params[:name] || nil

      @params[:rules] = rules = {}
      @runner = Runner.new(
        id: @profile_id,
        backend: :mock,
      )

      @runner.add_tests([@path])
      @runner.rules.each do |id, rule|
        file = rule.instance_variable_get(:@__file)
        rules[file] ||= {}
        rules[file][id] = {
          title: rule.title,
          desc: rule.desc,
          impact: rule.impact,
          checks: rule.instance_variable_get(:@checks),
          code: rule.instance_variable_get(:@__code),
          group_title: rule.instance_variable_get(:@__group_title),
        }
      end
    end

    def info
      res = @params.dup
      rules = {}
      res[:rules].each do |gid, group|
        next if gid.to_s.empty?
        path = gid.sub(File.join(@path, ''), '')
        rules[path] = { title: path, rules: {} }
        group.each do |id, rule|
          next if id.to_s.empty?
          data = rule.dup
          data.delete(:checks)
          data[:impact] ||= 0.5
          data[:impact] = 1.0 if data[:impact] > 1.0
          data[:impact] = 0.0 if data[:impact] < 0.0
          rules[path][:rules][id] = data
          # TODO: temporarily flatten the group down; replace this with
          # proper hierarchy later on
          rules[path][:title] = data[:group_title]
        end
      end
      res[:rules] = rules
      res
    end

    # Check if the profile is internall well-structured. The logger will be
    # used to print information on errors and warnings which are found.
    #
    # @return [Boolean] true if no errors were found, false otherwise
    def check # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
      no_errors = true
      no_warnings = true
      warn = lambda { |msg|
        @logger.warn(msg)
        no_warnings = false
      }
      error = lambda { |msg|
        @logger.error(msg)
        no_warnings = no_errors = false
      }

      @logger.info "Checking profile in #{@path}"

      if Pathname.new(path).join('metadata.rb').exist?
        warn.call('The use of `metadata.rb` is deprecated. Use `inspec.yml`.')
      end

      @logger.info 'Metadata OK.' if @metadata.valid?

      # check if the profile is using the old test directory instead of the
      # new controls directory
      if Pathname.new(path).join('test').exist? && !Pathname.new(path).join('controls').exist?
        warn.call('Profile uses deprecated `test` directory, rename it to `controls`')
      end

      rules_counter = @params[:rules].values.map { |hm| hm.values.length }.inject(:+)
      if rules_counter.nil? || rules_counter == 0
        warn.call('No controls or tests were defined.')
      else
        @logger.debug("Found #{rules_counter} rules.")
      end

      # iterate over hash of groups
      @params[:rules].each do |group, rules_array|
        @logger.debug "Verify all rules in  #{group}"
        rules_array.each do |id, rule|
          error.call('Avoid rules with empty IDs') if id.nil? or id.empty?
          next if id.start_with? '(generated '
          warn.call("Rule #{id} has no title") if rule[:title].to_s.empty?
          warn.call("Rule #{id} has no description") if rule[:desc].to_s.empty?
          warn.call("Rule #{id} has impact > 1.0") if rule[:impact].to_f > 1.0
          warn.call("Rule #{id} has impact < 0.0") if rule[:impact].to_f < 0.0
          warn.call("Rule #{id} has no tests defined") if rule[:checks].nil? or rule[:checks].empty?
        end
      end

      @logger.info 'Rule definitions OK.' if no_warnings
      no_errors
    end

    # generates a archive of a folder profile
    def archive(opts) # rubocop:disable Metrics/AbcSize
      check_result = check

      if check_result && !opts.ignore_errors == false
        @logger.info 'Profile check failed. Please fix the profile before generating an archive.'
        return false
      end

      profile_name = @params[:name]

      opts[:zip] ? ext='zip' : ext='tar.gz'
      slug = profile_name.downcase.strip.tr(' ', '-').gsub(/[^\w-]/, '_')
      archive = Pathname.new(File.dirname(__FILE__)).join('../..', "#{slug}.#{ext}")

      # check if file exists otherwise overwrite the archive
      if archive.exist? && !opts[:overwrite]
        @logger.info "Archive #{archive} exists already. Use --overwrite."
        return false
      end

      # remove existing archive
      File.delete(archive) if archive.exist?

      @logger.info "Profile check finished. Generate archive #{archive}."

      # find all files
      files = Dir.glob("#{path}/**/*")

      # filter files that should not be part of the profile
      # TODO ignore all .files, but add the files to debug output

      # map absolute paths to relative paths
      files = files.collect { |f| Pathname.new(f).relative_path_from(Pathname.new(path)).to_s }

      # display all files that will be part of the archive
      @logger.debug 'Add the following files to archive:'
      files.each { |f|
        @logger.debug '    ' + f
      }

      if opts[:zip]
        # generate zip archive
        require 'inspec/archive/zip'
        zag = Inspec::Archive::ZipArchiveGenerator.new
        zag.archive(path, files, archive)
      else
        # generate tar archive
        require 'inspec/archive/tar'
        tag = Inspec::Archive::TarArchiveGenerator.new
        tag.archive(path, files, archive)
      end

      @logger.info 'Finished archive generation.'
      true
    end

    private

    def read_metadata
      mpath = Pathname.new(path).join('inspec.yml')

      # fallback to metadata.rb if inspec.yml does not exist
      # TODO deprecated, will be removed in InSpec 1.0
      mpath = File.join(@path, 'metadata.rb') if !mpath.exist?
      Metadata.from_file(mpath, @profile_id, @logger)
    end
  end
end
