# encoding: utf-8
require 'inspec/fetcher'

module Inspec
  class Requirement
    attr_reader :name, :dep, :cwd, :opts

    def initialize(name, version_constraints, vendor_index, cwd, opts)
      @name = name
      @dep = Gem::Dependency.new(name,
                                 Gem::Requirement.new(Array(version_constraints)),
                                 :runtime)
      @vendor_index = vendor_index
      @opts = opts
      @cwd = cwd
    end

    def matches_spec?(spec)
      params = spec.profile.metadata.params
      @dep.match?(params[:name], params[:version])
    end

    def source_url
      case source_type
      when :local_path
        "file://#{File.expand_path(opts[:path])}"
      when :url
        @opts[:url]
      end
    end

    def local_path
      @local_path ||= case source_type
                      when :local_path
                        File.expand_path(opts[:path])
                      else
                        @vendor_index.prefered_entry_for(@name, source_url)
                      end
    end

    def source_type
      @source_type ||= if @opts[:path]
                         :local_path
                       elsif opts[:url]
                         :url
                       else
                         fail "Cannot determine source type from #{opts}"
                       end
    end

    def fetcher_class
      @fetcher_class ||= case source_type
                         when :local_path
                           Fetchers::Local
                         when :url
                           Fetchers::Url
                         else
                           fail "No known fetcher for dependency #{name} with source_type #{source_type}"
                         end

      fail "No fetcher for #{name} (options: #{opts})" if @fetcher_class.nil?
      @fetcher_class
    end

    def pull
      case source_type
      when :local_path
        local_path
      else
        if @vendor_index.exists?(@name, source_url)
          local_path
        else
          archive = fetcher_class.download_archive(source_url)
          @vendor_index.add(@name, source_url, archive.path)
        end
      end
    end

    def to_s
      dep.to_s
    end

    def path
      @path ||= pull
    end

    def profile
      return nil if path.nil?
      @profile ||= Inspec::Profile.for_target(path, {})
    end

    def self.from_metadata(dep, vendor_index, opts)
      fail 'Cannot load empty dependency.' if dep.nil? || dep.empty?
      name = dep[:name] || fail('You must provide a name for all dependencies')
      version = dep[:version]
      new(name, version, vendor_index, opts[:cwd], opts.merge(dep))
    end
  end
end
