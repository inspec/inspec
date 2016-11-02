# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'utils/object_traversal'

module Inspec::Resources
  class JsonConfig < Inspec.resource(1)
    name 'json'
    desc 'Use the json InSpec audit resource to test data in a JSON file.'
    example "
      describe json('policyfile.lock.json') do
        its(['cookbook_locks','omnibus','version']) { should eq('2.2.0') }
      end

      describe json({ command: 'curl -i -H \"Accept: application/json\" url' }) do
        its('state') { should eq('open') }
      end

      describe json({ content: '{\"item1\": { \"status\": \"available\" } }' }) do
        its(['item1', 'status']) { should cmp 'available' }
      end

    "

    include ObjectTraverser

    # make params readable
    attr_reader :params

    def initialize(path)
      @path = path
      if path.is_a?(Hash)
        if path.key?(:content)
          @file_content = path[:content]
        elsif path.key?(:command)
          @command = inspec.command(path[:command])
          @file_content = @command.stdout
        end
      else
        @file = inspec.file(@path)
        @file_content = @file.content

        # check if file is available
        if !@file.file?
          skip_resource "Can't find file \"#{@conf_path}\""
          return @params = {}
        end

        # check if file is readable
        if @file_content.empty? && @file.size > 0
          skip_resource "Can't read file \"#{@conf_path}\""
          return @params = {}
        end
      end

      @params = parse(@file_content)
    end

    def parse(content)
      require 'json'
      JSON.parse(content)
    end

    def value(key)
      extract_value(key, @params)
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

    def to_s
      if @path.is_a?(Hash) && @path.key?(:content)
        'Json content'
      else
        "Json #{@path}"
      end
    end
  end
end
