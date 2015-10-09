# encoding: utf-8
#
# Author:: Dominik Richter (<dominik.richter@gmail.com>)
require 'helper'

describe Train do
  describe '#create' do
    it 'returns nil if the transport plugin isnt found' do
      Train.create('missing').must_be_nil
    end
  end
end
