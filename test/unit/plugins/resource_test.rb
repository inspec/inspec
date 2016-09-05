require 'helper'

describe Inspec::Plugins::Resource do
  let(:base) { Inspec::Plugins::Resource }

  describe '#name' do
    it "won't register a nil resource" do
      Class.new(base) do name nil; end
      Inspec::Resource.registry.keys.wont_include nil
      Inspec::Resource.registry.keys.wont_include ''
    end

    it "will register a valid name" do
      Class.new(base) do name 'hello'; end
      Inspec::Resource.registry['hello'].wont_be :nil?
    end
  end

  def create(&block)
    random_name = (0...50).map { (65 + rand(26)).chr }.join
    Class.new(base) do
      name random_name
      instance_eval &block
    end
    Inspec::Resource.registry[random_name]
  end

  describe '#desc' do
    it "will register a description" do
      expected = rand.to_s
      create { desc expected }.desc.must_equal expected
    end

    it "can change the description" do
      c = create { desc rand.to_s }
      c.desc(x = rand.to_s)
      c.desc.must_equal x
    end
  end

  describe '#example' do
    it "will register a description" do
      expected = rand.to_s
      create { example expected }.example.must_equal expected
    end

    it "can change the description" do
      c = create { example rand.to_s }
      c.example(x = rand.to_s)
      c.example.must_equal x
    end
  end

end
