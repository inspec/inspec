require 'helper'

describe 'Vulcano::Plugins::Backend' do
  before do
    @backend = Vulcano::Plugins::Backend
    @child = Class.new(@backend)
  end

  it 'provides a name method for registering' do
    @child.must_respond_to :name
    @child.name 'test'
    # check if it's there
    reg = Vulcano::Backend.registry
    reg.keys.must_include 'test'
    reg['test'].must_equal @child
    # cleanup
    reg.delete('test')
  end
end
