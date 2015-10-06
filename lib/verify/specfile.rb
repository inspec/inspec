# encoding: utf-8
# copyright: 2015, Dominik Richter
# author: Dominik Richter
# author: Christoph Hartmann
# license: All rights reserved

require 'vulcano/base_rule'
require 'vulcano/log'
require 'verify/dummy'
require 'method_source'
# the user may use dynamic evaluations via pry
begin
  require 'pry'
rescue LoadError # rubocop:disable Lint/HandleExceptions
end

module Vulcano
  class DummyContext
    include Vulcano::DSL

    def initialize(path, profile_id)
      @path = path
      @profile_id = profile_id
      @rules = {}
      @errors = []
    end

    def only_if(*_a, &_b)
      # always ignore
    end

    def __get_block_source(&block)
      return '' unless block_given?
      block.source.to_s
    end

    # DSL methods
    def __register_rule(r, &block)
      if block_given?
        src = __get_block_source(&block)
      else
        src = __get_block_source(&r.instance_variable_get(:@__block))
      end
      r.instance_variable_set(:@__code, src)

      full_id = VulcanoBaseRule.full_id @profile_id, r
      if @rules[full_id].nil?
        @rules[full_id] = r
      else
        @errors.push "Duplicate definition of rule #{fid}."
      end
    end

    def __unregister_rule(id)
      full_id = VulcanoBaseRule.full_id @profile_id, id
      if @rules.key?(full_id)
        @rules.delete(full_id)
      else
        @errors.push "Failed to skip rule #{fid}, it isn't defined."
      end
    end

    # redefine require to find files in the context
    # of this profile
    def require(sth)
      # ignore vulcano includes, we already have those
      lib = File.expand_path(File.join @path, '..', '..', 'lib', "#{sth}.rb")
      require_relative lib if File.file? lib
    end

    def method_missing(sth, *args)
      @errors.push "Don't understand method #{sth} ( #{args} )."
    end
  end
end

module Vulcano
  class SpecFile
    Log = ::Vulcano::Log.new

    attr_reader :errors, :rules
    def initialize(path, metadata)
      @filename = File.basename(path)
      @rules = []
      @raw = File.read(path)
      @profile_id = metadata.dict['name']
      @invalid_calls = []

      ctx = DummyContext.new(path, @profile_id)
      ctx.instance_eval(@raw, path, 1)
      @errors = ctx.instance_variable_get(:@errors)
      @rules = ctx.instance_variable_get(:@rules)
    end

    def metadata
      header = @raw.sub(/^[^#].*\Z/m, '')
      {
        'title' =>     header[/^# title: (.*)$/, 1] || @filename,
        'copyright' => header[/^# copyright: (.*)$/, 1] || 'All rights reserved',
        'rules' =>     rules2dict(@rules),
      }
    end

    def self.from_file(path, metadata)
      if !File.file?(path)
        Log.error "Can't find spec file in #{path}"
        return nil
      end
      SpecFile.new(path, metadata)
    end

    private

    def rule2dict(rule)
      d = nil
      d = rule.desc.gsub(/\s*\n\s*/, ' ').strip unless rule.desc.nil?
      {
        'impact' => rule.impact,
        'title'  => rule.title,
        'desc'   => d,
        'code'   => rule.instance_variable_get(:@__code),
      }
    end

    def rules2dict(rules)
      res = {}
      rules.map do |id, rule|
        nu = rule2dict(rule)
        if res[id].nil?
          res[id] = nu
        else
          Log.error(
            "Not redefining rule id #{id}:\n" \
            "-- #{res[id]}\n" \
            "++ #{nu}\n",
          )
        end
      end
      res
    end
  end
end

def os(*_a, &_b)
  {}
end
