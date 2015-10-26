# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

# Parses a json document
# Usage:
# describe json('policyfile.lock.json') do
#   its('cookbook_locks.omnibus.version') { should eq('2.2.0') }
# end
class JsonConfig < Inspec.resource(1)
  name 'json'

  # make params readable
  attr_reader :params

  def initialize(path)
    @path = path
    @file_content = inspec.file(@path).content
    @params = parse(@file_content)
  end

  def parse(content)
    require 'json'
    JSON.parse(content)
  end

  def extract_value(keys, value)
    key = keys.shift
    return nil if key.nil?

    # check if key is a num, try to extract from array
    if key.to_i.to_s == key
      value = value[key.to_i]
    # if value is an array, iterate over each child
    elsif value.is_a?(Array)
      value = value.map { |i|
        extract_value([key], i)
      }
    # normal value extraction
    else
      value = value[key].nil? ? nil : value[key]
    end

    # check if further keys exist
    if !keys.first.nil?
      return extract_value(keys.clone, value)
    else
      return value
    end
  end

  def method_missing(name)
    # split dotted path
    keys = name.to_s.split('.')
    extract_value(keys, @params.clone)
  end

  def to_s
    "Json #{@path}"
  end
end
