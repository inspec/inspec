# encoding: UTF-8

libpath = File.expand_path '../../lib', __FILE__
require File.join(libpath, 'inifile')
require 'fileutils'
require 'test/unit'


class TestIniFile < Test::Unit::TestCase

  def setup
    @ini_file = IniFile.new(:filename => 'test/data/good.ini')
    @contents = [
      ['section_one', 'one', 1],
      ['section_one', 'two', 2],
      ['section_two', 'three', -3],
      ['section_two', 'multi', "multiline support"],
      ['section three', 'four', true],
      ['section three', 'five', false],
      ['section three', 'six', 6.0],
      ['section_five', 'seven and eight', '7 & 8']
    ].sort

    FileUtils.rm_rf "test/data/tmp.ini"
    FileUtils.cp    "test/data/good.ini", "test/data/tmp.ini"
  end

  def teardown
    FileUtils.rm_rf "test/data/tmp.ini"
  end

  def test_class_load
    ini_file = IniFile.load 'test/data/good.ini'
    assert_instance_of IniFile, ini_file

    # see if we can parse different style comments
    assert_raise(IniFile::Error) {IniFile.load 'test/data/comment.ini', :comment => ';'}

    ini_file = IniFile.load 'test/data/comment.ini', :comment => '#'
    assert_instance_of IniFile, ini_file

    # see if we can parse mixed style comments
    assert_raise(IniFile::Error) {IniFile.load 'test/data/mixed_comment.ini', :comment => '#'}

    ini_file = IniFile.load 'test/data/mixed_comment.ini', :comment => ';#'
    assert_instance_of IniFile, ini_file

    # see if we can parse different style param separators
    assert_raise(IniFile::Error) {IniFile.load 'test/data/param.ini'}

    ini_file = IniFile.load 'test/data/param.ini', :parameter => ':'
    assert_instance_of IniFile, ini_file

    # make sure we error out on files with bad lines
    assert_raise(IniFile::Error) {IniFile.load 'test/data/bad_1.ini'}
  end

  def test_clone
    clone = @ini_file.clone
    assert_equal @ini_file, clone
    assert !clone.tainted?
    assert !clone.frozen?

    # the clone should be completely independent of the original
    clone['new_section']['one'] = 1
    assert_not_equal @ini_file, clone

    # the tainted state is copied to clones
    @ini_file.taint
    assert @ini_file.tainted?

    clone = @ini_file.clone
    assert clone.tainted?

    # the frozen state is also copied to clones
    @ini_file.freeze
    assert @ini_file.frozen?

    clone = @ini_file.clone
    assert clone.tainted?
    assert clone.frozen?
  end

  def test_delete_section
    assert_nil @ini_file.delete_section('section_nil')

    h = {'one' => 1, 'two' => 2}
    assert_equal true, @ini_file.has_section?('section_one')
    assert_equal h, @ini_file.delete_section('section_one')
    assert_equal false, @ini_file.has_section?('section_one')
    assert_nil @ini_file.delete_section('section_one')
  end

  def test_dup
    dup = @ini_file.dup
    assert_equal @ini_file, dup
    assert !dup.tainted?
    assert !dup.frozen?

    # the duplicate should be completely independent of the original
    dup['new_section']['one'] = 1
    assert_not_equal @ini_file, dup

    # the tainted state is copied to duplicates
    @ini_file.taint
    assert @ini_file.tainted?

    dup = @ini_file.dup
    assert dup.tainted?

    # the frozen state, however, is not
    @ini_file.freeze
    assert @ini_file.frozen?

    dup = @ini_file.dup
    assert dup.tainted?
    assert !dup.frozen?
  end

  def test_each
    ary = []
    @ini_file.each {|*args| ary << args}

    assert_equal @contents, ary.sort

    ary = []
    IniFile.new(:filename => 'temp.ini').each {|*args| ary << args}
    assert_equal [], ary
  end

  def test_each_section
    expected = [
      'section_one', 'section_two', 'section three',
      'section_four', 'section_five'
    ].sort

    ary = []
    @ini_file.each_section {|section| ary << section}

    assert_equal expected, ary.sort

    ary = []
    IniFile.new(:filename => 'temp.ini').each_section {|section| ary << section}
    assert_equal [], ary
  end

  def test_eql_eh
    assert @ini_file.eql?(@ini_file)
    assert @ini_file.eql?(@ini_file.clone)
    assert !@ini_file.eql?('string')
    assert !@ini_file.eql?(IniFile.new(:content => ''))
  end

  def test_freeze
    assert_equal false, @ini_file.frozen?
    @ini_file.each_section do |s|
      assert_equal false, @ini_file[s].frozen?
    end

    @ini_file.freeze

    assert_equal true, @ini_file.frozen?
    @ini_file.each_section do |s|
      assert_equal true, @ini_file[s].frozen?
    end
  end

  def test_has_section_eh
    assert_equal true,  @ini_file.has_section?('section_one')
    assert_equal false, @ini_file.has_section?('section_ten')
    assert_equal true,  @ini_file.has_section?(:section_two)
    assert_equal false, @ini_file.has_section?(nil)

    ini_file = IniFile.new(:filename => 'temp.ini')
    assert_equal false, ini_file.has_section?('section_one')
    assert_equal false, ini_file.has_section?('one')
    assert_equal false, ini_file.has_section?('two')
  end

  def test_index
    expected = {
      'one' => 1,
      'two' => 2
    }
    assert_equal expected, @ini_file[:section_one]

    expected = {'three' => -3, 'multi' => "multiline support"}
    assert_equal expected, @ini_file['section_two']

    expected = {
      'four' => true,
      'five' => false,
      'six'  => 6.0,
    }
    assert_equal expected, @ini_file['section three']

    expected = {}
    assert_equal expected, @ini_file['section_four']

    expected = {'seven and eight' => '7 & 8'}
    assert_equal expected, @ini_file['section_five']

    expected = {}
    assert_equal expected, @ini_file['section_six']

    assert_nil @ini_file[nil]

    expected = {}
    ini_file = IniFile.new(:filename => 'temp.ini')
    assert_equal expected, ini_file['section_one']
    assert_equal expected, ini_file['one']
    assert_nil ini_file[nil]
  end

  def test_match
    expected = {
     "section_two" => {
        "three" => -3, "multi" => "multiline support"
      },
      "section three" => {
        "four" => true, "five"=> false, "six" => 6.0
      }
    }
    assert_equal expected, @ini_file.match(/(two|three)/)

    # the match function should not delete entries from the inifile hash
    assert_equal({'seven and eight' => '7 & 8'}, @ini_file['section_five'])

    expected = {}
    assert_equal expected, @ini_file.match(/houndreds/)
  end

  def test_initialize
    # see if we can parse different style comments
    #assert_raise(IniFile::Error) {IniFile.new 'test/data/comment.ini'}

    ini_file = IniFile.new(:filename => 'test/data/comment.ini', :comment => '#')
    assert ini_file.has_section?('section_one')
    assert_equal '20 + 22 = 42', ini_file['section_two']['multi']

    # see if we can parse different style param separators
    assert_raise(IniFile::Error) {IniFile.new(:filename => 'test/data/param.ini')}

    ini_file = IniFile.new(:filename => 'test/data/param.ini', :parameter => ':')
    assert ini_file.has_section?('section_one')
    assert_equal 1, ini_file['section_one']['one']
    assert_equal 2, ini_file['section_one']['two']

    # make sure we error out on files with bad lines
    assert_raise(IniFile::Error) {IniFile.new :filename => 'test/data/bad_1.ini'}
  end

  def test_initialize_from_string_without_ending_newline
    content = "[section_one]\n  foo=bar"
    ini_file = IniFile.new(:content => content)
    assert ini_file.has_section?('section_one')
    assert_equal 'bar', ini_file['section_one']['foo']
  end

  def test_initialize_from_string
    content = File.read('test/data/good.ini')

    ini_file = IniFile.new(:content => content, :comment => ';')
    assert ini_file.has_section?('section_one')
    assert ini_file.has_section?('section_two')
    assert ini_file.has_section?('section three')
    assert ini_file.has_section?('section_four')
    assert ini_file.has_section?('section_five')

    assert_equal '7 & 8', ini_file['section_five']['seven and eight']
  end

  def test_initialize_from_hash
    hash = {
      'section one' => {
        'foo' => 'bar',
        'baz' => 'buz'
      },
      'colors' => {
        'perrywinkle' => '7e6ff3',
        'steelblue' => '4682b4'
      },
      'empty' => nil
    }

    ini_file = IniFile.new(:content => hash)
    assert ini_file.has_section?('section one')
    assert ini_file.has_section?('colors')
    assert ini_file.has_section?('empty')

    assert_equal %w[baz foo], ini_file['section one'].keys.sort
    assert_equal 'bar', ini_file['section one']['foo']
    assert_equal 'buz', ini_file['section one']['baz']

    assert_equal %w[perrywinkle steelblue], ini_file['colors'].keys.sort
    assert_equal '7e6ff3', ini_file['colors']['perrywinkle']
    assert_equal '4682b4', ini_file['colors']['steelblue']

    assert_empty ini_file['empty']
  end

  def test_sections
    expected = [
      'section_one', 'section_two', 'section three',
      'section_four', 'section_five'
    ].sort

    assert_equal expected, @ini_file.sections.sort

    ini_file = IniFile.new(:filename => 'temp.ini')
    assert_equal [], ini_file.sections
  end

  def test_taint
    assert_equal false, @ini_file.tainted?
    @ini_file.each_section do |s|
      assert_equal false, @ini_file[s].tainted?
    end

    @ini_file.taint

    assert_equal true, @ini_file.tainted?
    @ini_file.each_section do |s|
      assert_equal true, @ini_file[s].tainted?
    end
  end

  def test_write
    tmp = 'test/data/temp.ini'
    File.delete tmp if Kernel.test(?f, tmp)

    @ini_file.save(:filename => tmp)
    assert_equal true, Kernel.test(?f, tmp)

    File.delete tmp if Kernel.test(?f, tmp)

    ini_file = IniFile.new(:filename => tmp)
    ini_file.save
    assert_nil Kernel.test(?s, tmp)

    File.delete tmp if Kernel.test(?f, tmp)
  end

  def test_read
    assert @ini_file.has_section?('section_one')

    @ini_file['section_one']['one'] = 42
    @ini_file['section_one']['two'] = 42
    assert_equal 42, @ini_file['section_one']['one']
    assert_equal 42, @ini_file['section_one']['two']

    @ini_file.read
    assert_equal 1, @ini_file['section_one']['one']
    assert_equal 2, @ini_file['section_one']['two']

    @ini_file.read(:filename => 'test/data/mixed_comment.ini')
    assert_equal false, @ini_file.has_section?('section_two')
  end

  def test_modifies_current_keys
    ini = IniFile.load("test/data/tmp.ini")
    ini["section one"]["one"] = 17
    ini.save

    assert File.read("test/data/tmp.ini") =~ /one = 17/
  end

  def test_can_add_key_to_inifile
    ini_file = IniFile.new(:filename => "test/data/tmp.ini")
    ini_file["new_section"] = {}
    ini_file.save

    assert File.read("test/data/tmp.ini") =~ /\[new_section\]/
  end

  def test_adds_correct_key_to_inifile
    ini_file = IniFile.new(:filename => "test/data/tmp.ini")
    ini_file["foo"] = {}
    ini_file.save

    assert File.read("test/data/tmp.ini") =~ /\[foo\]/
  end

  def test_assigns_values_to_inifile
    ini_file = IniFile.new(:filename => "test/data/tmp.ini")
    ini_file["foo"] = {
      :bar => "baz"
    }

    assert_equal ini_file["foo"], { :bar => "baz" }
  end

  def test_assigns_correct_values_to_inifile
    ini_file = IniFile.new(:filename => "test/data/tmp.ini")
    ini_file["foo"] = {
      :one => "two"
    }

    assert_equal ini_file["foo"], { :one => "two" }
  end

  def test_assignment_stringifies_key
    ini_file = IniFile.new(:filename => "test/data/tmp.ini")
    ini_file["foo"] = {:one => :two}
    ini_file[:foo] = {}
    assert_equal ini_file["foo"], {}
  end

  def test_multiline_parsing
    ini_file = IniFile.load('test/data/multiline.ini')

    multiline = ini_file['section_three']
    expected = {"three" => "hello multiline", "other" => "stuff"}
    assert_equal expected, multiline

    multiple = ini_file['section_four']
    expected = {"four" => "hello multiple multilines",
                "five" => "multiple lines\ninside of quotations\npreserve everything" }
    assert_equal expected, multiple

    multiple = ini_file['empty_lines']
    expected = {'empty' => nil, 'not_empty' => 'full'}
    assert_equal expected, multiple
  end

  def test_merge
    ini_file = @ini_file.merge(IniFile.load("test/data/merge.ini"))
    assert_equal 3, ini_file['section_one']['one']
    assert_equal 2, ini_file['section_one']['two']

    # make sure that the rest haven't changed
    assert_equal(-3, ini_file['section_two']['three'])

    # and that we got any additional sections too
    assert_equal 5, ini_file['section_five']['five']

    # original object is unchanged
    assert_equal 1, @ini_file['section_one']['one']
  end

  def test_merge_hash
    ini_file = @ini_file.merge({
      'section_one'  => { 'one'  => 3 },
      'section_five' => { 'five' => 5 }
    })
    assert_equal 3, ini_file['section_one']['one']
    assert_equal 2, ini_file['section_one']['two']

    # make sure that the rest haven't changed
    assert_equal(-3, ini_file['section_two']['three'])

    # and that we got any additional sections too
    assert_equal 5, ini_file['section_five']['five']

    # original object is unchanged
    assert_equal 1, @ini_file['section_one']['one']
  end

  def test_merge_invalid_hash
    bad_hash = { 'section_one' => [1, 2, 3, 4] }
    assert_raise(IniFile::Error) { @ini_file.merge(bad_hash) }

    bad_hash = { 'foo' => 'bar' }
    assert_raise(IniFile::Error) { @ini_file.merge(bad_hash) }

    not_a_hash = [['section_one', ['foo','bar'], ['baz', 'buz']]]
    assert_raise(IniFile::Error) { @ini_file.merge(not_a_hash) }

    ini_file = @ini_file.merge nil
    assert ini_file.eql?(@ini_file)
  end

  def test_parse_encoding
    ini_file = IniFile.new(:filename => "test/data/browscap.ini", :encoding => 'ISO-8859-1')
    assert_equal ini_file['www.substancia.com AutoHTTPAgent (ver *)']['Browser'], "Subst\xE2ncia".force_encoding('ISO-8859-1')
  end

  def test_write_encoding
    tmp = 'test/data/tmp.ini'
    File.delete tmp if Kernel.test(?f, tmp)

    @ini_file = IniFile.new(:filename => tmp, :encoding => 'UTF-8')
    @ini_file['testutf-8'] = {"utf-8" => "appr\u20accier"}

    @ini_file.save(:filename => tmp)

    test = File.open(tmp)
    assert_equal test.external_encoding.to_s, 'UTF-8'
  end

  def test_value_escaping
    ini_file = IniFile.load('test/data/escape.ini')
    escaped = ini_file['escaped']

    assert_equal %Q{There is a tab\tcharacter in here somewhere}, escaped['tabs']
    assert_equal %Q{Who uses these anyways?\r}, escaped['carriage return']
    assert_equal %Q{Trust newline!\nAlways there when you need him.\nSplittin' those lines.}, escaped['newline']
    assert_equal %Q{Who'd be silly enough to put\0 a null character in the middle of a string? Stroustrup would not approve!}, escaped['null']
    assert_equal %q{This string \t contains \n no \r special \0 characters!}, escaped['backslash']
    assert_equal %Q{Escaping works\tinside quoted strings!}, escaped['quoted']
  end

  # disabling escaping is no longer supported
  def test_value_escaping_disabled
    ini_file = IniFile.load('test/data/escape.ini', :escape => false)
    escaped = ini_file['escaped']

    assert_equal %Q{There is a tab\tcharacter in here somewhere}, escaped['tabs']
    assert_equal %Q{Who uses these anyways?\r}, escaped['carriage return']
    assert_equal %Q{Trust newline!\nAlways there when you need him.\nSplittin' those lines.}, escaped['newline']
    assert_equal %Q{Who'd be silly enough to put\0 a null character in the middle of a string? Stroustrup would not approve!}, escaped['null']
    assert_equal %q{This string \t contains \n no \r special \0 characters!}, escaped['backslash']
    assert_equal %Q{Escaping works\tinside quoted strings!}, escaped['quoted']
  end

  def test_global_section
    ini_file = IniFile.load('test/data/global.ini')

    assert_equal %w[global], ini_file.sections
    assert_equal 1, ini_file['global']['one']
    assert_equal 2, ini_file['global']['two']
  end

  def test_default_global_section
    ini_file = IniFile.load('test/data/global.ini', :default => 'nonce')

    assert_equal %w[nonce], ini_file.sections
    assert_equal 1, ini_file['nonce']['one']
    assert_equal 2, ini_file['nonce']['two']
  end

  def test_unescaped_section_header_as_value
    ini_file = IniFile.load('test/data/section.ini')

    assert_equal %w[section_one], ini_file.sections
    assert_equal '[value]', ini_file['section_one']['one']
    assert_equal 2, ini_file['section_one']['two']
  end

  def test_unmatched_quotes
    # missing a closing quote should raise an error
    assert_raise(IniFile::Error) { IniFile.load 'test/data/bad_2.ini' }
  end

  def test_continuation_at_end_of_file
    ini_file = IniFile.load('test/data/continuation.ini')

    assert_equal 1, ini_file['section_one']['one']
    assert_equal 2, ini_file['section_one']['two']

    assert_equal 'here is the last value', ini_file['section_two']['end-of-file']
  end

  def test_empty_comment_string
    ini_file = IniFile.load('test/data/merge.ini', :comment => nil)

    assert_equal 3, ini_file['section_one']['one']
    assert_equal 5, ini_file['section_five']['five']
  end
end

