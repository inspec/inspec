module Inspec
  class Control
    attr_accessor :id, :title, :descriptions, :impact, :tests, :tags, :refs, :only_if
    def initialize
      @tests = []
      @tags = []
      @refs = []
      @descriptions = {}
    end

    def add_test(t)
      @tests.push(t)
    end

    def add_tag(t)
      @tags.push(t)
    end

    def to_hash
      {
        id: id,
        title: title,
        descriptions: descriptions,
        impact: impact,
        tests: tests.map(&:to_hash),
        tags: tags.map(&:to_hash),
      }
    end

    def to_ruby # rubocop:disable Metrics/AbcSize
      res = ["control #{id.inspect} do"]
      res.push "  title #{title.inspect}" unless title.to_s.empty?
      descriptions.each do |label, text|
        if label == :default
          next if text.nil? or text == '' # don't render empty/nil desc
          res.push "  desc  #{prettyprint_text(text, 2)}"
        else
          res.push "  desc  #{label.to_s.inspect}, #{prettyprint_text(text, 2)}"
        end
      end
      res.push "  impact #{impact}" unless impact.nil?
      tags.each { |t| res.push(indent(t.to_ruby, 2)) }
      refs.each { |t| res.push("  ref   #{print_ref(t)}") }
      res.push "  only_if { #{only_if} }" if only_if
      tests.each { |t| res.push(indent(t.to_ruby, 2)) }
      res.push 'end'
      res.join("\n")
    end

    private

    def print_ref(x)
      return x.inspect if x.is_a?(String)
      raise "Cannot process the ref: #{x}" unless x.is_a?(Hash)
      '('+x.inspect+')'
    end

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
