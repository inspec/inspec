# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'functional/helper'
require 'jsonschema'

describe 'inspec check with json formatter' do
  include FunctionalHelper

  it 'can execute a simple file and validate the json schema' do
    out = inspec('check ' + integration_test_path + ' --format json')
    out.exit_status.must_equal 0
    data = JSON.parse(out.stdout)
  end
end
