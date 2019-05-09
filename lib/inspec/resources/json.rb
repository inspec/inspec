
require 'inspec/utils/object_traversal'
require 'inspec/utils/enumerable_delegation'
require 'inspec/utils/file_reader'

module Inspec::Resources
  class JsonConfig < Inspec.resource(1)
    name 'json'
    desc 'Use the json InSpec audit resource to test data in a JSON file.'
    example <<~EXAMPLE
      describe json('policyfile.lock.json') do
        its(['cookbook_locks','omnibus','version']) { should eq('2.2.0') }
      end

      describe json({ command: 'retrieve_data.py --json' }) do
        its('state') { should eq('open') }
      end

      describe json({ content: '{\"item1\": { \"status\": \"available\" } }' }) do
        its(['item1', 'status']) { should cmp 'available' }
      end
    EXAMPLE

    include ObjectTraverser
    include FileReader

    # make params readable
    attr_reader :params, :raw_content

    def initialize(opts)
      # pre-initialize @params to an empty hash. In the event that reading/parsing the data
      # throws an exception, this allows the resource to still be called outside of a
      # describe/test and not throw errors when a caller attempts to fetch a value from the params.
      @params = {}

      # load the raw content from the source, and then parse it
      @raw_content = load_raw_content(opts)
      @params = parse(@raw_content)

      # If the JSON content is enumerable, make this object enumerable too
      extend EnumerableDelegation if @params.respond_to?(:each)
    end

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

    def to_s
      "#{resource_base_name} #{@resource_name_supplement || 'content'}"
    end

    private

    def parse(content)
      require 'json'
      JSON.parse(content)
    rescue => e
      raise Inspec::Exceptions::ResourceFailed, "Unable to parse JSON: #{e.message}"
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
      read_file_content(path)
    end

    def load_raw_from_command(command)
      command_output = inspec.command(command).stdout
      raise Inspec::Exceptions::ResourceSkipped, "No output from command: #{command}" if command_output.nil? || command_output.empty?

      command_output
    end

    # for resources the subclass JsonConfig, this allows specification of the resource
    # base name in each subclass so we can build a good to_s method
    def resource_base_name
      'JSON'
    end
  end
end
