require 'inspec/resources/json'

# Parses a csv document
# This implementation was inspired by a blog post
# @see http://technicalpickles.com/posts/parsing-csv-with-ruby
module Inspec::Resources
  class CsvConfig < JsonConfig
    name 'csv'
    desc 'Use the csv InSpec audit resource to test configuration data in a CSV file.'
    example <<~EXAMPLE
      describe csv('example.csv') do
        its('name') { should eq(['John', 'Alice']) }
      end
    EXAMPLE

    # override the parse method from JsonConfig
    # Assuming a header row of name,col1,col2, it will output an array of hashes like so:
    #    [
    #      { 'name' => 'row1', 'col1' => 'value1', 'col2' => 'value2' },
    #      { 'name' => 'row2', 'col1' => 'value3', 'col2' => 'value4' }
    #    ]
    def parse(content)
      require 'csv'

      # convert empty field to nil
      CSV::Converters[:blank_to_nil] = lambda do |field|
        field && field.empty? ? nil : field
      end

      # implicit conversion of values
      csv = CSV.new(content, headers: true, converters: [:all, :blank_to_nil])

      # convert to hash
      csv.to_a.map(&:to_hash)
    rescue => e
      raise Inspec::Exceptions::ResourceFailed, "Unable to parse CSV: #{e.message}"
    end

    # override the value method from JsonConfig
    # The format of the CSV hash as created by #parse is very different
    # than what the YAML, JSON, and INI resources create, so using the
    # #value method from JsonConfig (which uses ObjectTraverser.extract_value)
    # doesn't make sense here.
    def value(key)
      @params.map { |x| x[key.first.to_s] }.compact
    end

    private

    # used by JsonConfig to build up a full to_s method
    # based on whether a file path, content, or command was supplied.
    def resource_base_name
      'CSV'
    end
  end
end
