# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved
require 'vulcano/base_rule'
require 'vulcano/log'
require 'verify/dummy'
# the user may use dynamic evaluations via pry
begin
  require 'pry'
rescue LoadError
end

module Vulcano
  class DummyContext
    include Vulcano::DSL

    def initialize path, profile_id
      @path = path
      @profile_id = profile_id
      @rules = {}
      @errors = []
    end

    def only_if *a, &b
      # always ignore
    end

    def __get_method_source path, lineno
      raw = File::read(path)
      src = RubyVM::InstructionSequence.compile(raw)
      stack = src.to_a
      if stack[0] != 'YARVInstructionSequence/SimpleDataFormat'
        return ''
      end
      bcode = stack[13]
      idx = bcode.find_index{|x| x == lineno }
      rcode = bcode.drop(idx+1)
      bottom = rcode.find_index{|x| x.is_a?(Fixnum) }
      if bottom.nil?
        lineend = -1
      else
        lineend = rcode[bottom]-1
      end
      body = rcode.find{|x| x.is_a?(Array) && x[0] == :send}
      unless body.nil? || body.length < 2
        bflat = body[1][:blockptr].flatten.reverse
        i = bflat.find_index{|x| x.is_a?(Symbol) && x.to_s =~ /^label_\d+$/}
        if i > 1 && bflat[i-1].is_a?(Fixnum) && bflat[i-1] < lineend
          lineend = bflat[i-1]
        end
      end
      raw.split("\n")[lineno-1..lineend-1].join("\n")
    end

    # DSL methods
    def __register_rule r
      src_file = @path.to_s + ':'
      call_file = caller.find{|x| x.to_s.start_with? src_file}
      unless call_file.nil?
        lineno = call_file[src_file.length..-1].split(':')[0].to_i
        src = __get_method_source(@path, lineno)
        r.instance_variable_set(:@__code, src)
      end
      fid = VulcanoBaseRule.full_id r, @profile_id
      if @rules[fid].nil?
        @rules[fid] = r
      else
        @errors.push "Duplicate definition of rule #{fid}."
      end
    end
    def __unregister_rule id
      fid = "#{@profile_id}/#{id}"
      if @rules.key? fid
        @rules.delete(fid)
      else
        @errors.push "Failed to skip rule #{fid}, it isn't defined."
      end
    end

    # redefine require to find files in the context
    # of this profile
    def require sth
      # ignore vulcano includes, we already have those
      lib = File::expand_path( File.join @path, '..', '..', 'lib', "#{sth}.rb" )
      if File::file? lib
        require_relative lib
      end
    end

    def method_missing sth, *args
      @errors.push "Don't understand method #{sth} ( #{args} )."
    end

  end
end


module Vulcano
  class SpecFile
    Log = ::Vulcano::Log.new()

    attr_reader :errors, :rules
    def initialize path, metadata
      @rules = []
      @raw = File::read(path)
      @profile_id = metadata.dict['name']
      @invalid_calls = []

      ctx = DummyContext.new(path, @profile_id)
      ctx.instance_eval(@raw, path, 1)
      @errors = ctx.instance_variable_get(:@errors)
      @rules = ctx.instance_variable_get(:@rules)
    end

    def metadata
      header = @raw.sub(/^[^#].*\Z/m,'')
      {
        "title" => mOr(header.match(/^# title: (.*)$/), 'untitled'),
        "copyright" => mOr(header.match(/^# copyright: (.*)$/), 'All rights reserved'),
        "rules" => rules2dict(@rules)
      }
    end

    def self.from_file path, metadata
      if !File::file?(path)
        Log.error "Can't find spec file in #{path}"
        return nil
      end
      return SpecFile.new(path, metadata)
    end

    private

    def rule2dict(rule)
      d = nil
      d = rule.desc.gsub(/\s*\n\s*/, ' ').strip unless rule.desc.nil?
      {
        "impact" => rule.impact,
        "title"  => rule.title,
        "desc"   => d,
        "code"   => rule.instance_variable_get(:@__code)
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
            "Not redefining rule id #{id}:\n"+
            "-- #{res[id]}\n"+
            "++ #{nu}\n"
          )
        end
      end
      res
    end

    def mOr(m, other)
      (m.nil? || m[1].nil?) ? other : m[1]
    end

  end
end

def os *a, &b
  {}
end
