require 'spec_helper'

RSpec.describe('Expression#to_s') do
  specify('literal alternation') do
    pattern = 'abcd|ghij|klmn|pqur'

    expect(RP.parse(pattern).to_s).to eq pattern
  end

  specify('quantified alternations') do
    pattern = '(?:a?[b]+(c){2}|d+[e]*(f)?)|(?:g+[h]?(i){2,3}|j*[k]{3,5}(l)?)'

    expect(RP.parse(pattern).to_s).to eq pattern
  end

  specify('quantified sets') do
    pattern = '[abc]+|[^def]{3,6}'

    expect(RP.parse(pattern).to_s).to eq pattern
  end

  specify('property sets') do
    pattern = '[\\a\\b\\p{Lu}\\P{Z}\\c\\d]+'

    expect(RP.parse(pattern, 'ruby/1.9').to_s).to eq pattern
  end

  specify('groups') do
    pattern = "(a(?>b(?:c(?<n>d(?'N'e)??f)+g)*+h)*i)++"

    expect(RP.parse(pattern, 'ruby/1.9').to_s).to eq pattern
  end

  specify('assertions') do
    pattern = '(a+(?=b+(?!c+(?<=d+(?<!e+)?f+)?g+)?h+)?i+)?'

    expect(RP.parse(pattern, 'ruby/1.9').to_s).to eq pattern
  end

  specify('comments') do
    pattern = '(?#start)a(?#middle)b(?#end)'

    expect(RP.parse(pattern).to_s).to eq pattern
  end

  specify('options') do
    pattern = '(?mix:start)a(?-mix:middle)b(?i-mx:end)'

    expect(RP.parse(pattern).to_s).to eq pattern
  end

  specify('url') do
    pattern = ('(^$)|(^(http|https):\\/\\/[a-z0-9]+([\\-\\.]{1}[a-z0-9]+)*' + '\\.[a-z]{2,5}(([0-9]{1,5})?\\/.*)?$)')

    expect(RP.parse(pattern).to_s).to eq pattern
  end

  specify('multiline source') do
    multiline = /
          \A
          a?      # One letter
          b{2,5}  # Another one
          [c-g]+  # A set
          \z
        /x

    expect(RP.parse(multiline).to_s).to eq multiline.source
  end

  specify('multiline #to_s') do
    multiline = /
          \A
          a?      # One letter
          b{2,5}  # Another one
          [c-g]+  # A set
          \z
        /x

    expect(RP.parse(multiline.to_s).to_s).to eq multiline.to_s
  end

  # Free spacing expressions that use spaces between quantifiers and their
  # targets do not produce identical results due to the way quantifiers are
  # applied to expressions (members, not nodes) and the merging of consecutive
  # space nodes. This tests that they produce equivalent results.
  specify('multiline equivalence') do
    multiline = /
          \A
          a   ?             # One letter
          b {2,5}           # Another one
          [c-g]  +          # A set
          \z
        /x

    str = 'bbbcged'
    root = RP.parse(multiline)

    expect(Regexp.new(root.to_s, Regexp::EXTENDED).match(str)[0]).to eq multiline.match(str)[0]
  end
end
