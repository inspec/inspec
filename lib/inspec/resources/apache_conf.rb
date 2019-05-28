# copyright: 2015, Vulcano Security GmbH

require 'inspec/utils/simpleconfig'
require 'inspec/utils/find_files'
require 'inspec/utils/file_reader'

module Inspec::Resources
  class ApacheConf < Inspec.resource(1)
    name 'apache_conf'
    supports platform: 'linux'
    supports platform: 'debian'
    desc 'Use the apache_conf InSpec audit resource to test the configuration settings for Apache. This file is typically located under /etc/apache2 on the Debian and Ubuntu platforms and under /etc/httpd on the Fedora, CentOS, Red Hat Enterprise Linux, and Arch Linux platforms. The configuration settings may vary significantly from platform to platform.'
    example <<~EXAMPLE
      describe apache_conf do
        its('setting_name') { should eq 'value' }
      end
    EXAMPLE

    include FindFiles
    include FileReader

    attr_reader :conf_path

    def initialize(conf_path = nil)
      @conf_path = conf_path || default_conf_path
      @files_contents = {}
      @content = nil
      @params = nil
      read_content
    end

    def content
      @content ||= read_content
    end

    def params(*opts)
      @params || read_content
      res = @params
      opts.each do |opt|
        res = res[opt] unless res.nil?
      end
      res
    end

    def method_missing(name)
      # ensure params are loaded
      @params || read_content

      # extract values
      @params[name.to_s] unless @params.nil?
    end

    def filter_comments(data)
      content = ''
      data.each_line do |line|
        if !line.match(/^\s*#/)
          content << line
        end
      end
      content
    end

    def read_content
      @content = ''
      @params = {}

      read_file_content(conf_path)

      to_read = [conf_path]
      until to_read.empty?
        raw_conf = read_file(to_read[0])
        @content += raw_conf

        # An explaination of the below regular expression.
        # Creates two capture groups.
        # The first group captures the first group of non-whitespace character
        # surrounded whitespace characters.
        # The second group contains a conditional with a positive lookahead
        # (does the line end with one or more spaces?). If the lookahead succeeds
        # a non-greedy capture takes place, if it fails then a greedy capture takes place.
        # The regex is terminated by an expression that matches zero or more spaces.
        params = SimpleConfig.new(
          raw_conf,
          assignment_regex: /^\s*(\S+)\s+['"]*((?=.*\s+$).*?|.*?)['"]*\s*$/,
          multiple_values: true,
        ).params

        # Capture any characters between quotes that are not escaped in values
        params.values.map! do |value|
          value.map! do |sub_value|
            sub_value[/(?<=["|'])(?:\\.|[^"'\\])*(?=["|'])/] || sub_value
          end
        end

        @params.merge!(params)

        to_read = to_read.drop(1)
        to_read += include_files(params).find_all do |fp|
          not @files_contents.key? fp
        end
      end

      # fiter comments
      @content = filter_comments @content
      @content
    end

    def include_files(params)
      # see if there is more config files to include
      include_files = params['Include'] || []
      include_files_optional = params['IncludeOptional'] || []

      includes = []
      (include_files + include_files_optional).each do |f|
        id    = Pathname.new(f).absolute? ? f : File.join(conf_dir, f)
        files = find_files(id, depth: 1, type: 'file')
        files += find_files(id, depth: 1, type: 'link')

        includes.push(files) if files
      end

      # [].flatten! == nil
      includes.flatten! || []
    end

    def read_file(path)
      @files_contents[path] ||= read_file_content(path, true)
    end

    def conf_dir
      if inspec.os.debian?
        File.dirname(conf_path)
      else
        # On RHEL-based systems, the configuration is usually in a /conf directory
        # that contains the primary config file. We assume the "config path" is the
        # directory that contains the /conf directory, such as /etc/httpd, so that
        # the conf.d directory can be properly located.
        Pathname.new(File.dirname(conf_path)).parent.to_s
      end
    end

    def to_s
      "Apache Config #{conf_path}"
    end

    private

    def default_conf_path
      if inspec.os.debian?
        '/etc/apache2/apache2.conf'
      else
        '/etc/httpd/conf/httpd.conf'
      end
    end
  end
end
