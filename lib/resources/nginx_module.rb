# encoding: utf-8
# author: Rony Xavier, rx294@gmail.com
# author: Aaron Lippold, lippold@gmail.com

module Inspec::Resources
  class NginxModule < Inspec.resource(1)
    name 'nginx_module'
    desc 'Use the nginx_module InSpec audit resource to test nginx modules on Linux platforms.'
    example "
      describe nginx_module('http_auth_request') do
        it { should be_loaded }
      end
      "

    def initialize(modulename = nil)
      @module = modulename
      return skip_resource 'The `nginx_module` resource is not yet tested on your OS.' if !inspec.os.linux?
    end

    def loaded?
      loaded_modules.include?(@module)
    end

    def loaded_modules
      cmd = inspec.command('nginx -V 2>&1')
      modules_list = cmd.stdout.to_s.scan(/--with-(\S+)_module/).flatten
      cmd.exit_status.zero? ? modules_list : nil
    end

    def to_s
      "Nginx Module #{@module}"
    end
  end
end
