module Inspec::Formatters
  class CustomBase

    def self.inherited(subclass)
      @descendants ||= []
      @descendants << subclass
    end

    def self.descendants
      return {} unless @descendants
      @descendants.map { |subclass| [subclass.name, subclass] }.to_h
    end

    def self.before_instance_eval(id)
      find_all_registered_descendant_formatters.each do |fmt|
        fmt.before_instance_eval(id)
      end
    end

    def self.after_instance_eval(id)
      find_all_registered_descendant_formatters.each do |fmt|
        fmt.after_instance_eval(id)
      end
    end

    # private
    def self.find_all_registered_descendant_formatters
      RSpec.configuration.formatters
        .find_all { |c| c.is_a?(Inspec::Formatters::CustomBase) }
    end

    private_class_method :find_all_registered_descendant_formatters
  end
end
