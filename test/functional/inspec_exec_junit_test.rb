require 'functional/helper'
require 'rexml/document'

describe 'inspec exec with junit formatter' do
  include FunctionalHelper

  it 'can execute a simple file with the junit formatter' do
    out = inspec('exec ' + example_control + ' --reporter junit --no-create-lockfile')
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    doc = REXML::Document.new(out.stdout)
    doc.has_elements?.must_equal true
  end

  it 'can execute the profile with the junit formatter' do
    out = inspec('exec ' + example_profile + ' --reporter junit --no-create-lockfile')
    out.stderr.must_equal ''
    out.exit_status.must_equal 101
    doc = REXML::Document.new(out.stdout)
    doc.has_elements?.must_equal true
  end

  describe 'execute a profile with junit formatting' do
    let(:doc) { REXML::Document.new(inspec('exec ' + example_profile + ' --reporter junit --no-create-lockfile').stdout) }

    describe 'the document' do
      it 'has only one testsuite' do
        doc.elements.to_a("//testsuite").length.must_equal 1
      end
    end
    describe 'the test suite' do
      let(:suite) { doc.elements.to_a("//testsuites/testsuite").first }

      it 'must have 5 testcase children' do
        suite.elements.to_a("//testcase").length.must_equal 5
      end

      it 'has the tests attribute with 5 total tests' do
        suite.attribute('tests').value.must_equal "5"
      end

      it 'has the failures attribute with 0 total tests' do
        suite.attribute('failed').value.must_equal "0"
      end

      it 'has 2 elements named "File /tmp should be directory"' do
        REXML::XPath.match(suite, "//testcase[@name='File /tmp should be directory']").length.must_equal 2
      end

      describe 'the testcase named "gordon_config Can\'t find file ..."' do
        let(:gordon_yml_tests) { REXML::XPath.match(suite, "//testcase[@classname='profile.gordon-1.0' and @name='gordon_config']") }
        let(:first_gordon_test) {gordon_yml_tests.first}

        it 'should be unique' do
          gordon_yml_tests.length.must_equal 1
        end

        it 'should be skipped' do
          if is_windows?
            first_gordon_test.elements.to_a('//skipped').length.must_equal 2
          else
            first_gordon_test.elements.to_a('//skipped').length.must_equal 1
          end
        end
      end
    end
  end
end
