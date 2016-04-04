require 'yaml'

# Custom resource based on the InSpec resource DSL
class GordonConfig < Inspec.resource(1)
  name 'gordon_config'

  desc "
    Gordon's resource description ...
  "

  example "
    describe gordon_config do
      its('version') { should eq('1.0') }
      its('file_size') { should > 1 }
    end
  "

  # Load the configuration file on initialization
  def initialize
    @params = {}
    @path = '/tmp/gordon/config.yaml'
    @file = inspec.file(@path)
    return skip_resource "Can't find file \"#{@path}\"" if !@file.file?

    # Protect from invalid YAML content
    begin
      @params = YAML.load(@file.content)
      # Add two extra matchers
      @params['file_size'] = @file.size
      @params['file_path'] = @path
      @params['ruby'] = 'RUBY IS HERE TO HELP ME!'
    rescue Exception
      return skip_resource "#{@file}: #{$!}"
    end
  end

  # Example method called by 'it { should exist }'
  # Returns true or false from the 'File.exists?' method
  def exists?
    return File.exists?(@path)
  end

  # Example matcher for the number of commas in the file
  def comma_count
    text = @file.content
    return text.count(',')
  end

  # Expose all parameters
  def method_missing(name)
    return @params[name.to_s]
  end
end
