require 'helper'

describe 'Vulcano::Plugins::Backend::FileCommon' do
  before do
    @backend = Vulcano::Plugins::Backend::FileCommon
    @test = @backend.new
  end

  it 'default type is :unkown' do
    @test.type.must_equal :unknown
  end

  describe 'with non-empty content' do
    before do
      @content = 'Hello World'
      @test = Class.new(@backend) do
        def content; 'Hello World'; end
      end.new
    end

    it 'must return raw content' do
      @test.content.must_equal @content
    end

    it 'must calculate the md5sum of content' do
      @test.md5sum.must_equal 'b10a8db164e0754105b7a99be72e3fe5'
    end

    it 'must calculate the sha256sum of content' do
      @test.sha256sum.must_equal 'a591a6d40bf420404a011733cfb7b190d62c65bf0bcda32b57b277d9ad9f146e'
    end
  end

end
