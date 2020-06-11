require 'spec_helper'

RSpec.describe('CharacterSet::Range parsing') do
  specify('parse set range') do
    root = RP.parse('[a-z]')
    set = root[0]
    range = set[0]

    expect(set.count).to eq 1
    expect(range).to be_instance_of(CharacterSet::Range)
    expect(range.count).to eq 2
    expect(range.first.to_s).to eq 'a'
    expect(range.first).to be_instance_of(Literal)
    expect(range.last.to_s).to eq 'z'
    expect(range.last).to be_instance_of(Literal)
    expect(set).to match 'm'
  end

  specify('parse set range hex') do
    root = RP.parse('[\\x00-\\x99]')
    set = root[0]
    range = set[0]

    expect(set.count).to eq 1
    expect(range).to be_instance_of(CharacterSet::Range)
    expect(range.count).to eq 2
    expect(range.first.to_s).to eq '\\x00'
    expect(range.first).to be_instance_of(EscapeSequence::Hex)
    expect(range.last.to_s).to eq '\\x99'
    expect(range.last).to be_instance_of(EscapeSequence::Hex)
    expect(set).to match '\\x50'
  end

  specify('parse set range unicode') do
    root = RP.parse('[\\u{40 42}-\\u1234]')
    set = root[0]
    range = set[0]

    expect(set.count).to eq 1
    expect(range).to be_instance_of(CharacterSet::Range)
    expect(range.count).to eq 2
    expect(range.first.to_s).to eq '\\u{40 42}'
    expect(range.first).to be_instance_of(EscapeSequence::CodepointList)
    expect(range.last.to_s).to eq '\\u1234'
    expect(range.last).to be_instance_of(EscapeSequence::Codepoint)
    expect(set).to match '\\u600'
  end

  specify('parse set range edge case leading dash') do
    root = RP.parse('[--z]')
    set = root[0]
    range = set[0]

    expect(set.count).to eq 1
    expect(range.count).to eq 2
    expect(set).to match 'a'
  end

  specify('parse set range edge case trailing dash') do
    root = RP.parse('[!--]')
    set = root[0]
    range = set[0]

    expect(set.count).to eq 1
    expect(range.count).to eq 2
    expect(set).to match '$'
  end

  specify('parse set range edge case leading negate') do
    root = RP.parse('[^-z]')
    set = root[0]

    expect(set.count).to eq 2
    expect(set).to     match 'a'
    expect(set).not_to match 'z'
  end

  specify('parse set range edge case trailing negate') do
    root = RP.parse('[!-^]')
    set = root[0]
    range = set[0]

    expect(set.count).to eq 1
    expect(range.count).to eq 2
    expect(set).to match '$'
  end

  specify('parse set range edge case leading intersection') do
    root = RP.parse('[[\\-ab]&&-bc]')
    set = root[0]

    expect(set.count).to eq 1
    expect(set.first.last.to_s).to eq '-bc'
    expect(set).to     match '-'
    expect(set).to     match 'b'
    expect(set).not_to match 'a'
    expect(set).not_to match 'c'
  end

  specify('parse set range edge case trailing intersection') do
    root = RP.parse('[bc-&&[\\-ab]]')
    set = root[0]

    expect(set.count).to eq 1
    expect(set.first.first.to_s).to eq 'bc-'
    expect(set).to     match '-'
    expect(set).to     match 'b'
    expect(set).not_to match 'a'
    expect(set).not_to match 'c'
  end
end
