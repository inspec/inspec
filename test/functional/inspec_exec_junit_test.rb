require "functional/helper"
require "nokogiri"

describe "inspec exec with junit formatter" do
  include FunctionalHelper

  parallelize_me!

  it "can execute a simple file with the junit formatter" do
    out = inspec("exec " + example_control + " --reporter junit --no-create-lockfile")

    _(out.stderr).must_equal ""
    doc = Nokogiri::XML(out.stdout)
    _(doc.document?).must_equal true
    _(doc.errors).must_be_empty

    skip_windows!
    assert_exit_code 0, out
  end

  it "can execute the profile with the junit formatter" do
    out = inspec("exec " + complete_profile + " --reporter junit --no-create-lockfile")

    _(out.stderr).must_equal ""
    doc = Nokogiri::XML(out.stdout)
    _(doc.document?).must_equal true
    _(doc.errors).must_be_empty

    assert_exit_code 0, out
  end

  describe "execute a profile with junit formatting" do
    let(:doc) { Nokogiri::XML(inspec("exec " + example_profile + " --reporter junit --no-create-lockfile").stdout) }

    describe "the document" do
      it "has only one testsuite" do
        _(doc.xpath("//testsuite").length).must_equal 1
      end
    end
    describe "the test suite" do
      let(:suite) { doc.xpath("//testsuites/testsuite").first }

      it "must have 4 testcase children" do
        _(suite.xpath("//testcase").length).must_equal 4
      end

      it "has the tests attribute with 4 total tests" do
        _(suite.attr("tests")).must_equal "4"
      end

      it "has the failures attribute with 0 total tests" do
        skip_windows!
        _(suite.attr("failed")).must_equal "0"
      end

      it 'has 3 elements named "File / should be directory"' do
        _(suite.xpath("//testcase[@name='File / is expected to be directory']").length).must_equal 3
      end

      describe 'the testcase named "example_config Can\'t find file ..."' do
        let(:example_yml_tests) { suite.xpath("//testcase[@classname='profile.example-1.0' and @name='example_config']") }
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
