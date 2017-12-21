# encoding: utf-8

require 'json'

module Inspec::Reporters
  class Json < Base
    def render
      output clean_json.to_json
    end

    private

    def clean_json
      # strip resource title and expectation message out of each result
      cleaned_data = run_data.dup
      cleaned_data[:controls].each do |control|
        control.delete(:expectation_message)
        control.delete(:resource_title)
      end

      cleaned_data[:platform].delete(:target)

      cleaned_data[:profiles].each do |profile|
        profile[:controls].each do |control|
          if control[:results]
            control[:results].delete(:expectation_message)
            control[:results].delete(:resource_title)
          end
        end
      end
      cleaned_data
    end
  end
end
