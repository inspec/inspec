# frozen_string_literal: true

require 'shellwords'

RSpec.describe TTY::Reader::KeyEvent, '#from' do
  let(:keys) { TTY::Reader::Keys.keys }

  it "parses backspace" do
    event = described_class.from(keys, "\x7f")
    expect(event.key.name).to eq(:backspace)
    expect(event.value).to eq("\x7f")
  end

  it "parses lowercase char" do
    event = described_class.from(keys, 'a')
    expect(event.key.name).to eq(:alpha)
    expect(event.value).to eq('a')
  end

  it "parses uppercase char" do
    event = described_class.from(keys, 'A')
    expect(event.key.name).to eq(:alpha)
    expect(event.value).to eq('A')
  end

  it "parses number char" do
    event = described_class.from(keys, '666')
    expect(event.key.name).to eq(:num)
    expect(event.value).to eq('666')
  end

  it "parses ctrl-a to ctrl-z inputs" do
    (1..26).zip('a'..'z').each do |code, char|
      event = described_class.from(TTY::Reader::Keys.ctrl_keys, code.chr)
      expect(event.key.name).to eq(:"ctrl_#{char}")
      expect(event.value).to eq(code.chr)
    end
  end

  it "parses uknown key" do
    no_keys = {}
    event = described_class.from(no_keys, '*')
    expect(event.key.name).to eq(:ignore)
    expect(event.value).to eq('*')
  end

  it "exposes line value" do
    event = described_class.from(keys, 'c', 'ab')
    expect(event.line).to eq('ab')
  end

  # F1-F12 keys
  {
    f1:  ["\eOP","\e[[A","\e[11~"],
    f2:  ["\eOQ","\e[[B","\e[12~"],
    f3:  ["\eOR","\e[[C","\e[13~"],
    f4:  ["\eOS","\e[[D","\e[14~"],
    f5:  [       "\e[[E","\e[15~"],
    f6:  [               "\e[17~"],
    f7:  [               "\e[18~"],
    f8:  [               "\e[19~"],
    f9:  [               "\e[20~"],
    f10: [               "\e[21~"],
    f11: [               "\e[23~"],
    f12: [               "\e[24~"]
  }.each do |name, codes|
    codes.each do |code|
      it "parses #{Shellwords.escape(code)} as #{name} key" do
        event = described_class.from(keys, code)
        expect(event.key.name).to eq(name)
        expect(event.key.meta).to eq(false)
        expect(event.key.ctrl).to eq(false)
        expect(event.key.shift).to eq(false)
      end
    end
  end

  # arrow keys & text editing
  {
    up:     ["\e[A"],
    down:   ["\e[B"],
    right:  ["\e[C"],
    left:   ["\e[D"],
    clear:  ["\e[E"],
    home:   ["\e[1~", "\e[7~", "\e[H"],
    end:    ["\e[4~", "\eOF", "\e[F"],
    insert: ["\e[2~"],
    delete: ["\e[3~"],
    page_up:   ["\e[5~"],
    page_down: ["\e[6~"]
  }.each do |name, codes|
    codes.each do |code|
      it "parses #{Shellwords.escape(code)} as #{name} key" do
        event = described_class.from(keys, code)
        expect(event.key.name).to eq(name)
        expect(event.key.meta).to eq(false)
        expect(event.key.ctrl).to eq(false)
        expect(event.key.shift).to eq(false)
      end
    end
  end
end
