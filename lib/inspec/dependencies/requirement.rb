# encoding: utf-8
require 'inspec/fetcher'
require 'digest'

module Inspec
  #
  # Inspec::Requirement represents a given profile dependency, where
  # appropriate we delegate to Inspec::Profile directly.
  #
  class Requirement # rubocop:disable Metrics/ClassLength
    attr_reader :name, :dep, :cwd, :opts
    attr_writer :dependencies

    def self.from_metadata(dep, vendor_index, opts)
      fail 'Cannot load empty dependency.' if dep.nil? || dep.empty?
      name = dep[:name] || fail('You must provide a name for all dependencies')
      version = dep[:version]
      new(name, version, vendor_index, opts[:cwd], opts.merge(dep))
    end

    def self.from_lock_entry(entry, cwd, vendor_index)
      req = new(entry['name'],
                entry['version_constraints'],
                vendor_index,
                cwd, { url: entry['resolved_source'] })

      locked_deps = []
      Array(entry['dependencies']).each do |dep_entry|
        locked_deps << Inspec::Requirement.from_lock_entry(dep_entry, cwd, vendor_index)
      end

      req.lock_deps(locked_deps)
      req
    end

    def initialize(name, version_constraints, vendor_index, cwd, opts)
      @name = name
      @version_requirement = Gem::Requirement.new(Array(version_constraints))
      @dep = Gem::Dependency.new(name, @version_requirement, :runtime)
      @vendor_index = vendor_index
      @opts = opts
      @cwd = cwd
    end

    def required_version
      @version_requirement
    end

    def source_version
      profile.metadata.params[:version]
    end

    def source_satisfies_spec?
      name = profile.metadata.params[:name]
      version = profile.metadata.params[:version]
      @dep.match?(name, version)
    end

    def to_hash
      h = {
        'name' => name,
        'resolved_source' => source_url,
        'version_constraints' => @version_requirement.to_s,
      }

      if !dependencies.empty?
        h['dependencies'] = dependencies.map(&:to_hash)
      end

      if is_vendored?
        h['content_hash'] = content_hash
      end
      h
    end

    def lock_deps(dep_array)
      @dependencies = dep_array
    end

    def is_vendored?
      @vendor_index.exists?(@name, source_url)
    end

    def content_hash
      @content_hash ||= begin
                          archive_path = @vendor_index.archive_entry_for(@name, source_url)
                          fail "No vendored archive path for #{self}, cannot take content hash" if archive_path.nil?
                          Digest::SHA256.hexdigest File.read(archive_path)
                        end
    end

    def source_url
      if opts[:path]
        "file://#{File.expand_path(opts[:path], @cwd)}"
      elsif opts[:url]
        opts[:url]
      end
    end

    def local_path
      @local_path ||= if fetcher.class == Fetchers::Local
                        File.expand_path(fetcher.target, @cwd)
                      else
                        @vendor_index.prefered_entry_for(@name, source_url)
                      end
    end

    def fetcher
      @fetcher ||= Inspec::Fetcher.resolve(source_url)
      fail "No fetcher for #{name} (options: #{opts})" if @fetcher.nil?
      @fetcher
    end

    def pull
      # TODO(ssd): Dispatch on the class here is gross.  Seems like
      # Fetcher is missing an API we want.
      if fetcher.class == Fetchers::Local || @vendor_index.exists?(@name, source_url)
        local_path
      else
        @vendor_index.add(@name, source_url, fetcher.archive_path)
      end
    end

    def dependencies
      @dependencies ||= profile.metadata.dependencies.map do |r|
        Inspec::Requirement.from_metadata(r, @vendor_index, cwd: @cwd)
      end
    end

    def to_s
      "#{dep} (#{source_url})"
    end

    def path
      @path ||= pull
    end

    def profile
      return nil if path.nil?
      @profile ||= Inspec::Profile.for_target(path, {})
    end
  end
end
