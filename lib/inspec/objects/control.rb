# encoding:utf-8

module Inspec
  class Control
    attr_accessor :id, :title, :desc, :impact, :tests, :tags
    def initialize
      @tests = []
      @tags = []
    end

    def add_test(t)
      @tests.push(t)
    end

    def add_tag(t)
      @tags.push(t)
    end

    def to_hash
      { id: id, title: title, desc: desc, impact: impact, tests: tests.map(&:to_hash), tags: tags.map(&:to_hash) }
    end

    def to_ruby
      res = ["control #{id.inspect} do"]
      res.push "  title #{title.inspect}" unless title.to_s.empty?
      res.push "  desc  #{prettyprint_text(desc, 2)}" unless desc.to_s.empty?
      res.push "  impact #{impact}" unless impact.nil?
      tags.each { |t| res.push(indent(t.to_ruby, 2)) }
      tests.each { |t| res.push(indent(t.to_ruby, 2)) }
      res.push 'end'
      res.join("\n")
    end

    private

    # Pretty-print a text block of InSpec code
    #
    # @param s [String] should not be empty
    # @param depth [Int] indentation length for multiline text blocks
    # @return [String] pretty-printed textblock
    def prettyprint_text(s, depth)
      txt = s.to_s.inspect.gsub('\n', "\n")
      return txt if !txt.include?("\n")
      middle = indent(txt[1..-2], depth+2)
      txt[0] + "\n" + middle + "\n" + ' '*depth + txt[-1]
    end

    def indent(txt, d)
      dt = ' '*d
      dt + txt.gsub("\n", "\n"+dt)
    end
  end
end
