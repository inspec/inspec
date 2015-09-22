# encoding: utf-8

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::Passwd' do
  describe 'pip' do

    it 'verify pip package detail parsing' do
      pkg = {:name=>"Jinja2", :installed=>true, :version=>"2.8", :type=>"pip"}
      _(resource.installed?).must_equal true
      _(resource.info).must_equal pkg
    end
  let(:resource) { load_resource('pip', 'jinja2') }

  end
end
