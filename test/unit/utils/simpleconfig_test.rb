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
end
