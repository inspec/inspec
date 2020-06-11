module XmlHelpers
  extend RSpec::Matchers::DSL

  matcher :validate_against_schema do |schema|
    match do |actual|
      xsd = Nokogiri::XML::Schema(schema.read)
      @validation_errors = xsd.validate(actual)
      @validation_errors.empty?
    end

    failure_message do |actual|
      num_errors = @validation_errors.length
      error_count = "#{num_errors} error#{'s' if num_errors > 1}"

      "expected XML to validate against #{schema}, got #{error_count}:\n" +
        @validation_errors.each_with_index.map do |error, i|
          "  #{i + 1}. #{error}"
        end.join("\n")
    end
  end

  matcher :contain_node do |name|
    match do |doc|
      if @attributes
        doc.css(name).detect do |node|
          @attributes.all? { |k, v| node.css(k).text == v }
        end
      else
        doc.at_css(name)
      end
    end

    chain :with_children do |attributes|
      @attributes = attributes
    end

    failure_message do |doc|
      expected_xml = "<#{name}>\n"

      if @attributes
        @attributes.each { |k,v| expected_xml << "  <#{k}>#{v}</#{k}>\n" }
      end

      expected_xml << "</#{name}>"

      "expected XML to contain:\n\n#{expected_xml}\n\ninstead got:\n\n#{doc.to_s}"
    end
  end
end
