require 'helper'

class Tester
  include ObjectTraverser
end

describe ObjectTraverser do
  let(:subject) { Tester.new }
  let(:sample_data) do
    {
      'string1' => 'value1',
      'string2' => 'value2',
      'number1' => 2468,
      'hash1'   => { 'key1' => 'value1' },
      'hash2'   => {
        'hash1string1' => 'value3',
        'hash1number1' => 123,
        'hash1subhash' => { 'key1' => 1, 'key2' => 2 },
      },
      'array1'  => %w(word1 word2 word3),
      'array2'  => [
        123,
        456,
        { 'array1hashkey1' => 1, 'array1hashkey2' => 2 },
      ],
      :symbol_key_1 => 123,
      :symbol_key_2 => {
        :symbol_under_symbol => 456,
        'string_under_symbol' => 789
      }
    }
  end

  it 'returns values from the top-level' do
    subject.extract_value(['string1'], sample_data).must_equal('value1')
    subject.extract_value(['string2'], sample_data).must_equal('value2')
    subject.extract_value(['number1'], sample_data).must_equal(2468)
  end

  it 'returns a full hash from the top-level' do
    subject.extract_value(['hash1'], sample_data).must_equal({ 'key1' => 'value1' })
  end

  it 'returns values from a hash' do
    subject.extract_value(['hash2', 'hash1string1'], sample_data).must_equal('value3')
    subject.extract_value(['hash2', 'hash1number1'], sample_data).must_equal(123)
  end

  it 'returns values from a nested hash' do
    subject.extract_value(['hash2', 'hash1subhash', 'key1'], sample_data).must_equal(1)
    subject.extract_value(['hash2', 'hash1subhash', 'key2'], sample_data).must_equal(2)
  end

  it 'returns a full array from the top level' do
    subject.extract_value(['array1'], sample_data).must_equal(%w(word1 word2 word3))
  end

  it 'returns values from the array using index numbers' do
    subject.extract_value(['array1', 0], sample_data).must_equal('word1')
    subject.extract_value(['array1', 1], sample_data).must_equal('word2')
    subject.extract_value(['array1', 2], sample_data).must_equal('word3')
  end

  it 'returns values from the array using methods' do
    subject.extract_value(['array1', 'first'], sample_data).must_equal('word1')
    subject.extract_value(['array1', 'last'], sample_data).must_equal('word3')
  end

  it 'returns nil when fetching from an array when it does not match a method' do
    subject.extract_value(['array1', 'not_a_valid_method'], sample_data).must_be_nil
  end

  it 'returns values from a nested hash within an array, accessing the array using numbers' do
    subject.extract_value(['array2', 2, 'array1hashkey1'], sample_data).must_equal(1)
    subject.extract_value(['array2', 2, 'array1hashkey2'], sample_data).must_equal(2)
  end

  it 'returns values from a nested hash within an array, accessing the array using methods' do
    subject.extract_value(['array2', 'last', 'array1hashkey1'], sample_data).must_equal(1)
    subject.extract_value(['array2', 'last', 'array1hashkey2'], sample_data).must_equal(2)
  end

  it 'supports returning values with symbol keys' do
    subject.extract_value([:symbol_key_1], sample_data).must_equal(123)
    subject.extract_value([:symbol_key_2, :symbol_under_symbol], sample_data).must_equal(456)
    subject.extract_value([:symbol_key_2, 'string_under_symbol'], sample_data).must_equal(789)
  end
end
