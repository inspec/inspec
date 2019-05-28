module Inspec::Reporters
  class Junit < Base
    def render
      require 'rexml/document'
      xml_output = REXML::Document.new
      xml_output.add(REXML::XMLDecl.new)

      testsuites = REXML::Element.new('testsuites')
      xml_output.add(testsuites)

      run_data[:profiles].each do |profile|
        testsuites.add(build_profile_xml(profile))
      end

      formatter = REXML::Formatters::Pretty.new
      formatter.compact = true
      output(formatter.write(xml_output.xml_decl, ''))
      output(formatter.write(xml_output.root, ''))
    end

    private

    def build_profile_xml(profile)
      profile_xml = REXML::Element.new('testsuite')
      profile_xml.add_attribute('name', profile[:name])
      profile_xml.add_attribute('tests', count_profile_tests(profile))
      profile_xml.add_attribute('failed', count_profile_failed_tests(profile))
      profile_xml.add_attribute('failures', count_profile_failed_tests(profile))

      profile[:controls].each do |control|
        next if control[:results].nil?

        control[:results].each do |result|
          profile_xml.add(build_result_xml(profile[:name], control, result))
        end
      end

      profile_xml
    end

    def build_result_xml(profile_name, control, result)
      result_xml = REXML::Element.new('testcase')
      result_xml.add_attribute('name', result[:code_desc])
      result_xml.add_attribute('classname', control[:title].nil? ? "#{profile_name}.Anonymous" : "#{profile_name}.#{control[:id]}")
      result_xml.add_attribute('target', run_data[:platform][:target].nil? ? '' : run_data[:platform][:target].to_s)
      result_xml.add_attribute('time', result[:run_time])

      if result[:status] == 'failed'
        failure_element = REXML::Element.new('failure')
        failure_element.add_attribute('message', result[:message])
        result_xml.add(failure_element)
      elsif result[:status] == 'skipped'
        result_xml.add_element('skipped')
      end

      result_xml
    end

    def count_profile_tests(profile)
      profile[:controls].reduce(0) { |acc, elem|
        acc + (elem[:results].nil? ? 0 : elem[:results].count)
      }
    end

    def count_profile_failed_tests(profile)
      profile[:controls].reduce(0) { |acc, elem|
        if elem[:results].nil?
          acc
        else
          acc + elem[:results].reduce(0) { |fail_test_total, test_case|
            test_case[:status] == 'failed' ? fail_test_total + 1 : fail_test_total
          }
        end
      }
    end
  end
end
