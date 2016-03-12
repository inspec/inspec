# encoding: utf-8
# author: Dominik Richter
# author: Stephan Renatus
# author: Christoph Hartmann

module FilterTable
  module Show; end

  class Table
    attr_reader :params
    def initialize(resource, params, filters)
      @resource = resource
      @params = params
      @filters = filters
    end

    def where(conditions)
      return self if !conditions.is_a?(Hash) || conditions.empty?
      filters = ''
      table = @params
      conditions.each do |field, condition|
        filters += " #{field} = #{condition.inspect}"
        table = filter_lines(table, field, condition)
      end
      self.class.new(@resource, table, @filters + filters)
    end

    def get_fields(*fields)
      @params.map do |line|
        fields.map { |f| line[f] }
      end.flatten
    end

    def to_s
      @resource.to_s + @filters
    end

    alias inspect to_s

    private

    def filter_lines(table, field, condition)
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

  class Factory
    def initialize(resource, accessor)
      @resource = resource
      @accessor = accessor
      @table = Class.new(Table)
    end

    def table(instance)
      table.new(self, instance.method(table_accessor).call, '')
    end

    def add_delegator(method_name)
      if method_name.nil?
        throw RuntimeError, "Called filter.add_delegator for resource #{@resource} with method name nil!"
      end
      table_accessor = @accessor
      table = @table
      @resource.send(:define_method, method_name.to_sym) do |*args|
        filter = table.new(self, method(table_accessor).call, '')
        filter.method(method_name.to_sym).call(*args)
      end
      self
    end

    def add(method_name, opts = {}, &block)
      if method_name.nil?
        throw RuntimeError, "Called filter.add for resource #{@resource} with method name nil!"
      end

      field_name = opts[:field] || method_name
      @table.send(:define_method, method_name.to_sym) do |condition = Show|
        return block.call(self) unless block.nil? # rubocop:disable Performance/RedundantBlockCall
        return where(nil).get_fields(field_name) if condition == Show
        where({ field_name => condition })
      end

      add_delegator(method_name)
    end
  end

  def self.create(resource, accessor)
    Factory.new(resource, accessor)
  end
end
