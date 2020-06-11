module InspecPlugins::JUnitReporter
  class Reporter < Inspec.plugin(2, :reporter)
    def self.run_data_schema_constraints
      "~> 0.0"
    end

    def render
      require "rexml/document"
      xml_output = REXML::Document.new
      xml_output.add(REXML::XMLDecl.new)

      testsuites = REXML::Element.new("testsuites")
      xml_output.add(testsuites)

      run_data.profiles.each_with_index do |profile, idx|
        testsuites.add(build_profile_xml(profile, idx))
      end

      formatter = REXML::Formatters::Pretty.new
      formatter.compact = true
      output(formatter.write(xml_output.xml_decl, ""))
      output(formatter.write(xml_output.root, ""))
    end

    def count_profile_tests(profile)
      profile.controls.reduce(0) do |acc, elem|
        acc + elem.results.count
      end
    end

    def count_profile_failed_tests(profile)
      profile.controls.reduce(0) do |acc, elem|
        acc + elem.results.reduce(0) do |fail_test_total, test_case|
          test_case.status == "failed" ? fail_test_total + 1 : fail_test_total
        end
      end
    end

    def count_profile_skipped_tests(profile)
      profile.controls.reduce(0) do |acc, elem|
        acc + elem.results.reduce(0) do |skip_test_total, test_case|
          test_case.status == "skipped" ? skip_test_total + 1 : skip_test_total
        end
      end
    end

    def count_profile_errored_tests(profile)
      profile.controls.reduce(0) do |acc, elem|
        acc + elem.results.reduce(0) do |err_test_total, test_case|
          test_case.backtrace.nil? ? err_test_total : err_test_total + 1
        end
      end
    end
  end

  # This is the "Legacy" JUnit reporter. It produces XML which is not
  # correct according to the JUnit standard. It is retained for backwards
  # compatibility.
  class ReporterV1 < Reporter
    def build_profile_xml(profile, _idx)
      profile_xml = REXML::Element.new("testsuite")
      profile_xml.add_attribute("name", profile.name)
      profile_xml.add_attribute("tests", count_profile_tests(profile))
      profile_xml.add_attribute("failed", count_profile_failed_tests(profile))
      profile_xml.add_attribute("failures", count_profile_failed_tests(profile))

      profile.controls.each do |control|
        control.results.each do |result|
          profile_xml.add(build_result_xml(profile.name, control, result))
        end
      end

      profile_xml
    end

    def build_result_xml(profile_name, control, result)
      result_xml = REXML::Element.new("testcase")
      result_xml.add_attribute("name", result.code_desc)
      result_xml.add_attribute("classname", control.title.nil? ? "#{profile_name}.Anonymous" : "#{profile_name}.#{control.id}")
      result_xml.add_attribute("target", run_data.platform.target.nil? ? "" : run_data.platform.target.to_s)
      result_xml.add_attribute("time", result.run_time)

      if result.status == "failed"
        failure_element = REXML::Element.new("failure")
        failure_element.add_attribute("message", result[:message])
        result_xml.add(failure_element)
      elsif result.status == "skipped"
        result_xml.add_element("skipped")
      end

      result_xml
    end
  end

  # This is the "Corrected" JUnit reporter. It produces XML which is intended
  # to be valid. It should be used whenever possible.
  class ReporterV2 < Reporter
    def build_profile_xml(profile, idx)
      profile_xml = REXML::Element.new("testsuite")
      profile_xml.add_attribute("name", profile.name)
      profile_xml.add_attribute("tests", count_profile_tests(profile))
      profile_xml.add_attribute("id", idx + 1)

      # junit2 counts failures and errors separately
      errors = count_profile_errored_tests(profile)
      profile_xml.add_attribute("errors", errors)
      profile_xml.add_attribute("failures", count_profile_failed_tests(profile) - errors)
      profile_xml.add_attribute("skipped", count_profile_skipped_tests(profile))

      profile_xml.add_attribute("hostname", run_data.platform.target.nil? ? "" : run_data.platform.target.to_s)
      # Author of the schema specified 8601, then went on to add
      # a regex that requires no TZ
      profile_xml.add_attribute("timestamp", Time.now.iso8601.slice(0, 19))

      # These are empty but are just here to satisfy the schema
      profile_xml.add_attribute("package", "")
      profile_xml.add(REXML::Element.new("properties"))

      profile_time = 0.0
      profile.controls.each do |control|
        control.results.each do |result|
          profile_time += result.run_time
          profile_xml.add(build_result_xml(profile.name, control, result))
        end
      end
      profile_xml.add_attribute("time", "%.6f" % profile_time)

      profile_xml.add(REXML::Element.new("system-out"))
      profile_xml.add(REXML::Element.new("system-err"))

      profile_xml
    end

    def build_result_xml(profile_name, control, result)
      result_xml = REXML::Element.new("testcase")
      result_xml.add_attribute("name", result.code_desc)
      result_xml.add_attribute("classname", control.title.nil? ? "#{profile_name}.Anonymous" : "#{profile_name}.#{control.id}")

      # <Nokogiri::XML::SyntaxError: 20:0: ERROR: Element 'testcase', attribute 'time': '4.9e-05' is not a valid value of the atomic type 'xs:decimal'.
      # So, we format it.
      result_xml.add_attribute("time", "%.6f" % result.run_time)

      if result.status == "failed"
        failure_element = REXML::Element.new("failure")
        failure_element.add_attribute("message", result.message)
        failure_element.add_attribute("type", result.resource_title&.to_s || "")
        result_xml.add(failure_element)
      elsif result.status == "skipped"
        result_xml.add_element("skipped")
      end

      result_xml
    end
  end
end
