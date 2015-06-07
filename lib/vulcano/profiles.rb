# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved
require 'vulcano/specfile'

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
      @log.ok "vmetadata.rb" unless md.nil? or md.incomplete?

      specs = Dir["#{path}/spec/*_spec.rb"]
      if specs.empty?
        @log.warn "No tests found in #{path}"
      end
      specs.each{|s| valid_spec? s }
    end

    def valid_spec? f
      return @log.error "Can't find spec file #{f}" unless File::file? f
      valid = true
      meta = get_spec_meta f
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

      missing_describes = meta['checks'].find_all{|x| !describe_lines.include? x['line_end']}
      missing_meta = describe_lines - meta['checks'].map{|x| x['line_end']}
      missing_meta.each do |mm|
        @log.error "Missing ID in file #{f} line #{mm}"
        @log.error "Missing impact in file #{f} line #{mm}"
        @log.error "Missing title in file #{f} line #{mm}"
        @log.warn "Missing description in file #{f} line #{mm}"
        valid = false
      end

      meta['checks'].each do |check|
        mm = check['line_end']
        @log.error "Missing ID in file #{f} line #{mm}" if check['id'].nil?
        @log.error "Missing impact in file #{f} line #{mm}" if check['impact'].nil?
        @log.error "Missing title in file #{f} line #{mm}" if check['title'].nil?
        @log.warn "Missing description in file #{f} line #{mm}" if check['description'].nil?
        if check['impact'].nil? or
           check['impact'] > 1.0 or
           check['impact'] < 0.0
          @log.error "Impact must be a number from 0.0-1.0, not #{check['impact']} ; file #{f} line #{mm}"
        end
        if check['id'].nil? || check['impact'].nil? || check['title'].nil?
          valid = false
        end
      end

      vs = Vulcano::Spec.from_file(f)
      @log.ok "Valid spec file in #{f}" if valid && vs.invalid_calls.empty?
    end

    private

    def add_specs_in_folder path
      allchecks = {}

      Dir["#{path}/spec/*_spec.rb"].each do |specfile|
        rel_path = specfile.sub(File.join(path,''), '')
        specs = SpecFile.from_file(specfile)
        allchecks[rel_path] = specs.vulcano_meta
      end

      res = Metadata.for_path(path, @log).dict
      res['checks'] = allchecks
      @profiles = res
    end

  end
end
