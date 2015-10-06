# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

# Parses a csv document
# Usage:
# describe csv('example.csv') do
#   its('name') { should eq(['John', 'Alice']) }
# end
#
# This implementation was inspired by a blog post
# @see http://technicalpickles.com/posts/parsing-csv-with-ruby
class CsvConfig < JsonConfig
  name 'csv'

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
end
