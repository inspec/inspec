# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved
require 'vulcano/base_rule'
require 'vulcano/log'
require 'vulcano/dummy'

module Vulcano
  class DummyVulcanoRule < VulcanoBaseRule
    def method_missing(m, *a, &b)
    end
  end

  class SpecFile
    include DummyServerspecTypes
    include DummyVulcanoTypes
    Log = ::Vulcano::Log.new()

    def initialize path
      @path = path
      @rules = []
      @raw = File::read(path)
      self.instance_eval(@raw)
    end

    def vulcano_meta
      # helper methods (which we don't expose)
      def rule2check(rule)
        {
          "id"     => rule.id,
          "impact" => rule.impact,
          "title"  => rule.title,
          "desc"   => rule.desc.gsub(/\s*\n\s*/, ' ').strip
        }
      end
      def mOr(m, other)
        (m.nil? || m[1].nil?) ? other : m[1]
      end
      header = @raw.sub(/^[^#].*\Z/m,'')
      {
        "title" => mOr(header.match(/^# title: (.*)$/), 'untitled'),
        "copyright" => mOr(header.match(/^# copyright: (.*)$/), 'All rights reserved'),
        "checks" => @rules.map{|r| rule2check(r) }
      }
    end

    def rule id, &block
      @rules.push(DummyVulcanoRule.new(id, &block))
    end

    def method_missing sth, *args
      Log.warn "spec file doesn't support: #{sth} #{args.join(', ')}"
      # @invalid_calls.push([sth, args])
    end

    def require sth
      # ignore vulcano includes, we already have those
      lib = File::expand_path( File.join @path, '..', '..', 'lib', "#{sth}.rb" )
      if File::file? lib
        require_relative lib
      end
    end

    def self.from_file path
      if !File::file?(path)
        Log.error "Can't find spec file in #{path}"
        return nil
      end
      return SpecFile.new(path)
    end

  end
end
