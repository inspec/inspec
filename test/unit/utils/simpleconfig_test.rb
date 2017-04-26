# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'

describe 'SimpleConfig Default Parser' do
  it 'should parse an empty string' do
    cur = SimpleConfig.new('')
    cur.params.must_equal({})
  end

  it 'should parse only spaces' do
    cur = SimpleConfig.new('    ')
    cur.params.must_equal({})
  end

  it 'should parse only tabs' do
    cur = SimpleConfig.new("\t")
    cur.params.must_equal({})
  end

  it 'should parse only newlines' do
    cur = SimpleConfig.new("\n")
    cur.params.must_equal({})
  end

  it 'should parse a simple assignment' do
    cur = SimpleConfig.new('a = b')
    cur.params.must_equal({ 'a' => 'b' })
  end

  it 'should parse a multiple assignments' do
    cur = SimpleConfig.new("a = b\n\nc = d")
    cur.params.must_equal({ 'a' => 'b', 'c' => 'd' })
  end

  it 'handles files with only comments' do
    cur = SimpleConfig.new('#a comment')
    cur.params.must_equal({})
  end

  it 'handles separate comments and assignments' do
    cur = SimpleConfig.new("# hello world\n\na = b")
    cur.params.must_equal({ 'a' => 'b' })
  end

  it 'handles comments and assignments combined' do
    cur = SimpleConfig.new('a = b# hello')
    cur.params.must_equal({ 'a' => 'b' })
  end

  it 'handles groups' do
    cur = SimpleConfig.new('[g]')
    cur.params.must_equal({ 'g' => {} })
    cur.groups.must_equal(['g'])
  end

  it 'handles non-group assignments and groups' do
    cur = SimpleConfig.new("a = b\n[g]")
    cur.params.must_equal({ 'a' => 'b', 'g' => {} })
    cur.groups.must_equal(['g'])
  end

  it 'handles assignments in groups' do
    cur = SimpleConfig.new("[g]\na = b")
    cur.params.must_equal({ 'g' => { 'a' => 'b' } })
    cur.groups.must_equal(['g'])
  end

  it 'handles multiple groups' do
    cur = SimpleConfig.new("[g]\na = b\n[k]\n\nc = d")
    res = {
      'g' => { 'a' => 'b' },
      'k' => { 'c' => 'd' },
    }
    cur.params.must_equal(res)
    cur.groups.must_equal(['g', 'k'])
  end

  it 'provides methods to access returned hashes' do
    cur = SimpleConfig.new("[section1]\nkey1 = value1\n\n[section2]\nkey2 = value2\n")
    cur.params['section1'].key1.must_equal('value1')
    cur.params['section2'].key2.must_equal('value2')
    cur.params['section2'].missing_key.must_be_nil
  end

  it 'supports :assignment_regex for specifying the assignment' do
    cur = SimpleConfig.new("key:::val", assignment_regex: /^(.*):::(.*)$/)
    cur.params.must_equal({'key' => 'val'})
  end

  it 'supports :assignment_re for specifying the assignment with a deprecation warning' do
    assert_output(nil, /DEPRECATION/) do
      cur = SimpleConfig.new("key:::val", assignment_re: /^(.*):::(.*)$/)
      cur.params.must_equal({'key' => 'val'})
    end
  end

  it 'only reads the first assignment match group by default' do
    cur = SimpleConfig.new("1:2:3", assignment_regex: /^(.*):(.*):(.*)$/)
    cur.params.must_equal({'1' => '2'})
  end

  it 'supports :key_values for specifying the number of values' do
    cur = SimpleConfig.new("1:2:3", assignment_regex: /^(.*):(.*):(.*)$/, key_values: 2)
    cur.params.must_equal({'1' => ['2', '3']})
  end

  it 'supports :key_values with more values than match groups' do
    cur = SimpleConfig.new("1:2:3", assignment_regex: /^(.*):(.*):(.*)$/, key_values: 4)
    cur.params.must_equal({'1' => ['2', '3', nil, nil]})
  end

  it 'supports :key_vals for specifying the assignment with a deprecation warning' do
    assert_output(nil, /DEPRECATION/) do
      cur = SimpleConfig.new("1:2:3", assignment_regex: /^(.*):(.*):(.*)$/, key_vals: 2)
      cur.params.must_equal({'1' => ['2', '3']})
    end
  end
end
