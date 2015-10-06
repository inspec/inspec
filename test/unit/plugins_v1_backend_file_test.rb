# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'

describe 'Vulcano::Plugins::Backend::FileCommon' do
  let(:cls) { Vulcano::Plugins::Backend::FileCommon }
  let(:backend) { cls.new }

  it 'default type is :unkown' do
    backend.type.must_equal :unknown
  end

  describe 'with non-empty content' do
    let(:backend) {
      Class.new(cls) do
        def content; 'Hello World'; end
      end.new
    }

    it 'must return raw content' do
      backend.content.must_equal 'Hello World'
    end

    it 'must calculate the md5sum of content' do
      backend.md5sum.must_equal 'b10a8db164e0754105b7a99be72e3fe5'
    end

    it 'must calculate the sha256sum of content' do
      backend.sha256sum.must_equal 'a591a6d40bf420404a011733cfb7b190d62c65bf0bcda32b57b277d9ad9f146e'
    end
  end

end
