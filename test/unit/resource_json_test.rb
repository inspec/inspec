# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::JSON' do
  resource = load_resource('json', 'policyfile.lock.json')

  it 'verify json parsing' do
    _(resource.params).wont_equal nil
    _(resource.send('name')).must_equal 'demo'
    _(resource.send('run_list')).must_equal %w{apache2 omnibus}
    _(resource.send('cookbook_locks.omnibus.version')).must_equal '2.2.0'
  end
end
