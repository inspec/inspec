require "helper"
require "inspec/utils/simpleconfig"

describe "SimpleConfig Default Parser" do
  it "should parse an empty string" do
    cur = SimpleConfig.new("")
    _(cur.params).must_equal({})
  end

  it "should parse only spaces" do
    cur = SimpleConfig.new("    ")
    _(cur.params).must_equal({})
  end

  it "should parse only tabs" do
    cur = SimpleConfig.new("\t")
    _(cur.params).must_equal({})
  end

  it "should parse only newlines" do
    cur = SimpleConfig.new("\n")
    _(cur.params).must_equal({})
  end

  it "should parse a simple assignment" do
    cur = SimpleConfig.new("a = b")
    _(cur.params).must_equal({ "a" => "b" })
  end

  it "should parse a multiple assignments" do
    cur = SimpleConfig.new("a = b\n\nc = d")
    _(cur.params).must_equal({ "a" => "b", "c" => "d" })
  end

  it "handles files with only comments" do
    cur = SimpleConfig.new("#a comment")
    _(cur.params).must_equal({})
  end

  it "handles separate comments and assignments" do
    cur = SimpleConfig.new("# hello world\n\na = b")
    _(cur.params).must_equal({ "a" => "b" })
  end

  it "handles comments and assignments combined" do
    cur = SimpleConfig.new("a = b# hello")
    _(cur.params).must_equal({ "a" => "b" })
  end

  it "handles groups" do
    cur = SimpleConfig.new("[g]")
    _(cur.params).must_equal({ "g" => {} })
    _(cur.groups).must_equal(["g"])
  end

  it "handles non-group assignments and groups" do
    cur = SimpleConfig.new("a = b\n[g]")
    _(cur.params).must_equal({ "a" => "b", "g" => {} })
    _(cur.groups).must_equal(["g"])
  end

  it "handles assignments in groups" do
    cur = SimpleConfig.new("[g]\na = b")
    _(cur.params).must_equal({ "g" => { "a" => "b" } })
    _(cur.groups).must_equal(["g"])
  end

  it "handles multiple groups" do
    cur = SimpleConfig.new("[g]\na = b\n[k]\n\nc = d")
    res = {
      "g" => { "a" => "b" },
      "k" => { "c" => "d" },
    }
    _(cur.params).must_equal(res)
    _(cur.groups).must_equal(%w{g k})
  end

  it "provides methods to access returned hashes" do
    cur = SimpleConfig.new("[section1]\nkey1 = value1\n\n[section2]\nkey2 = value2\n")
    _(cur.params["section1"].key1).must_equal("value1")
    _(cur.params["section2"].key2).must_equal("value2")
    _(cur.params["section2"].missing_key).must_be_nil
  end

  it "supports :assignment_regex for specifying the assignment" do
    cur = SimpleConfig.new("key:::val", assignment_regex: /^(.*):::(.*)$/)
    _(cur.params).must_equal({ "key" => "val" })
  end

  it "only reads the first assignment match group by default" do
    cur = SimpleConfig.new("1:2:3", assignment_regex: /^(.*):(.*):(.*)$/)
    _(cur.params).must_equal({ "1" => "2" })
  end

  it "supports :key_values for specifying the number of values" do
    cur = SimpleConfig.new("1:2:3", assignment_regex: /^(.*):(.*):(.*)$/, key_values: 2)
    _(cur.params).must_equal({ "1" => %w{2 3} })
  end

  it "supports :key_values with more values than match groups" do
    cur = SimpleConfig.new("1:2:3", assignment_regex: /^(.*):(.*):(.*)$/, key_values: 4)
    _(cur.params).must_equal({ "1" => ["2", "3", nil, nil] })
  end

  it "supports :mulitple values and returns array of values" do
    cur = SimpleConfig.new("foo:  bar\nbiz:  baz boz bop\nbiz:  cdsdcs cdscs csc\nbiz:  ada\nfoz:  foo [!deny] bar", assignment_regex: /^\s*([^:]*?)\s*:\s*(.*?)\s*$/, multiple_values: true, multiple_value_regex: /\s+/)
    _(cur.params).must_equal({ "foo" => ["bar"], "biz" => %w{baz boz bop cdsdcs cdscs csc ada}, "foz" => ["foo", "[!deny]", "bar"] })
  end
end
