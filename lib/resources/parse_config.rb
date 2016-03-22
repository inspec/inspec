# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Dominik Richter
# author: Christoph Hartmann
# license: All rights reserved

# Usage example:
#
#  audit = command('/sbin/auditctl -l').stdout
#  options = {
#    assignment_re: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/,
#    multiple_values: true
#  }
#  describe parse_config(audit, options ) do

module Inspec::Resources
  class PConfig < Inspec.resource(1)
    name 'parse_config'
    desc 'Use the parse_config InSpec audit resource to test arbitrary configuration files.'
    example "
      output = command('some-command').stdout

      describe parse_config(output, { data_config_option: value } ) do
        its('setting') { should eq 1 }
      end
    "

    def initialize(content = nil, useropts = nil)
      @opts = {}
      @opts = useropts.dup unless useropts.nil?
      @files_contents = {}
      @params = nil

      @content = content
      read_content if @content.nil?
    end

    def method_missing(name)
      @params || read_content
      @params[name.to_s]
    end

    def parse_file(conf_path)
      @conf_path = conf_path

      # read the file
      if !inspec.file(conf_path).file?
        return skip_resource "Can't find file \"#{conf_path}\""
      end
      @content = read_file(conf_path).to_s
      if @content.empty? && inspec.file(conf_path).size > 0
        return skip_resource "Can't read file \"#{conf_path}\""
      end

      read_content
    end

    def read_file(path)
      @files_contents[path] ||= inspec.file(path).content
    end

    def read_content
      # parse the file
      @params = SimpleConfig.new(@content, @opts).params
      @content
    end

    def to_s
      "Parse Config #{@conf_path}"
    end
  end

  class PConfigFile < PConfig
    name 'parse_config_file'
    desc 'Use the parse_config_file InSpec audit resource to test arbitrary configuration files. It works identiacal to parse_config. Instead of using a command output, this resource works with files.'
    example "
      describe parse_config_file('/path/to/file') do
        its('setting') { should eq 1 }
      end
    "

    def initialize(path, opts = nil)
      super(nil, opts)
      parse_file(path)
    end

    def to_s
      "Parse Config File #{@conf_path}"
    end
  end
end
