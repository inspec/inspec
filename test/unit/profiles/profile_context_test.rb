require "helper"
require "inspec/profile_context"
require "inspec/resources/file"
require "inspec/resources/command"

class Module
  include Minitest::Spec::DSL
end

RUBY3_1_PLUS = Gem.ruby_version >= Gem::Version.new("3.1")

module DescribeOneTest
  it "loads an empty describe.one" do
    profile.load(format(context_format, "describe.one"))
    _(get_checks).must_be_empty
  end

  it "loads an empty describe.one block" do
    profile.load(format(context_format, "describe.one do; end"))
    _(get_checks).must_equal([["describe.one", [], nil]])
  end

  it "loads a simple describe.one block" do
    profile.load(format(context_format, '
      describe.one do
        describe true do; it { should eq true }; end
      end'))
    c = get_checks[0]
    _(c[0]).must_equal "describe.one"
    childs = c[1]
    _(childs.length).must_equal 1
    _(childs[0][0]).must_equal "describe"
    _(childs[0][1]).must_equal [true]
  end

  it "loads a complex describe.one block" do
    profile.load(format(context_format, '
      describe.one do
        describe 0 do; it { should eq true }; end
        describe 1 do; it { should eq true }; end
        describe 2 do; it { should eq true }; end
      end'))
    c = get_checks[0]
    _(c[0]).must_equal "describe.one"
    childs = c[1]
    _(childs.length).must_equal 3
    childs.each_with_index do |ci, idx|
      _(ci[0]).must_equal "describe"
      _(ci[1]).must_equal [idx]
    end
  end
end

BACKEND = MockLoader.new.backend

describe Inspec::ProfileContext do

  let(:backend) { BACKEND }
  let(:profile) { Inspec::ProfileContext.new(nil, backend, {}) }

  def get_checks(rule_index = 0)
    rule = profile.rules.values[rule_index]
    Inspec::Rule.prepare_checks(rule)
  end

  it "must be able to load empty content" do
    _(profile.load("", "dummy", 1)).must_be_nil
  end

  describe "its default DSL" do
    def assert_load(src, output)
      _ { profile.load(src) }.must_output output
    end

    def assert_load_raises(src, exception)
      _ { profile.load(src) }.must_raise exception
    end

    let(:context_format) { "%s" }

    include DescribeOneTest

    it "must provide os resource" do
      assert_load("print os[:family]", "debian")
    end

    it "must provide file resource" do
      assert_load('print file("/etc/passwd").type', "file")
    end

    it "must provide command resource" do
      assert_load('print command("").stdout', "")
    end

    it "supports empty describe calls" do
      assert_load("describe", "")
      _(profile.rules.keys.length).must_equal 1
      _(profile.rules.keys[0]).must_match(/^\(generated from \(eval\):1 [0-9a-f]+\)$/)
      _(profile.rules.values[0]).must_be_kind_of Inspec::Rule
    end

    it "provides the describe keyword in the global DSL" do
      assert_load("describe true do; it { should_eq true }; end", "")
      _(profile.rules.keys.length).must_equal 1
      _(profile.rules.keys[0]).must_match(/^\(generated from \(eval\):1 [0-9a-f]+\)$/)
      _(profile.rules.values[0]).must_be_kind_of Inspec::Rule
    end

    it "loads multiple computed calls to describe correctly" do
      assert_load("%w{1 2 3}.each do\ndescribe true do; it { should_eq true }; end\nend", "")
      _(profile.rules.keys.length).must_equal 3
      [0, 1, 2].each do |i|
        _(profile.rules.keys[i]).must_match(/^\(generated from \(eval\):2 [0-9a-f]+\)$/)
        _(profile.rules.values[i]).must_be_kind_of Inspec::Rule
      end
    end

    it "does not provide the expect keyword in the global DSL" do
      assert_load_raises("expect(true).to_eq true", NoMethodError)
    end

    describe "global only_if" do
      let(:if_true) { "only_if { true }\n" }
      let(:if_false) { "only_if { false }\n" }
      let(:describe) { "describe nil do its(:to_i) { should eq rand } end\n" }
      let(:control) { "control 1 do\n#{describe}\nend\n" }
      let(:control_2) { "control 2 do\n#{describe}\nend\n" }

      it "provides the keyword" do
        profile.load(if_true)
        _(profile.rules).must_be_empty
      end

      it "doesnt affect controls when positive" do
        profile.load(if_true + "control 1")
        _(profile.rules.values[0]).must_be_kind_of Inspec::Rule
      end

      it "doesnt remove controls when negative" do
        profile.load(if_false + "control 1")
        _(profile.rules.values[0]).must_be_kind_of Inspec::Rule
      end

      it "alters controls when positive" do
        profile.load(if_false + control)
        _(get_checks.length).must_equal 1
        _(get_checks[0][1][0]).must_be :resource_skipped?
        _(get_checks[0][1][0].resource_exception_message).must_equal "Skipped control due to only_if condition."
        _(get_checks[0][1][0]).wont_be :resource_failed?
      end

      it "alters non-controls when positive" do
        profile.load(if_false + describe)
        _(get_checks.length).must_equal 1
        _(get_checks[0][1][0]).must_be :resource_skipped?
        _(get_checks[0][1][0].resource_exception_message).must_equal "Skipped control due to only_if condition."
        _(get_checks[0][1][0]).wont_be :resource_failed?
      end

      it "doesnt alter controls when negative" do
        profile.load(if_true + control)
        _(get_checks.length).must_equal 1
        _(get_checks[0][1][0]).must_be_nil
      end

      it "doesnt alter non-controls when negative" do
        profile.load(if_true + describe)
        _(get_checks.length).must_equal 1
        _(get_checks[0][1][0]).must_be_nil
      end

      it "doesnt overwrite falsy only_ifs" do
        profile.load(if_false + if_true + control)
        _(get_checks.length).must_equal 1
        _(get_checks[0][1][0]).must_be :resource_skipped?
        _(get_checks[0][1][0].resource_exception_message).must_equal "Skipped control due to only_if condition."
        _(get_checks[0][1][0]).wont_be :resource_failed?
      end

      it "doesnt overwrite falsy only_ifs" do
        profile.load(if_true + if_false + control)
        _(get_checks.length).must_equal 1
        _(get_checks[0][1][0]).must_be :resource_skipped?
        _(get_checks[0][1][0].resource_exception_message).must_equal "Skipped control due to only_if condition."
        _(get_checks[0][1][0]).wont_be :resource_failed?
      end

      it "allows specifying a message with true only_if" do
        profile.load("only_if('this is a only_if skipped message') { false }\n" + control)
        _(get_checks.length).must_equal 1
        _(get_checks[0][1][0]).must_be :resource_skipped?
        _(get_checks[0][1][0].resource_exception_message).must_equal "Skipped" \
         " control due to only_if condition: this is a only_if skipped message"
        _(get_checks[0][1][0]).wont_be :resource_failed?
      end

      it "doesnt extend into other control files" do
        fake_control_file = if_false + control
        profile.load_control_file(fake_control_file, "(eval)", nil)
        profile.load_control_file(control_2, "(eval)", nil)
        first_file_check = get_checks(0)
        second_file_check = get_checks(1)
        _(first_file_check[0][1][0].resource_exception_message).must_equal "Skipped control due to only_if condition."
        _(second_file_check[0][1][0]).must_be_nil
      end

      it "applies to the controls above it when at the bottom of the file" do
        fake_control_file = control + if_false
        profile.load_control_file(fake_control_file, "(eval)", 1)
        _(get_checks[0][1][0].resource_exception_message).must_equal "Skipped control due to only_if condition."
      end

      it "applies to the controls below it when at the top of the file" do
        fake_control_file = if_false + control
        profile.load_control_file(fake_control_file, "(eval)", 1)
        _(get_checks[0][1][0].resource_exception_message).must_equal "Skipped control due to only_if condition."
      end

      it "applies to the controls above and below it when at the middle of the file" do
        fake_control_file = control + if_false + control_2
        profile.load_control_file(fake_control_file, "(eval)", 1)
        check_top = get_checks(0)
        check_bottom = get_checks(1)
        _(check_top[0][1][0].resource_exception_message).must_equal "Skipped control due to only_if condition."
        _(check_bottom[0][1][0].resource_exception_message).must_equal "Skipped control due to only_if condition."
      end

      it "applies to the describe blocks above and below it when at the middle of the file" do
        fake_control_file = describe + if_false + describe
        profile.load_control_file(fake_control_file, "(eval)", 1)
        check_top = get_checks(0)
        check_bottom = get_checks(1)
        _(check_top[0][1][0].resource_exception_message).must_equal "Skipped control due to only_if condition."
        _(check_bottom[0][1][0].resource_exception_message).must_equal "Skipped control due to only_if condition."
      end
    end

    it "provides the control keyword in the global DSL" do
      profile.load("control 1")
      _(profile.rules.keys).must_equal ["1"]
      _(profile.rules.values[0]).must_be_kind_of Inspec::Rule
    end

    it "provides the rule keyword in the global DSL (legacy mode)" do
      profile.load("rule 1")
      _(profile.rules.keys).must_equal ["1"]
      _(profile.rules.values[0]).must_be_kind_of Inspec::Rule
    end
  end

  describe "rule DSL" do
    let(:rule_id) { rand.to_s }
    let(:context_format) { "rule #{rule_id.inspect} do\n%s\nend" }

    def get_rule
      profile.rules[rule_id]
    end

    include DescribeOneTest

    it "doesnt add any checks if none are provided" do
      profile.load("rule #{rule_id.inspect}")
      rule = profile.rules[rule_id]
      _(::Inspec::Rule.prepare_checks(rule)).must_be_empty
    end

    describe "supports empty describe blocks" do
      it "doesnt crash, but doesnt add anything either" do
        profile.load(format(context_format, "describe"))
        _(profile.rules.keys).must_include(rule_id)
        _(get_checks).must_be_empty
      end
    end

    describe "adds a check via describe" do
      let(:check) do
        profile.load(
          format(context_format,
                 "describe(os[:family]) { it { must_equal 'debian' } }")
        )
        get_checks[0]
      end

      it "registers the check with describe" do
        _(check[0]).must_equal "describe"
      end

      it "registers the check with the describe argument" do
        _(check[1]).must_equal %w{debian}
      end

      it "registers the check with the provided proc" do
        _(check[2]).must_be_kind_of Proc
      end
    end

    describe "adds a check via expect" do
      let(:check) do
        profile.load(
          format(context_format,
                 "expect(os[:family]).to eq('debian')")
        )
        get_checks[0]
      end

      it "registers the check with describe" do
        _(check[0]).must_equal "expect"
      end

      it "registers the check with the describe argument" do
        _(check[1]).must_equal %w{debian}
      end

      it "registers the check with the provided proc" do
        _(check[2]).must_be_kind_of Inspec::Expect
      end
    end

    describe "adds a check via describe + expect" do
      let(:check) do
        profile.load(
          format(context_format,
                 "describe 'the actual test' do
            expect(os[:family]).to eq('debian')
          end")
        )
        get_checks[0]
      end

      it "registers the check with describe" do
        _(check[0]).must_equal "describe"
      end

      it "registers the check with the describe argument" do
        _(check[1]).must_equal ["the actual test"]
      end

      it "registers the check with the provided proc" do
        _(check[2]).must_be_kind_of Proc
      end
    end

    describe "with only_if" do
      it "provides the only_if keyword" do
        profile.load(format(context_format, "only_if"))
        _(get_checks).must_be_empty
      end

      it "skips with only_if == false" do
        profile.load(format(context_format, "only_if { false }"))
        _(get_checks.length).must_equal 1
        _(get_checks[0][1][0]).must_be :resource_skipped?
        _(get_checks[0][1][0].resource_exception_message).must_equal "Skipped control due to only_if condition."
        _(get_checks[0][1][0]).wont_be :resource_failed?
      end

      it "does nothing with only_if == false" do
        profile.load(format(context_format, "only_if { true }"))
        _(get_checks).must_be_empty
      end

      it "doesnt overwrite falsy only_ifs" do
        profile.load(format(context_format, "only_if { false }\nonly_if { true }"))
        _(get_checks.length).must_equal 1
        _(get_checks[0][1][0]).must_be :resource_skipped?
        _(get_checks[0][1][0].resource_exception_message).must_equal "Skipped control due to only_if condition."
        _(get_checks[0][1][0]).wont_be :resource_failed?
      end

      it "doesnt overwrite falsy only_ifs" do
        profile.load(format(context_format, "only_if { true }\nonly_if { false }"))
        _(get_checks.length).must_equal 1
        _(get_checks[0][1][0]).must_be :resource_skipped?
        _(get_checks[0][1][0].resource_exception_message).must_equal "Skipped control due to only_if condition."
        _(get_checks[0][1][0]).wont_be :resource_failed?
      end
    end
  end

  describe "library loading" do
    it "supports simple ruby require statements" do
      # Please note: we do discourage the use of Gems in inspec resources at
      # this time. Resources should be well packaged whenever possible.
      if RUBY3_1_PLUS
        _ { profile.load("Byebug") }.must_raise NameError
        profile.load_libraries([['require "byebug"', "libraries/a.rb"]])
        _(profile.load("Byebug").to_s).must_equal "Byebug"
      else
        _ { profile.load("Net::POP3") }.must_raise NameError
        profile.load_libraries([['require "net/pop"', "libraries/a.rb"]])
        _(profile.load("Net::POP3").to_s).must_equal "Net::POP3"
      end
    end

    it "supports creating a simple library file (no require)" do
      # this test will throw an exception if chaining doesn't work
      profile.load_libraries([
        ["module A; end", "libraries/a.rb"],
      ])
    end

    it "supports loading across the library" do
      # this test will throw an exception if chaining doesn't work
      profile.load_libraries([
        ["require 'a'\nA", "libraries/b.rb"],
        ["module A; end", "libraries/a.rb"],
      ])
    end

    it "supports chain loading across the library" do
      # this test will throw an exception if chaining doesn't work
      profile.load_libraries([
        ["require 'b'\nA", "libraries/c.rb"],
        ["require 'a'\nA", "libraries/b.rb"],
        ["module A; end", "libraries/a.rb"],
      ])
    end

    it "uses LEC if requiring second-level libraries file" do
      lec = profile.library_eval_context
      binding = lec.__inspec_binding

      def binding.eval(*a)
        raise "YAY"
      end

      code = [
        ["libraries/top_level.rb",   "require 'second/file'\n"],
        ["libraries/second/file.rb", "puts 'YOU SHOULD NOT SEE ME'"],
      ].map(&:reverse)

      e = assert_raises RuntimeError do
        profile.load_libraries(code)
      end
      assert_equal "YAY", e.message
    end

    it "supports loading a regular ruby gem" do
      profile.load_libraries([
        ["require 'erb'\nERB", "libraries/a.rb"],
      ])
    end

    # rubocop:disable Style/BlockDelimiters

    it "fails if a required gem or lib doesnt exist" do
      _ {
        profile.load_libraries([
          ["require 'erbluuuuub'", "libraries/a.rb"],
        ])
      }.must_raise LoadError
    end

    it "fails loading if reference error occur" do
      _ {
        profile.load_libraries([
          ["require 'a'\nB", "libraries/b.rb"],
          ["module A; end", "libraries/a.rb"],
        ])
      }.must_raise NameError
    end

    it "fails loading if a reference dependency isnt found" do
      _ {
        profile.load_libraries([
          ["require 'a'\nA", "libraries/b.rb"],
        ])
      }.must_raise LoadError
    end
  end
end
