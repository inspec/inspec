# encoding: utf-8
# author: John Kerry

require 'functional/helper'
require 'nokogiri'

# <testsuite name="rspec" tests="2" failures="0" errors="0" time="0.004459" timestamp="2016-11-20T21:43:51-05:00">
#   <!-- Randomized with seed 39231 -->
#   <properties/>
#   <testcase classname="lib.inspec.rule" name="File /tmp should be directory" file="./lib/inspec/rule.rb" time="0.003060"/>
#   <testcase classname="lib.inspec.rule" name="File /tmp should be directory" file="./lib/inspec/rule.rb" time="0.000217"/>
# </testsuite>

describe 'inspec exec with junit formatter' do
  include FunctionalHelper

  it 'can execute a simple file with the junit formatter' do
    out = inspec('exec ' + example_control + ' --format junit --no-create-lockfile')
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    doc = Nokogiri::XML(out.stdout)
    doc.errors.length.must_equal 0
  end

  it 'can execute the profile with the junit formatter' do
    out = inspec('exec ' + example_profile + ' --format junit --no-create-lockfile')
    out.stderr.must_equal ''
    out.exit_status.must_equal 0
    puts out.stdout
    doc = Nokogiri::XML(out.stdout)
    doc.errors.length.must_equal 0
  end

# <?xml version="1.0" encoding="UTF-8"?>
# <testsuite name="rspec" tests="5" failures="0" errors="0" time="0.025467" timestamp="2016-11-20T22:42:53-05:00">
#   <!-- Randomized with seed 35012 -->
#   <properties/>
#   <testcase classname="lib.inspec.rule" name="File /tmp should be directory" file="./lib/inspec/rule.rb" time="0.001841"/>
#   <testcase classname="lib.inspec.rule" name="File /tmp should be directory" file="./lib/inspec/rule.rb" time="0.000128"/>
#   <testcase classname="lib.inspec.runner" name="gordon_config Can't find file &quot;/tmp/gordon/config.yaml&quot;" file="./lib/inspec/runner.rb" time="0.000011">
#     <skipped/>
#   </testcase>
#   <testcase classname="examples.profile.controls.gordon" name="File  content should match nil" file="./examples/profile/controls/gordon.rb" time="0.001176"/>
#   <testcase classname="lib.inspec.rule" name="File /bin/sh should be owned by &quot;root&quot;" file="./lib/inspec/rule.rb" time="0.019848"/>
# </testsuite>

  describe 'execute a profile with junit formatting' do
    let(:doc) { Nokogiri::XML(inspec('exec ' + example_profile + ' --format junit --no-create-lockfile').stdout) }

    describe 'the document' do
      it 'has only one testsuite' do
        doc.xpath("//testsuite").length.must_equal 1
      end
    end
    describe 'the test suite' do
      let(:suite) { doc.xpath("//testsuite").first}

      it 'has a single properties element with no children' do
        suite.xpath("//properties").length.must_equal 1
        suite.xpath("//properties").children.length.must_equal 0
      end

      it 'has the tests attribute with 5 total tests' do
        suite["tests"].must_equal "5"
      end

      it 'has the failures attribute with 0 total tests' do
        suite["failures"].must_equal "0"
      end

      it 'has the errors attribute with 0 total tests' do
        suite["errors"].must_equal "0"
      end
    end
end
