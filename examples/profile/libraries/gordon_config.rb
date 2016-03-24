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
      its('size') { should > 1 }
    end
  "

  # Load the configuration file on initialization
  def initialize
    @path = '/tmp/gordon/config.yaml'
    @file = inspec.file(@path)
    return skip_resource "Can't find file \"#{@path}\"" if !@file.file?

    # Protect from invalid YAML content
    begin
      @params = YAML.load(@file.content)
    rescue Exception
      return skip_resource "#{@file}: #{$!}"
    end
    add_some_extra_params
  end

  # Extra Ruby helper method
  def add_some_extra_params
    @params['size']=@file.size
    @params['md5sum']=@file.md5sum
  end

  # Expose all parameters
  def method_missing(name)
    @params[name.to_s]
  end
end
