require "functional/helper"
require "rexml/document"

describe "inspec exec with junit formatter" do
  include FunctionalHelper

  parallelize_me!

  it "can execute a simple file with the junit formatter" do
    out = inspec("exec " + example_control + " --reporter junit --no-create-lockfile")

    # TODO: rexml is about as slow as you can go. Use nokogiri
    doc = REXML::Document.new(out.stdout)
    _(doc.has_elements?).must_equal true

    _(out.stderr).must_equal ""

    assert_exit_code 0, out
  end

  it "can execute the profile with the junit formatter" do
    out = inspec("exec " + complete_profile + " --reporter junit --no-create-lockfile")

    # TODO: _never_ use rexml. Anything else is guaranteed faster
    doc = REXML::Document.new(out.stdout)
    _(doc.has_elements?).must_equal true

    _(out.stderr).must_equal ""

    assert_exit_code 0, out
  end

  describe "execute a profile with junit formatting" do
    let(:doc) { REXML::Document.new(inspec("exec " + example_profile + " --reporter junit --no-create-lockfile").stdout) }

    describe "the document" do
      it "has only one testsuite" do
        _(doc.elements.to_a("//testsuite").length).must_equal 1
      end
    end
    describe "the test suite" do
      let(:suite) { doc.elements.to_a("//testsuites/testsuite").first }

      it "must have 4 testcase children" do
        _(suite.elements.to_a("//testcase").length).must_equal 4
      end

      it "has the tests attribute with 4 total tests" do
        _(suite.attribute("tests").value).must_equal "4"
      end

      it "has the failures attribute with 0 total tests" do
        _(suite.attribute("failed").value).must_equal "0"
      end

      it 'has 2 elements named "File / should be directory"' do
        _(REXML::XPath.match(suite, "//testcase[@name='File / is expected to be directory']").length).must_equal 3
      end

      describe 'the testcase named "example_config Can\'t find file ..."' do
        let(:example_yml_tests) { REXML::XPath.match(suite, "//testcase[@classname='profile.example-1.0' and @name='example_config']") }
        let(:first_example_test) { example_yml_tests.first }

        it "should be unique" do
          skip
          _(example_yml_tests.length).must_equal 1
        end

        it "should be skipped" do
          skip
          if is_windows?
            _(first_example_test.elements.to_a("//skipped").length).must_equal 2
          else
            _(first_example_test.elements.to_a("//skipped").length).must_equal 1
          end
        end
      end
    end
  end
end
