require 'pathname'
require 'hashie/mash'

module Inspec::Resources
  class Nginx < Inspec.resource(1)
    name 'nginx'
    supports platform: 'unix'
    desc 'Use the nginx InSpec audit resource to test information about your NGINX instance.'
    example <<~EXAMPLE
      describe nginx do
        its('conf_path') { should cmp '/etc/nginx/nginx.conf' }
      end
      describe nginx('/etc/sbin/') do
        its('version') { should be >= '1.0.0' }
      end
      describe nginx do
        its('modules') { should include 'my_module' }
      end
    EXAMPLE
    attr_reader :params, :bin_dir

    def initialize(nginx_path = '/usr/sbin/nginx')
      return skip_resource 'The `nginx` resource is not yet available on your OS.' if inspec.os.windows?
      return skip_resource 'The `nginx` binary not found in the path provided.' unless inspec.command(nginx_path).exist?

      cmd = inspec.command("#{nginx_path} -V 2>&1")
      if !cmd.exit_status.zero?
        return skip_resource 'Error using the command nginx -V'
      end
      @data = cmd.stdout
      @params = {}
      read_content
    end

    %w{error_log_path http_client_body_temp_path http_fastcgi_temp_path http_log_path http_proxy_temp_path http_scgi_temp_path http_uwsgi_temp_path lock_path modules_path prefix sbin_path service version}.each do |property|
      define_method(property.to_sym) do
        @params[property.to_sym]
      end
    end

    def openssl_version
      result = @data.scan(/built with OpenSSL\s(\S+)\s(\d+\s\S+\s\d{4})/).flatten
      Hashie::Mash.new({ 'version' => result[0], 'date' => result[1] })
    end

    def compiler_info
      result = @data.scan(/built by (\S+)\s(\S+)\s(\S+)/).flatten
      Hashie::Mash.new({ 'compiler' => result[0], 'version' => result[1], 'date' => result[2] })
    end

    def support_info
      support_info = @data.scan(/(.*\S+) support enabled/).flatten
      support_info.empty? ? nil : support_info.join(' ')
    end

    def modules
      @data.scan(/--with-(\S+)_module/).flatten
    end

    def to_s
      'Nginx Environment'
    end

    private

    def read_content
      parse_config
      parse_path
      parse_http_path
    end

    def parse_config
      @params[:prefix] = @data.scan(/--prefix=(\S+)\s/).flatten.first
      @params[:service] = 'nginx'
      @params[:version] = @data.scan(%r{nginx version: nginx\/(\S+)\s}).flatten.first
    end

    def parse_path
      @params[:sbin_path] = @data.scan(/--sbin-path=(\S+)\s/).flatten.first
      @params[:modules_path] = @data.scan(/--modules-path=(\S+)\s/).flatten.first
      @params[:error_log_path] = @data.scan(/--error-log-path=(\S+)\s/).flatten.first
      @params[:http_log_path] = @data.scan(/--http-log-path=(\S+)\s/).flatten.first
      @params[:lock_path] = @data.scan(/--lock-path=(\S+)\s/).flatten.first
    end

    def parse_http_path
      @params[:http_client_body_temp_path] = @data.scan(/--http-client-body-temp-path=(\S+)\s/).flatten.first
      @params[:http_proxy_temp_path] = @data.scan(/--http-proxy-temp-path=(\S+)\s/).flatten.first
      @params[:http_fastcgi_temp_path] = @data.scan(/--http-fastcgi-temp-path=(\S+)\s/).flatten.first
      @params[:http_uwsgi_temp_path] = @data.scan(/--http-uwsgi-temp-path=(\S+)\s/).flatten.first
      @params[:http_scgi_temp_path] = @data.scan(/--http-scgi-temp-path=(\S+)\s/).flatten.first
    end
  end
end
