require 'utils/simpleconfig'
require 'utils/object_traversal'

module Inspec::Resources
  class EtcLibUser < Inspec.resource(1)
    name 'etc_libuser'
    desc 'Use the etc_libuser InSpec audit resource to check the configuration of /etc/libuser.conf.
          Due to limitations of the RSpec engine and for consistency, please use the method described here
          (https://github.com/chef/inspec/issues/1543) for accessing the hierarchical values in
          /etc/libuser.conf'
    example "
          ---start sample /etc/libuser.conf---
          # See libuser.conf(5) for more information.
          ...
          [import]
          # Data from these files is used when libuser.conf does not define a value.
          # The mapping is documented in the man page.
          login_defs = /etc/login.defs
          default_useradd = /etc/default/useradd
          ...
          ---end sample /etc/libuser.conf---

          describe etc_libuser do
            its(['import','login_defs']){should eq ['/etc/login.defs']}
          end
         "

    include ObjectTraverser
    attr_reader :params, :raw_content

    def initialize(conf_path = nil)
      @conf_path = conf_path || inspec.os_env('LIBUSER_CONF').content || '/etc/libuser.conf'
      file = inspec.file(@conf_path)
      return skip_resource "The `etc_libuser` resource is not supported on your OS. Can't find '#{@conf_path}'." unless file.file?
      @params = nil
      @raw_content = load_raw_content(@conf_path)
      @params = parse(@raw_content)
    end

    def parse(content)
      @params = SimpleConfig.new(content, multiple_values: true).params
    end

    def to_s
      'Libuser Configuration from #{@conf_path}'
    end

    ###### NOTE: The following methods have been directly copied from the JSON resource due to bug #1300 (https://github.com/chef/inspec/issues/1300) #####
    
    # Shorthand to retrieve a parameter name via `#its`.
    # Example: describe json('file') { its('paramX') { should eq 'Y' } }
    #
    # @param [String] name name of the field to retrieve

    # @return [Object] the value stored at this position
    def method_missing(*keys)
      # catch bahavior of rspec its implementation
      # @see https://github.com/rspec/rspec-its/blob/master/lib/rspec/its.rb#L110
      keys.shift if keys.is_a?(Array) && keys[0] == :[]
      value(keys)
    end

    def value(key)
      # uses ObjectTraverser.extract_value to walk the hash looking for the key,
      # which may be an Array of keys for a nested Hash.
      extract_value(key, params)
    end

    def load_raw_content(opts)
      # if the opts isn't a hash, we assume it's a path to a file
      unless opts.is_a?(Hash)
        @resource_name_supplement = opts
        return load_raw_from_file(opts)
      end

      if opts.key?(:command)
        @resource_name_supplement = "from command: #{opts[:command]}"
        load_raw_from_command(opts[:command])
      elsif opts.key?(:content)
        opts[:content]
      else
        raise Inspec::Exceptions::ResourceFailed, 'No JSON content; must specify a file, command, or raw JSON content'
      end
    end

    def load_raw_from_file(path)
      file = inspec.file(path)

      # these are currently ResourceSkipped to maintain consistency with the resource
      # pre-refactor (which used skip_resource). These should likely be changed to
      # ResourceFailed during a major version bump.
      raise Inspec::Exceptions::ResourceSkipped, "No such file: #{path}" unless file.file?
      raise Inspec::Exceptions::ResourceSkipped, "File #{path} is empty or is not readable by current user" if file.content.nil? || file.content.empty?

      file.content
    end

    def load_raw_from_command(command)
      command_output = inspec.command(command).stdout
      raise Inspec::Exceptions::ResourceSkipped, "No output from command: #{command}" if command_output.nil? || command_output.empty?

      command_output
    end
  end
end

