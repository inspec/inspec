# encoding: utf-8
# Copyright 2015 Dominik Richter. All rights reserved.
# author: Dominik Richter
# author: Christoph Hartmann

require 'forwardable'
require 'digest'
require 'inspec/polyfill'
require 'inspec/cached_fetcher'
require 'inspec/file_provider'
require 'inspec/source_reader'
require 'inspec/metadata'
require 'inspec/backend'
require 'inspec/rule'
require 'inspec/log'
require 'inspec/profile_context'
require 'inspec/runtime_profile'
require 'inspec/method_source'
require 'inspec/dependencies/cache'
require 'inspec/dependencies/lockfile'
require 'inspec/dependencies/dependency_set'

module Inspec
  class Profile # rubocop:disable Metrics/ClassLength
    extend Forwardable

    def self.resolve_target(target, cache)
      Inspec::Log.debug "Resolve #{target} into cache #{cache.path}"
      Inspec::CachedFetcher.new(target, cache)
    end

    # Check if the profile contains a vendored cache, move content into global cache
    # TODO: use relative file provider
    # TODO: use source reader for Cache as well
    def self.copy_deps_into_cache(file_provider, opts)
      # filter content
      cache = file_provider.files.find_all do |entry|
        entry.start_with?('vendor')
      end
      content = Hash[cache.map { |x| [x, file_provider.read(x)] }]
      keys = content.keys
      keys.each do |key|
        next if content[key].nil?
        # remove prefix
        rel = Pathname.new(key).relative_path_from(Pathname.new('vendor')).to_s
        tar = Pathname.new(opts[:cache].path).join(rel)

        FileUtils.mkdir_p tar.dirname.to_s
        Inspec::Log.debug "Copy #{tar} to cache directory"
        File.write(tar.to_s, content[key].force_encoding('UTF-8'))
      end
    end

    def self.for_path(path, opts)
      file_provider = FileProvider.for_path(path)
      rp = file_provider.relative_provider

      # copy embedded dependecies into global cache
      copy_deps_into_cache(rp, opts) unless opts[:cache].nil?

      reader = Inspec::SourceReader.resolve(rp)
      if reader.nil?
        raise("Don't understand inspec profile in #{path}, it " \
             "doesn't look like a supported profile structure.")
      end
      new(reader, opts)
    end

    def self.for_fetcher(fetcher, opts)
      opts[:cache] = opts[:cache] || Cache.new
      path, writable = fetcher.fetch
      for_path(path, opts.merge(target: fetcher.target, writable: writable))
    end

    def self.for_target(target, opts = {})
      opts[:cache] = opts[:cache] || Cache.new
      fetcher = resolve_target(target, opts[:cache])
      for_fetcher(fetcher, opts)
    end

    attr_reader :source_reader, :backend, :runner_context
    def_delegator :@source_reader, :tests
    def_delegator :@source_reader, :libraries
    def_delegator :@source_reader, :metadata

    # rubocop:disable Metrics/AbcSize
    def initialize(source_reader, options = {})
      @source_reader = source_reader
      @target = options[:target]
      @logger = options[:logger] || Logger.new(nil)
      @locked_dependencies = options[:dependencies]
      @controls = options[:controls] || []
      @writable = options[:writable] || false
      @profile_id = options[:id]
      @cache = options[:cache] || Cache.new
      @backend = options[:backend] || Inspec::Backend.create(options.select { |k, _| k != 'target' })
      @attr_values = options[:attributes]
      @tests_collected = false
      @libraries_loaded = false
      Metadata.finalize(@source_reader.metadata, @profile_id, options)

      @runtime_profile = RuntimeProfile.new(self)
      @backend.profile = @runtime_profile

      @runner_context =
        options[:profile_context] ||
        Inspec::ProfileContext.for_profile(self, @backend, @attr_values)
    end

    def name
      metadata.params[:name]
    end

    def version
      metadata.params[:version]
    end

    def writable?
      @writable
    end

    #
    # Is this profile is supported on the current platform of the
    # backend machine and the current inspec version.
    #
    # @returns [TrueClass, FalseClass]
    #
    def supported?
      supports_os? && supports_runtime?
    end

    def supports_os?
      metadata.supports_transport?(@backend)
    end

    def supports_runtime?
      metadata.supports_runtime?
    end

    def params
      @params ||= load_params
    end

    def collect_tests(include_list = @controls)
      if !@tests_collected
        locked_dependencies.each(&:collect_tests)

        tests.each do |path, content|
          next if content.nil? || content.empty?
          abs_path = source_reader.target.abs_path(path)
          @runner_context.load_control_file(content, abs_path, nil)
        end
        @tests_collected = true
      end
      filter_controls(@runner_context.all_rules, include_list)
    end

    def filter_controls(controls_array, include_list)
      return controls_array if include_list.nil? || include_list.empty?
      controls_array.select do |c|
        id = ::Inspec::Rule.rule_id(c)
        include_list.include?(id)
      end
    end

    def load_libraries
      return @runner_context if @libraries_loaded

      locked_dependencies.each do |d|
        c = d.load_libraries
        @runner_context.add_resources(c)
      end

      libs = libraries.map do |path, content|
        [content, path]
      end

      @runner_context.load_libraries(libs)
      @libraries_loaded = true
      @runner_context
    end

    def to_s
      "Inspec::Profile<#{name}>"
    end

    # return info using uncached params
    def info!
      info(load_params.dup)
    end

    def info(res = params.dup)
      # add information about the controls
      res[:controls] = res[:controls].map do |id, rule|
        next if id.to_s.empty?
        data = rule.dup
        data.delete(:checks)
        data[:impact] ||= 0.5
        data[:impact] = 1.0 if data[:impact] > 1.0
        data[:impact] = 0.0 if data[:impact] < 0.0
        data[:id] = id
        data
      end.compact

      # resolve hash structure in groups
      res[:groups] = res[:groups].map do |id, group|
        group[:id] = id
        group
      end

      # add information about the required attributes
      res[:attributes] = res[:attributes].map(&:to_hash) unless res[:attributes].nil? || res[:attributes].empty?
      res[:sha256] = sha256
      res
    end

    # Check if the profile is internally well-structured. The logger will be
    # used to print information on errors and warnings which are found.
    #
    # @return [Boolean] true if no errors were found, false otherwise
    def check # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/MethodLength
      # initial values for response object
      result = {
        summary: {
          valid: false,
          timestamp: Time.now.iso8601,
          location: @target,
          profile: nil,
          controls: 0,
        },
        errors: [],
        warnings: [],
      }

      entry = lambda { |file, line, column, control, msg|
        {
          file: file,
          line: line,
          column: column,
          control_id: control,
          msg: msg,
        }
      }

      warn = lambda { |file, line, column, control, msg|
        @logger.warn(msg)
        result[:warnings].push(entry.call(file, line, column, control, msg))
      }

      error = lambda { |file, line, column, control, msg|
        @logger.error(msg)
        result[:errors].push(entry.call(file, line, column, control, msg))
      }

      @logger.info "Checking profile in #{@target}"
      meta_path = @source_reader.target.abs_path(@source_reader.metadata.ref)
      if meta_path =~ /metadata\.rb$/
        warn.call(@target, 0, 0, nil, 'The use of `metadata.rb` is deprecated. Use `inspec.yml`.')
      end

      # verify metadata
      m_errors, m_warnings = metadata.valid
      m_errors.each { |msg| error.call(meta_path, 0, 0, nil, msg) }
      m_warnings.each { |msg| warn.call(meta_path, 0, 0, nil, msg) }
      m_unsupported = metadata.unsupported
      m_unsupported.each { |u| warn.call(meta_path, 0, 0, nil, "doesn't support: #{u}") }
      @logger.info 'Metadata OK.' if m_errors.empty? && m_unsupported.empty?

      # extract profile name
      result[:summary][:profile] = metadata.params[:name]

      # check if the profile is using the old test directory instead of the
      # new controls directory
      if @source_reader.tests.keys.any? { |x| x =~ %r{^test/$} }
        warn.call(@target, 0, 0, nil, 'Profile uses deprecated `test` directory, rename it to `controls`.')
      end

      count = controls_count
      result[:summary][:controls] = count
      if count == 0
        warn.call(nil, nil, nil, nil, 'No controls or tests were defined.')
      else
        @logger.info("Found #{count} controls.")
      end

      # iterate over hash of groups
      params[:controls].each { |id, control|
        sfile = control[:source_location][:ref]
        sline = control[:source_location][:line]
        error.call(sfile, sline, nil, id, 'Avoid controls with empty IDs') if id.nil? or id.empty?
        next if id.start_with? '(generated '
        warn.call(sfile, sline, nil, id, "Control #{id} has no title") if control[:title].to_s.empty?
        warn.call(sfile, sline, nil, id, "Control #{id} has no description") if control[:desc].to_s.empty?
        warn.call(sfile, sline, nil, id, "Control #{id} has impact > 1.0") if control[:impact].to_f > 1.0
        warn.call(sfile, sline, nil, id, "Control #{id} has impact < 0.0") if control[:impact].to_f < 0.0
        warn.call(sfile, sline, nil, id, "Control #{id} has no tests defined") if control[:checks].nil? or control[:checks].empty?
      }

      # profile is valid if we could not find any error
      result[:summary][:valid] = result[:errors].empty?

      @logger.info 'Control definitions OK.' if result[:warnings].empty?
      result
    end

    def controls_count
      params[:controls].values.length
    end

    # generates a archive of a folder profile
    # assumes that the profile was checked before
    def archive(opts)
      # check if file exists otherwise overwrite the archive
      dst = archive_name(opts)
      if dst.exist? && !opts[:overwrite]
        @logger.info "Archive #{dst} exists already. Use --overwrite."
        return false
      end

      # remove existing archive
      File.delete(dst) if dst.exist?
      @logger.info "Generate archive #{dst}."

      # filter files that should not be part of the profile
      # TODO ignore all .files, but add the files to debug output

      # display all files that will be part of the archive
      @logger.debug 'Add the following files to archive:'
      files.each { |f| @logger.debug '    ' + f }

      if opts[:zip]
        # generate zip archive
        require 'inspec/archive/zip'
        zag = Inspec::Archive::ZipArchiveGenerator.new
        zag.archive(root_path, files, dst)
      else
        # generate tar archive
        require 'inspec/archive/tar'
        tag = Inspec::Archive::TarArchiveGenerator.new
        tag.archive(root_path, files, dst)
      end

      @logger.info 'Finished archive generation.'
      true
    end

    def locked_dependencies
      @locked_dependencies ||= load_dependencies
    end

    def lockfile_exists?
      @source_reader.target.files.include?('inspec.lock')
    end

    def lockfile_path
      File.join(cwd, 'inspec.lock')
    end

    def root_path
      @source_reader.target.prefix
    end

    def files
      @source_reader.target.files
    end

    #
    # TODO(ssd): Relative path handling really needs to be carefully
    # thought through, especially with respect to relative paths in
    # tarballs.
    #
    def cwd
      @target.is_a?(String) && File.directory?(@target) ? @target : './'
    end

    def lockfile
      @lockfile ||= if lockfile_exists?
                      Inspec::Lockfile.from_content(@source_reader.target.read('inspec.lock'))
                    else
                      generate_lockfile
                    end
    end

    #
    # Generate an in-memory lockfile. This won't render the lock file
    # to disk, it must be explicitly written to disk by the caller.
    #
    # @param vendor_path [String] Path to the on-disk vendor dir
    # @return [Inspec::Lockfile]
    #
    def generate_lockfile
      res = Inspec::DependencySet.new(cwd, @cache, nil, @backend)
      res.vendor(metadata.dependencies)
      Inspec::Lockfile.from_dependency_set(res)
    end

    def load_dependencies
      Inspec::DependencySet.from_lockfile(lockfile, cwd, @cache, @backend, { attributes: @attr_values })
    end

    # Calculate this profile's SHA256 checksum. Includes metadata, dependencies,
    # libraries, data files, and controls.
    #
    # @return [Type] description of returned object
    def sha256
      # get all dependency checksums
      deps = Hash[locked_dependencies.list.map { |k, v| [k, v.profile.sha256] }]

      res = Digest::SHA256.new
      files = source_reader.tests.to_a + source_reader.libraries.to_a +
              source_reader.data_files.to_a +
              [['inspec.yml', source_reader.metadata.content]] +
              [['inspec.lock.deps', YAML.dump(deps)]]

      files.sort { |a, b| a[0] <=> b[0] }
           .map { |f| res << f[0] << "\0" << f[1] << "\0" }

      res.hexdigest
    end

    private

    # Create an archive name for this profile and an additional options
    # configuration. Either use :output or generate the name from metadata.
    #
    # @param [Hash] configuration options
    # @return [Pathname] path for the archive
    def archive_name(opts)
      if (name = opts[:output])
        return Pathname.new(name)
      end

      name = params[:name] ||
             raise('Cannot create an archive without a profile name! Please '\
                  'specify the name in metadata or use --output to create the archive.')
      version = params[:version] ||
                raise('Cannot create an archive without a profile version! Please '\
                     'specify the version in metadata or use --output to create the archive.')
      ext = opts[:zip] ? 'zip' : 'tar.gz'
      slug = name.downcase.strip.tr(' ', '-').gsub(/[^\w-]/, '_')
      Pathname.new(Dir.pwd).join("#{slug}-#{version}.#{ext}")
    end

    def load_params
      params = @source_reader.metadata.params
      params[:name] = @profile_id unless @profile_id.nil?
      load_checks_params(params)
      @profile_id ||= params[:name]
      params
    end

    def load_checks_params(params)
      load_libraries
      tests = collect_tests
      params[:controls] = controls = {}
      params[:groups] = groups = {}
      prefix = @source_reader.target.prefix || ''
      tests.each do |rule|
        next if rule.nil?
        f = load_rule_filepath(prefix, rule)
        load_rule(rule, f, controls, groups)
      end
      params[:attributes] = @runner_context.attributes
      params
    end

    def load_rule_filepath(prefix, rule)
      file = rule.instance_variable_get(:@__file)
      file = file[prefix.length..-1] if file.start_with?(prefix)
      file
    end

    def load_rule(rule, file, controls, groups)
      id = Inspec::Rule.rule_id(rule)
      location = rule.instance_variable_get(:@__source_location)
      controls[id] = {
        title: rule.title,
        desc: rule.desc,
        impact: rule.impact,
        refs: rule.ref,
        tags: rule.tag,
        checks: Inspec::Rule.checks(rule),
        code: Inspec::MethodSource.code_at(location, source_reader),
        source_location: location,
      }

      groups[file] ||= {
        title: rule.instance_variable_get(:@__group_title),
        controls: [],
      }
      groups[file][:controls].push(id)
    end
  end
end
