
require 'inspec/utils/nginx_parser'
require 'inspec/utils/find_files'
require 'inspec/utils/file_reader'
require 'forwardable'

# STABILITY: Experimental
# This resouce needs a proper interace to the underlying data, which is currently missing.
# Until it is added, we will keep it experimental.
#
# TODO: Support it on Windows. To do so, we need to recognize the base os and how
# it combines the file path. Calling `File.join` or similar methods may lead to errors
# when running remotely.
module Inspec::Resources
  class NginxConf < Inspec.resource(1)
    name 'nginx_conf'
    supports platform: 'unix'
    desc 'Use the nginx_conf InSpec resource to test configuration data '\
         'for the NginX web server located in /etc/nginx/nginx.conf on '\
         'Linux and UNIX platforms.'
    example <<~EXAMPLE
      describe nginx_conf.params ...
      describe nginx_conf('/path/to/my/nginx.conf').params ...
    EXAMPLE

    extend Forwardable

    include FindFiles
    include FileReader

    attr_reader :contents

    def initialize(conf_path = nil)
      @conf_path = conf_path || '/etc/nginx/nginx.conf'
      @contents = {}
      return skip_resource 'The `nginx_conf` resource is currently not supported on Windows.' if inspec.os.windows?
      read_content(@conf_path)
    end

    def params
      @params ||= parse_nginx(@conf_path)
    rescue StandardError => e
      skip_resource e.message
      @params = {}
    end

    def http
      NginxConfHttp.new(params['http'], self)
    end

    def_delegators :http, :servers, :locations

    def to_s
      "nginx_conf #{@conf_path}"
    end

    private

    def read_content(path)
      return @contents[path] if @contents.key?(path)
      @contents[path] = read_file_content(path, allow_empty: true)
    end

    def parse_nginx(path)
      return nil if inspec.os.windows?
      content = read_content(path)
      data = NginxConfig.parse(content)
      resolve_references(data, File.dirname(path))
    rescue StandardError => _
      raise "Cannot parse NginX config in #{path}."
    end

    # Cycle through the complete parsed data structure and try to find any
    # calls to `include`. In NginX, this is used to embed data from other
    # files into the current data structure.
    #
    # The method steps through the object structure that is passed in to
    # find any calls to 'include' and returns the object structure with the
    # included data merged in.
    #
    # @param data [Hash] data structure from NginxConfig.parse
    # @param rel_path [String] the relative path from which this config is read
    # @return [Hash] data structure with references included
    def resolve_references(data, rel_path)
      # Walk through all array entries to find more references
      return data.map { |x| resolve_references(x, rel_path) } if data.is_a?(Array)

      # Return any data that we cannot step into to find more `include` calls
      return data unless data.is_a?(Hash)

      # Any call to `include` gets its data read, parsed, and merged back
      # into the current data structure
      if data.key?('include')
        data.delete('include').flatten
            .map { |x| File.expand_path(x, rel_path) }
            .map { |x| find_files(x) }.flatten
            .map { |path| parse_nginx(path) }
            .each { |conf| merge_config!(data, conf) }
      end

      # Walk through the remaining hash fields to find more references
      Hash[data.map { |k, v| [k, resolve_references(v, rel_path)] }]
    end

    # Deep merge fields from NginxConfig.parse.
    # A regular merge would overwrite values so a deep merge is needed.
    # @param data [Hash] data structure from NginxConfig.parse
    # @param conf [Hash] data structure to be deep merged into data
    # @return [Hash] data structure with conf and data deep merged
    def merge_config!(data, conf)
      # Catch edge-cases
      return if data.nil? || conf.nil?
      # Step through all conf items and create combined return value
      data.merge!(conf) do |_, v1, v2|
        if v1.is_a?(Array) && v2.is_a?(Array)
          # If both the data field and the conf field are arrays, then combine them
          v1 + v2
        elsif v1.is_a?(Hash) && v2.is_a?(Hash)
          # If both the data field and the conf field are maps, then deep merge them
          merge_config!(v1, v2)
        else
          # All other cases, just use the new value (regular merge behavior)
          v2
        end
      end
    end
  end

  class NginxConfHttp
    attr_reader :entries
    def initialize(params, parent)
      @parent = parent
      @entries = (params || []).map { |x| NginxConfHttpEntry.new(x, parent) }
    end

    def servers
      @entries.map(&:servers).flatten
    end

    def locations
      servers.map(&:locations).flatten
    end

    def to_s
      @parent.to_s + ', http entries'
    end
    alias inspect to_s
  end

  class NginxConfHttpEntry
    attr_reader :params, :parent
    def initialize(params, parent)
      @params = params || {}
      @parent = parent
    end

    filter = FilterTable.create
    filter.register_column(:servers, field: 'server')
          .install_filter_methods_on_resource(self, :server_table)

    def locations
      servers.map(&:locations).flatten
    end

    def to_s
      @parent.to_s + ', http entry'
    end
    alias inspect to_s

    private

    def server_table
      @server_table ||= (params['server'] || []).map { |x| { 'server' => NginxConfServer.new(x, self) } }
    end
  end

  class NginxConfServer
    attr_reader :params, :parent
    def initialize(params, parent)
      @parent = parent
      @params = params || {}
    end

    filter = FilterTable.create
    filter.register_column(:locations, field: 'location')
          .install_filter_methods_on_resource(self, :location_table)

    def to_s
      server = ''
      name = Array(params['server_name']).flatten.first
      unless name.nil?
        server += name
        listen = Array(params['listen']).flatten.first
        server += ":#{listen}" unless listen.nil?
      end

      # go two levels up: 1. to the http entry and 2. to the root nginx conf
      @parent.parent.to_s + ", server #{server}"
    end
    alias inspect to_s

    private

    def location_table
      @location_table ||= (params['location'] || []).map { |x| { 'location' => NginxConfLocation.new(x, self) } }
    end
  end

  class NginxConfLocation
    attr_reader :params, :parent
    def initialize(params, parent)
      @parent = parent
      @params = params || {}
    end

    def to_s
      location = Array(params['_']).join(' ')
      # go three levels up: 1. to the server entry, 2. http entry and 3. to the root nginx conf
      @parent.parent.parent.to_s + ", location #{location.inspect}"
    end
    alias inspect to_s
  end
end
