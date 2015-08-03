# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved
require 'verify/specfile'
require 'vulcano/log'

module Vulcano
  # Handle Vulcano Profiles
  class Profiles
    attr_reader :profiles
    def initialize opts = {}
      @profiles = {}
      @profile_id = opts[:id]
      @log = Log.new(opts)
    end

    def add_folder f
      path = File::expand_path(f)
      if File.directory? path
        add_specs_in_folder path
      else
        @log.error "Path is not a folder: #{path}"
      end
      self
    end

    def valid_folder? f
      path = File::expand_path(f)
      if !File.directory? path
        return @log.error "This is not a folder: #{path}"
      else
        @log.ok "Valid directory"
      end

      metadata = Metadata.for_path(path, @profile_id)
      @log.ok "vmetadata.rb" unless metadata.nil? or !metadata.valid?

      specs = Dir["#{path}/spec/*_spec.rb"]
      if specs.empty?
        @log.warn "No tests found in #{path}"
      end
      specs.each{|s| valid_spec? s, metadata }
    end

    def valid_spec? f, metadata
      return @log.error "Can't find spec file #{f}" unless File::file? f
      # validation tracking
      valid = true
      invalid = lambda {|type, msg|
        @log.send type, "#{msg} (#{File::basename f})"
        valid = false if type == :error
      }
      # Load the spec file
      specs = SpecFile.from_file(f, metadata)
      # find all errors during parsing
      specs.errors.each do |err|
        invalid.(:error, err)
      end
      # detect missing metadata
      meta = specs.metadata
      if meta['title'].nil?
        invalid.(:warn, "Missing title in spec file")
      end
      if meta['copyright'].nil?
        invalid.(:warn, "Missing copyright in spec file")
      end
      # detect empty rules
      unless meta['rules'][''].nil?
        invalid.(:error, "Please configure IDs for all rules.")
      end

      meta['rules'].each do |k,v|
        if v['impact'].nil?
          invalid.(:error, "Missing impact for rule #{k}")
        else
          invalid.(:error, "Impact cannot be larger than 1.0 for rule #{k}") if v['impact'] > 1.0
          invalid.(:error, "Impact cannot be less than 0.0 for rule #{k}") if v['impact'] < 0.0
        end
        invalid.(:warn, "Missing title for rule #{k}") if v['title'].nil?
        invalid.(:warn, "Missing description for rule #{k}") if v['desc'].nil?
      end

      if valid && specs.instance_variable_get(:@invalid_calls).empty?
        @log.ok "Valid spec file in #{f} with #{meta['rules'].length} rules"
      end
    end

    private

    def add_specs_in_folder path
      allrules = {}
      meta = Metadata.for_path(path, @profile_id, @log)

      Dir["#{path}/spec/*_spec.rb"].each do |specfile|
        rel_path = specfile.sub(File.join(path,''), '')
        specs = SpecFile.from_file(specfile, meta)
        allrules[rel_path] = sanitize_specfile_json(specs.metadata)
      end

      meta.dict['rules'] = allrules
      @profiles = meta.dict
    end

    def sanitize_specfile_json j
      j['rules'].each do |k,v|
        v['title'] = k if v['title'].nil?
        v['desc'] = "" if v['desc'].nil?
        v['impact'] = 1.0 if v['impact'].nil?
      end
      j
    end

  end
end
