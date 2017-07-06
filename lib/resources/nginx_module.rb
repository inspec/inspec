# encoding: utf-8
# author: Rony Xavier, rx294@gmail.com
# author: Aaron Lippold, lippold@gmail.com

module Inspec::Resources
  class NginxModule < Inspec.resource(1)
    name 'nginx_module'
    desc 'Use the nginx_module InSpec audit resource to test nginx modules on Linux platforms.'
    example "
      describe nginx_module(module_name: 'http_auth_request') do
        it { should be_loaded }
      end
      "

    def initialize(opts = {})
      return skip_resource 'The `nginx_module` resource is not yet available on your OS.' if !inspec.os.linux?
      @module = opts[:module_name]
      @path = opts[:nginx_path] || "#{inspec.nginx.bin_dir}/nginx" || '/usr/sbin/nginx' # bad
      return skip_resource 'Cannot find the NGINX binary' if @nginx_path.nil?
      return skip_resource 'NGINX does not seem to be installed on your system' if !inspec.command(@nginx_path.to_s).exist?
    end

    def loaded?
      raise 'No module name supplied - cannot check if nginx module is loaded' if @module.nil?
      loaded_modules.include?(@module)
    end

    def loaded_modules
      cmd = inspec.command("#{@path} -V 2>&1")
      modules_list = cmd.stdout.to_s.scan(/--with-(\S+)_module/).flatten
      cmd.exit_status.zero? ? modules_list : []
    end

    def to_s
      "Nginx Module #{@module}"
    end
  end
end
