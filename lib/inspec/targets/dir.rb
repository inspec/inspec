# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

module Inspec::Targets
  # DirsHelper manages resolvers for directories. Wherever directories are,
  # either a local folder, archive, or remote, this module provides all helpers
  # than can resolve these.
  #
  # Resolvers provide these methods
  # * handles?(paths)  =>  true if the resolver is responsible for this target
  # * get_filenames    =>  Array[String] of files where tests/controls are found
  # * get_metadata     =>  String path with metadata information [optional]
  # * get_libraries    =>  Array[String] of library files [optional]
  #
  # Resolvers must register with this DirsHelper via #add_module .
  module DirsHelper
    extend Modulator

    def self.get_handler(paths)
      modules.values.reverse.find { |x| x.handles?(paths) }
    end
  end

  # Base class for all directory resolvers. I.e. any target helper that
  # takes a directory/archive/... and ultimately calls DirsHelper to resolve it.
  #
  # These resolvers must implement the required methods of this class.
  class DirsResolver
    def files
      fail NotImplementedError, "Directory resolver #{self.class} must implement #files"
    end

    # this resolves specific content from the directory or tarball
    def resolve(_path)
      fail NotImplementedError, "Directory resolver #{self.class} must implement #content"
    end

    def handler
      DirsHelper.get_handler(files) ||
        fail("Don't know how to handle #{self}")
    end

    def self.from_target(target, opts = {})
      new(target, opts)
    end

    # this resolves a target, eg. directory or tarball
    def self.resolve(target, opts)
      r = from_target(target, opts)
      handler = r.handler
      files = r.files

      res = []
      {
        test:     __collect(handler, :get_filenames, files),
        library:  __collect(handler, :get_libraries, files),
        metadata: __collect(handler, :get_metadata, files),
      }.each do |as, list|
        Array(list).each { |path|
          res.push(r.resolve(path, as: as))
        }
      end

      post_resolve(r, res, target)
    end

    def self.post_resolve(resolver, res, _target)
      return resolver.handler.resolve_contents(res) if resolver.handler.respond_to?(:resolve_contents)
      res
    end

    def self.__collect(handler, getter, files)
      return [] unless handler.respond_to? getter
      handler.method(getter).call(files)
    end
  end

  # InSpec profile Loader
  # Previous versions used the `test` directory instead of the new `controls`
  # directory. Usage of the test directory is deprecated and not recommended
  # anymore. Support for `test` will be removed in InSpec 1.0
  # TODO: remove `test` support for InSpec 1.0
  class ProfileDir
    def handles?(paths)
      return true if paths.include?('inspec.yml')
      (
        !paths.grep(/^controls/).empty? ||
        !paths.grep(/^test/).empty?
      ) && paths.include?('metadata.rb')
    end

    def get_libraries(paths)
      paths.find_all do |path|
        path.start_with?('libraries') && path.end_with?('.rb')
      end
    end

    def get_filenames(paths)
      paths.find_all do |path|
        path.start_with?('controls', 'test') && path.end_with?('.rb')
      end
    end

    def get_metadata(paths)
      return 'inspec.yml' if paths.include?('inspec.yml')
      return 'metadata.rb' if paths.include?('metadata.rb')
    end
  end
  DirsHelper.add_module('inspec-profile', ProfileDir.new)

  class ChefAuditDir
    def handles?(paths)
      paths.include?('recipes') and paths.include?('metadata.rb')
    end

    def get_filenames(paths)
      paths.find_all do |x|
        x.start_with? 'recipes/' and x.end_with? '.rb'
      end
    end
  end
  DirsHelper.add_module('chef-cookbook', ChefAuditDir.new)

  class ServerspecDir
    def handles?(paths)
      paths.include?('spec')
    end

    def get_filenames(paths)
      paths.find_all do |path|
        path.start_with? 'spec' and path.end_with? '_spec.rb'
      end
    end
  end
  DirsHelper.add_module('serverspec-folder', ServerspecDir.new)

  class FlatDir
    def handles?(paths)
      get_filenames(paths).empty? == false
    end

    def get_filenames(paths)
      # TODO: eventually remove the metadata.rb exception here
      # when we have fully phased out metadata.rb in 1.0
      paths.find_all { |x| x.end_with?('.rb') && !x.include?('/') && x != 'metadata.rb' }
    end
  end
  DirsHelper.add_module('flat-ruby-folder', FlatDir.new)
end
