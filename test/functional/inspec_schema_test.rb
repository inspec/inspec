require 'functional/helper'

describe 'inspec schema' do
  include FunctionalHelper

  describe 'extracting the platforms schema export' do
    it 'can execute a platforms schema command' do
      out = inspec('schema platforms')
      out.stderr.must_equal ''
      out.exit_status.must_equal 0
      data = JSON.parse(out.stdout)
      data.class.must_equal Array
      data.size.must_be(:>, 1)
      data[0]['name'].must_equal 'aix'
      families = ['aix', 'unix', 'os']
      data[0]['families'].must_equal families
    end
  end
end
