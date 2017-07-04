# encoding: utf-8
# copyright: 2017
# author: Aaron Lippold, lippold@gmail.com
# author: Rony Xavier, rx294@gmail.com

require 'pathname'
require 'hashie/mash'

module Inspec::Resources
  class Nginx < Inspec.resource(1)
    name 'nginx'
    desc 'Use the nginx InSpec audit resource to test information about your NGINX instance.'
    example "
      describe nginx do
        its('conf_path') { should cmp '/etc/nginx/nginx.conf' }
      end
      describe nginx('/etc/sbin') do
        its('version') { should be >= '1.0.0' }
      end
    "
    attr_reader :params

    def initialize(nginx_bin_dir = nil)
      return skip_resource 'The `nginx` resource is not yet available on your OS.' if inspec.os.windows?
      bin_dir = nginx_bin_dir || bin_dir_from_command || locate_bin_dir_by_path
      if bin_dir.nil? || !inspec.command("#{bin_dir}/nginx").exist?
        return skip_resource 'Error fining the NGINX binary, plese review the
                              provided `PATH` is only the `base_dir` and or ensure
                              the `nginx` binary is in the system `PATH`.'
      end
      cmd = inspec.command("#{bin_dir}/nginx -V 2>&1")
      if !cmd.exit_status.zero?
        return skip_resource 'Error using the command nginx -V'
      end
      @data = cmd.stdout
      @params = {}
      read_content
    end

    %w{compiler_info conf_dir error_log_path http_client_body_temp_path http_fastcgi_temp_path http_log_path http_proxy_temp_path http_scgi_temp_path http_uwsgi_temp_path lock_path modules_path openssl_version prefix sbin_path service support_info version}.each do |property|
      define_method(property.to_sym) do
        @params[property.to_sym]
      end
    end

    def to_s
      'Nginx Environment'
    end

    def openssl_version
      result = @data.scan(/built with OpenSSL\s(\S+)\s(\d\d\s\S+\s\d\d\d\d)/).flatten
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

    private

    def bin_dir_from_command
      return unless inspec.command('nginx').exist?
      inspec.command('which nginx | cut -d/ -f1,2,3').stdout.strip
      false
    end

    def locate_bin_dir_by_path
      bin_dir_loc = nil
      bin_list = [
        '/usr/sbin/nginx',
        '/usr/bin/nginx',
        '/usr/local/sbin/nginx',
        '/usr/local/bin/nginx',
        '/opt/sbin/nginx',
        '/opt/bin/nginx'
      ]

      bin_list.each do |dir|
        bin_dir_loc = Pathname.new(dir).dirname if inspec.command(dir).exist?
        break
      end

      if bin_dir_loc.nil?
        warn 'Unable to find the NGINX bin_dir in the expected location(s), please
        execute "nginx -V" as the `root` user to find the non-starndard bin_dir
        location.'
      end
      bin_dir_loc
    end

    def read_content
      parse_config
      parse_path
      parse_http_path
    end

    def nginx_conf_from_command
      cmd = inspec.command("ps aux | grep 'nginx *-c' | awk '{ print $NF }'")
      cmd.exit_status.zero? ? cmd.stdout.chomp : nil
    end

    def locate_conf_dir_by_path
      conf_dir_loc = nil
      dir_list = [
        '/etc/nginx',
        '/etc/conf/nginx',
        '/usr/local/nginx/conf',
        '/usr/local/etc/nginx',
        '/opt/nginx/conf',
        '/opt/etc/nginx',
      ]

      dir_list.each do |dir|
        conf_dir_loc = dir if inspec.directory(dir).exist?
        break
      end

      if conf_dir_loc.nil?
        warn 'Unable to find the NGINX conf_dir in the expected location(s), please
        execute "nginx -V" as the `root` user to find the non-starndard conf_dir
        location.'
      end
      conf_dir_loc
    end

    def parse_config
      @params[:prefix] = @data.scan(/--prefix=(\S+)\s/).flatten.first
      @params[:service] = 'nginx'
      @params[:version] = @data.scan(%r{nginx version: nginx\/(\S+)\s}).flatten.first
    end

    def parse_path
      @params[:conf_path] = nginx_conf_from_command || "#{locate_conf_dir_by_path}/nginx.conf"
      @params[:conf_dir] = Pathname.new(@params[:conf_path]).dirname.to_s
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
