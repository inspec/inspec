# encoding: utf-8
# copyright: 2017
# author: Rony Xavier, rx294@nyu.edu

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::NginxModule' do
  describe 'mock the resource' do
    it 'Verify nginx_module parsing `loaded` - true' do
      resource = load_resource('nginx_module', nginx_path:'/usr/sbin/nginx', module_name: 'http_auth_request')
      _(resource.loaded?).must_equal true
    end
    it 'Verify nginx_module parsing `loaded` - false' do
      resource = load_resource('nginx_module', nginx_path:'/usr/sbin/nginx', module_name: 'fake_module')
      _(resource.loaded?).must_equal false
    end
    it 'Verify nginx_module parsing `loaded_modules` - true ' do
      resource = load_resource('nginx_module', nginx_path:'/usr/sbin/nginx', module_name: 'http_ssl')
      _(resource.loaded_modules).must_include 'http_ssl'
    end
    it 'Verify nginx_module parsing with custom path - true ' do
      resource = load_resource('nginx_module', nginx_path: '/usr/sbin/nginx', module_name: 'http_ssl')
      _(resource.loaded_modules).must_include 'http_ssl'
    end
  end
end
