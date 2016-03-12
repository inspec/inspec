# encoding: utf-8
# author: Dominik Richter
# author: Stephan Renatus
# author: Christoph Hartmann

require 'helper'

describe FilterTable do
  let (:data) {[
    { foo: 3, bar: true, baz: 'yay', num: nil },
    { foo: 2, bar: false, baz: 'noo', num: 1 },
    { foo: 2, bar: false, baz: 'whatever', num: 2 },
  ]}

  let (:resource) {
    Class.new do
      attr_reader :data
      def initialize(data)
        @data = data
      end
    end
  }

  let (:factory) { FilterTable.create(resource, :data) }
  let (:instance) { resource.new(data) }

  it 'has a create utility which creates a filter factory' do
    factory.must_be_kind_of FilterTable::Factory
  end

  describe 'when calling add_delegator' do
    it 'is chainable' do
      factory.add_delegator(:sth).must_equal factory
    end

    it 'wont add nil' do
      proc { factory.add_delegator(nil) }.must_throw RuntimeError
    end

    it 'can expose the where method' do
      factory.add_delegator(:where)
      _(instance.respond_to?(:where)).must_equal true
      instance.where({ baz: 'yay' }).params.must_equal [data[0]]
    end

    it 'will delegate even non-existing methods' do
      factory.add_delegator(:not_here)
      _(instance.respond_to?(:not_here)).must_equal true
    end
  end

  describe 'when calling add' do
    it 'is chainable' do
      factory.add(:sth).must_equal factory
    end

    it 'wont add nil' do
      proc { factory.add(nil) }.must_throw RuntimeError
    end

    it 'can expose a data column' do
      factory.add(:baz)
      instance.baz(123).must_be_kind_of(FilterTable::Table)
    end
  end

  describe 'with the number field' do
    before { factory.add(:num) }

    it 'filter by nil' do
      instance.num(nil).params.must_equal [data[0]]
    end

    it 'filter by existing numbers' do
      instance.num(1).params.must_equal [data[1]]
    end

    it 'filter by missing number' do
      instance.num(-1).params.must_equal []
    end
  end

  describe 'with the string field' do
    before { factory.add(:baz) }

    it 'filter by existing strings' do
      instance.baz('yay').params.must_equal [data[0]]
    end

    it 'filter by missing string' do
      instance.baz('num').params.must_equal []
    end

    it 'filter by existing regex' do
      instance.baz(/A/i).params.must_equal [data[0], data[2]]
    end

    it 'filter by missing regex' do
      instance.baz(/zzz/).params.must_equal []
    end
  end
end
