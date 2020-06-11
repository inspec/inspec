require "functional/helper"
require "nokogiri"

describe "inspec exec with junit formatter" do
  include FunctionalHelper

  parallelize_me!

  describe "when running the legacy junit reporter" do
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
          let(:example_yml_tests) { suite.xpath("//testcase[@classname='profile.tmp-1.0' and @name='File / is expected to be directory']") }

          it "should be unique" do
            _(example_yml_tests.length).must_equal 1
          end
        end
      end
    end
  end

  describe "when running the v2 junit reporter" do
    let(:schema) { Nokogiri::XML::Schema(File.read("#{repo_path}/lib/plugins/inspec-reporter-junit/test/fixtures/schema/JUnit-162a883.xsd")) }
    let(:run_result) { run_inspec_process("exec #{profile_name} --reporter junit2") }
    let(:doc) { Nokogiri::XML(run_result.stdout) }

    describe "when running a basic profile" do
      let(:profile_name) { complete_profile }
      it "can execute the profile with the junit formatter and produce validate JUnit XML" do

        _(run_result.stderr).must_equal ""
        _(doc.document?).must_equal true
        _(doc.errors).must_be_empty            # syntax errors
        _(schema.validate(doc)).must_be_empty  # XML validation errors

        assert_exit_code 0, run_result

        suite = doc.xpath("//testsuite").first
        _(suite.attr("hostname")).must_equal "local://" # We put the target in hostname now
        _(doc.xpath("//testsuite[@failed]")).must_be_empty # we are no longer populating the incorrect "failed" attribute
      end
    end

    describe "when run on a profile with skips" do
      let(:profile_name) { "#{profile_path}/skippy-controls" }
      it "reports skips separately" do
        _(run_result.stderr).must_equal ""
        _(schema.validate(doc)).must_be_empty
        suite = doc.xpath("//testsuite").first
        _(suite.attr("skipped")).must_equal "2"
        testcase = doc.xpath("//testcase").first
        _(testcase.xpath("//skipped")).wont_be_empty
      end
    end

    describe "when run on a profile with errors" do
      let(:profile_name) { "#{profile_path}/exception-in-control" }
      it "reports failures and errors separately" do
        # InSpec CLI will report this as 4 failures. JUnit standard would
        # see it as 4 errors, no failures.
        _(run_result.stderr).must_equal ""
        _(schema.validate(doc)).must_be_empty
        suite = doc.xpath("//testsuite").first
        _(suite.attr("failures")).must_equal "0"
        _(suite.attr("errors")).must_equal "4"
      end
    end

  end
end
