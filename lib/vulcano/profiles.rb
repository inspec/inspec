# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved
require 'vulcano/specfile'
require 'vulcano/log'

module Vulcano
  # Handle Vulcano Profiles
  class Profiles
    attr_reader :profiles
    def initialize opts = {}
      @profiles = {}
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

      md = Metadata.for_path(path)
      @log.ok "vmetadata.rb" unless md.nil? or !md.valid?

      specs = Dir["#{path}/spec/*_spec.rb"]
      if specs.empty?
        @log.warn "No tests found in #{path}"
      end
      specs.each{|s| valid_spec? s }
    end

    def valid_spec? f
      return @log.error "Can't find spec file #{f}" unless File::file? f
      valid = true
      specs = SpecFile.from_file(f)
      meta = specs.vulcano_meta
      if meta['title'].nil?
        @log.error "Missing title in spec file #{f}"
        valid = false
      end
      if meta['copyright'].nil?
        @log.error "Missing copyright in spec file #{f}"
        valid = false
      end

      raw = File::read(f)
      describe_lines = raw.split("\n").each_with_index.
        find_all{|line,idx| line =~ /^[^"#]*describe.*do(\s|$)/ }.
        map{|x| x[1]+1 }

      unless meta['rules'][''].nil?
        @log.error "Please configure IDs for all rules."
      end

      invalid = lambda {|msg|
        @log.error "#{msg} (#{File::basename f})"
        valid = false
      }

      meta['rules'].each do |k,v|
        if v['impact'].nil?
          invalid.("Missing impact for rule #{k}")
        else
          invalid.("Impact cannot be larger than 1.0 for rule #{k}") if v['impact'] > 1.0
          invalid.("Impact cannot be less than 0.0 for rule #{k}") if v['impact'] < 0.0
        end
        invalid.("Missing title for rule #{k}") if v['title'].nil?
        invalid.("Missing description for rule #{k}") if v['desc'].nil?
      end

      if valid && specs.instance_variable_get(:@invalid_calls).empty?
        @log.ok "Valid spec file in #{f} with #{meta['rules'].length} rules"
      end
    end

    private

    def add_specs_in_folder path
      allrules = {}

      Dir["#{path}/spec/*_spec.rb"].each do |specfile|
        rel_path = specfile.sub(File.join(path,''), '')
        specs = SpecFile.from_file(specfile)
        allrules[rel_path] = sanitize_specfile_json(specs.vulcano_meta)
      end

      res = Metadata.for_path(path, @log).dict
      res['rules'] = allrules
      @profiles = res
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
