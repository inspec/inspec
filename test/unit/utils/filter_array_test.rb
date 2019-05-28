require 'helper'

describe FilterArray do
  let (:data) {[
    { foo: 3, bar: true, baz: 'yay' },
    { foo: 2, bar: false, baz: 'noo' },
    { foo: 2, bar: false, baz: 'whatever' },
  ]}

  let (:instance) do
    FilterArray.new data
  end

  describe '#content' do
    it 'returns the current set' do
      instance.content.must_equal data
    end

    it 'can also be referred to as #rules' do
      instance.rules.must_equal instance.content
    end
  end

  describe '#field' do
    it 'retrieves (unique) values' do
      instance.field('foo').must_equal [3, 2]
    end

    it 'filters the current set' do
      instance.field('foo', 2).content.must_equal [
        { foo: 2, bar: false, baz: 'noo' },
        { foo: 2, bar: false, baz: 'whatever' },
      ]
    end

    it 'can be chained' do
      instance.field('foo', 2).field('baz', 'noo').content.must_equal [
        { foo: 2, bar: false, baz: 'noo' },
      ]
    end

    it 'can be abbreviated for retrieval' do
      instance.foo.must_equal [3, 2]
    end

    it 'can be abbreviated for querying' do
      instance.foo(2).content.must_equal [
        { foo: 2, bar: false, baz: 'noo' },
        { foo: 2, bar: false, baz: 'whatever' },
      ]
    end

    it 'returns `[nil]` when queried for a non-existing key' do
      instance.what.must_equal [nil]
    end
  end
end
