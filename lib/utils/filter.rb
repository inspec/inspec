# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

module Inspec
  module Filter
    module Show; end

    def add_filter(field_name)
      fail "Called add_filter in resource #{self} with field name nil!" if field_name.nil?
      method_name = field_name.to_s
      # methods will alwas target plurals; this is why the suffix 's' is mandatory
      method_name += 's' unless method_name.end_with? 's'

      define_method method_name.to_sym do |condition = Show|
        return get_fields(field_name) if condition == Show
        where({ field_name => condition })
      end
    end

    def self.where(table, conditions = {})
      return self if !conditions.is_a?(Hash) || conditions.empty?
      filters = ''
      conditions.each do |field, condition|
        filters += " #{field} = #{condition.inspect}"
        table = filter_lines(table, field, condition)
      end
      [table, filters]
    end

    def self.filter_lines(table, field, condition)
      table.find_all do |line|
        next unless line.key?(field)
        case line[field]
        when condition
          true
        else
          false
        end
      end
    end
  end
end
