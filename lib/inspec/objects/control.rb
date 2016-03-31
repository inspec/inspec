# encoding:utf-8

module Inspec
  class Control
    attr_accessor :id, :title, :desc, :impact, :tests
    def initialize
      @tests = []
    end

    def add_test(t)
      @tests.push(t)
    end

    def to_hash
      { id: id, title: title, desc: desc, impact: impact, tests: tests.map(&:to_hash) }
    end

    def to_ruby
      res = ["control #{id.inspect} do"]
      res.push "  title #{title.inspect}" unless title.to_s.empty?
      res.push "  desc  #{desc.inspect}" unless desc.to_s.empty?
      res.push "  impact #{impact}" unless impact.nil?
      tests.each { |t| res.push(indent(t.to_ruby, 2)) }
      res.push 'end'
      res.join("\n")
    end

    private

    def indent(txt, d)
      dt = ' '*d
      dt + txt.gsub("\n", "\n"+dt)
    end
  end
end
