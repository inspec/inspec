# encoding: utf-8
# copyright: 2017
# author: Aaron Lippold, lippold@gmail.com
# author: Rony Xavier, rx294@gmail.com
# license: All rights reserved

require 'pathname'

module Inspec::Resources
  class Nginx < Inspec.resource(1)
    name 'nginx'
    desc 'Use the nginx InSpec audit resource to test information about your NGINX instance.'
    example "
      describe nginx.pid_file do
        its('owner') { should be 'root' }
      end
      describe nginx.version do
        it { should_be >= 1.0.0 }
      end
      describe nginx do
        its('group') { should be 'root' }
      end
    "

    def initialize
      return skip_resource 'The `nginx` resource is not yet tested on your OS.' if inspec.os.windows?

      cmd = inspec.command('nginx -V 2>&1')
      if !cmd.exit_status.zero?
        return skip_resource 'Error using the command nginx -V'
      end
      @data = cmd.stdout
      @params = {}
      read_content
    end

    # @todo RFC: which of these methods should be private and or not exposed?
    #

    def method_missing(name)
      # ensure params are loaded
      read_content
      # extract values
      @params[name.to_s] unless @params.nil?
    end

    def read_content
      parse_config
      parse_path
      parse_http_path
    end

    def parse_config
      @params['prefix'] = @data.scan(/--prefix=(\S+)\s/).flatten.first
      @params['service'] = 'nginx'
      @params['user'] = @data.scan(/--user=(\S+)\s/).flatten.first
      @params['group'] = @data.scan(/--group=(\S+)\s/).flatten.first
      @params['version'] = @data.scan(%r{nginx version: nginx\/(\S+)\s}).flatten.first
    end

    def parse_path
      @params['conf_path'] = @data.scan(/--conf-path=(\S+)\s/).flatten.first
      @params['conf_dir'] = Pathname.new(@params['conf_path']).dirname.to_s
      @params['sbin_path'] = @data.scan(/--sbin-path=(\S+)\s/).flatten.first
      @params['modules_path'] = @data.scan(/--modules-path=(\S+)\s/).flatten.first
      @params['error_log_path'] = @data.scan(/--error-log-path=(\S+)\s/).flatten.first
      @params['http_log_path'] = @data.scan(/--http-log-path=(\S+)\s/).flatten.first
      @params['pid_path'] = @data.scan(/--pid-path=(\S+)\s/).flatten.first
      @params['lock_path'] = @data.scan(/--lock-path=(\S+)\s/).flatten.first
    end

    def parse_http_path
      @params['http_client_body_temp_path'] = @data.scan(/--http-client-body-temp-path=(\S+)\s/).flatten.first
      @params['http_proxy_temp_path'] = @data.scan(/--http-proxy-temp-path=(\S+)\s/).flatten.first
      @params['http_fastcgi_temp_path'] = @data.scan(/--http-fastcgi-temp-path=(\S+)\s/).flatten.first
      @params['http_uwsgi_temp_path'] = @data.scan(/--http-uwsgi-temp-path=(\S+)\s/).flatten.first
      @params['http_scgi_temp_path'] = @data.scan(/--http-scgi-temp-path=(\S+)\s/).flatten.first
    end

    def openssl_version
      result = @data.scan(/built with OpenSSL\s(\S+)\s(\d\d\s\S+\s\d\d\d\d)/).flatten
      openssl_version = { 'version' => result[0], 'date' => result[1] }
      openssl_version unless openssl_version.nil?
    end

    def compiler_info
      result = @data.scan(/built by (\S+)\s(\S+)\s(\S+)/).flatten
      compiler_info = { 'compiler' => result[0], 'version' => result[1], 'date' => result[2] }
      compiler_info unless compiler_info.nil?
    end

    def support_info
      support_info = @data.scan(/(.*\S+) support enabled/).flatten.join(' ')
      support_info unless support_info.nil?
    end

    def pid_file
      pid_file = inspec.file(@params['pid_path'])
      pid_file unless pid_file.nil?
    end

    def to_s
      'Nginx Environment'
    end

    private :read_content, :parse_config, :parse_path, :parse_http_path
  end
end
