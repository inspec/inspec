
require 'helper'
require 'inspec/config'
require 'inspec/runner_mock'
require 'fetchers/mock'

describe 'controls' do
  def load(content)
    data = {
      'inspec.yml' => "name: mock",
      'controls/mock.rb' => "control '1' do\n#{content}\nend\n",
    }
    opts = {
      test_collector: Inspec::RunnerMock.new,
      backend: Inspec::Backend.create(Inspec::Config.mock)
    }

    Inspec::Profile.for_target(data, opts)
                   .params[:controls]['1']
  end

  let(:rand_string) { rand.to_s }

  it 'adds a title' do
    load("title #{rand_string.inspect}")[:title].must_equal rand_string
  end

  it 'adds a description' do
    load("desc #{rand_string.inspect}")[:descriptions][:default].must_equal rand_string
  end

  it 'allows multiple desc with keys and values' do
    lines = <<-DESC_EXAMPLES
      desc 'this is default'
      desc 'example', 'this is foo'
      desc 'a space', 'this label has a space'
      desc 'newline', 'this value has
                       a newline'
      desc 'heredoc', <<-EOF
        This is a heredoc
      EOF
    DESC_EXAMPLES

    result = load(lines)
    result[:descriptions][:default].must_equal('this is default')
    result[:descriptions][:example].must_equal('this is foo')
    result[:descriptions][:'a space'].must_equal('this label has a space')
    result[:descriptions][:newline].must_match(/this value has\n\s*a newline/)
    result[:descriptions][:heredoc].must_equal('This is a heredoc')
  end

  it 'adds a multiline description' do
    t = rand_string + "\n" + rand_string
    load("desc #{t.inspect}")[:descriptions][:default].must_equal t
  end

  it 'strips empty lines and spaces in description at start and end' do
    t = "   \n" + rand_string + "\n   "
    load("desc #{t.inspect}")[:descriptions][:default].must_equal rand_string
  end

  it 'unindents properly' do
    t = "\n    #{rand_string}\n  \n\t\t    #{rand_string}\n "
    load("desc #{t.inspect}")[:descriptions][:default].must_equal "#{rand_string}\n  \n  #{rand_string}"
  end

  it 'works with empty refs' do
    load('ref')[:refs].must_be :empty?
  end

  it 'defines a simple ref' do
    s = rand.to_s
    load("ref #{s.inspect}")[:refs].must_equal [{:ref=>s}]
  end

  it 'defines a ref with url' do
    s = rand.to_s
    u = rand.to_s
    load("ref #{s.inspect}, url: #{u.inspect}")[:refs].must_equal [{ref: s, url: u}]
  end

  it 'defines a ref without content but with url' do
    u = rand.to_s
    load("ref url: #{u.inspect}")[:refs].must_equal [{url: u}]
  end

  it 'works with empty tags' do
    load('tag')[:tags].must_be :empty?
  end

  it 'defines a simple tag' do
    s = rand.to_s
    load("tag #{s.inspect}")[:tags].must_equal({ s => nil })
  end

  it 'define multiple tags' do
    a, b, c = rand.to_s, rand.to_s, rand.to_s
    load("tag #{a.inspect}, #{b.inspect}, #{c.inspect}")[:tags].must_equal(
      { a => nil, b => nil, c => nil })
  end

  it 'tag by key=value' do
    a, b = rand.to_s, rand.to_s
    load("tag #{a.inspect} => #{b.inspect}")[:tags].must_equal(
      { a => b })
  end
end
