# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

# Parses a csv document
# This implementation was inspired by a blog post
# @see http://technicalpickles.com/posts/parsing-csv-with-ruby
module Inspec::Resources
  class CsvConfig < JsonConfig
    name 'csv'
    desc 'Use the csv InSpec audit resource to test configuration data in a CSV file.'
    example "
      describe csv('example.csv') do
        its('name') { should eq(['John', 'Alice']) }
      end
    "

    # override file load and parse hash from csv
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
    end

    def to_s
      "Csv #{@path}"
    end
  end
end
