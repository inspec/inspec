# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved
require 'vulcano/base_rule'
require 'vulcano/log'
require 'vulcano/dummy'

module Vulcano
  class DummyVulcanoRule < VulcanoBaseRule
    include DummyServerspecTypes
    include DummyVulcanoTypes
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
      @invalid_calls = []
      self.instance_eval(@raw)
    end

    def vulcano_meta
      # helper methods (which we don't expose)
      def rule2check(rule)
        d = nil
        d = rule.desc.gsub(/\s*\n\s*/, ' ').strip unless rule.desc.nil?
        {
          "impact" => rule.impact,
          "title"  => rule.title,
          "desc"   => d
        }
      end
      def rules2checks(rules)
        checks = {}
        rules.map do |rule|
          nu = rule2check(rule)
          if checks[rule.id].nil?
            checks[rule.id] = nu
          else
            Log.error(
              "Not redefining rule id #{rule.id}:\n"+
              "-- #{checks[rule.id]}\n"+
              "++ #{nu}\n"
            )
          end
        end
        checks
      end
      def mOr(m, other)
        (m.nil? || m[1].nil?) ? other : m[1]
      end
      header = @raw.sub(/^[^#].*\Z/m,'')

      {
        "title" => mOr(header.match(/^# title: (.*)$/), 'untitled'),
        "copyright" => mOr(header.match(/^# copyright: (.*)$/), 'All rights reserved'),
        "checks" => rules2checks(@rules)
      }
    end

    def rule id, &block
      @rules.push(DummyVulcanoRule.new(id, &block))
    end

    def method_missing sth, *args
      Log.warn "spec file doesn't support: #{sth} #{args.join(', ')}"
      @invalid_calls.push([sth, args])
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
