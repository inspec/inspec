# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'inspec/plugins'

module Inspec
  class Fetcher
    @registry = {}

    class << self
      attr_reader :registry

      def resolve(target)
        modules.each do |m|
          res = m.resolve(target)
          return res unless res.nil?
        end
        nil
      end

      private

      def modules
        @registry.values
                 .sort_by { |x| x.respond_to?(:priority) ? x.priority : 0 }
      end
    end
  end

  def self.fetcher(version)
    if version != 1
      fail 'Only fetcher version 1 is supported!'
    end
    Inspec::Plugins::Fetcher
  end
end
