# frozen_string_literal: true

RSpec.describe TTY::Reader, '#publish_keypress_event' do
  let(:input) { StringIO.new }
  let(:out)   { StringIO.new }
  let(:env)   { { "TTY_TEST" => true } }

  let(:reader) { described_class.new(input: input, output: out, env: env) }

  it "publishes :keypress events" do
    input << "abc\n"
    input.rewind
    chars = []
    lines = []
    reader.on(:keypress) { |event| chars << event.value; lines << event.line }
    answer = reader.read_line

    expect(chars).to eq(%W(a b c \n))
    expect(lines).to eq(%W(a ab abc abc\n))
    expect(answer).to eq("abc\n")
  end

  it "publishes :keyescape events" do
    input << "a\e"
    input.rewind
    keys = []
    reader.on(:keypress)  { |event| keys << "keypress_#{event.value}"}
    reader.on(:keyescape) { |event| keys << "keyescape_#{event.value}" }

    answer = reader.read_line
    expect(keys).to eq(["keypress_a", "keyescape_\e", "keypress_\e"])
    expect(answer).to eq("a\e")
  end

  it "publishes :keyup for read_keypress" do
    input << "\e[Aaa"
    input.rewind
    keys = []
    reader.on(:keypress) { |event| keys << "keypress_#{event.value}" }
    reader.on(:keyup)    { |event| keys << "keyup_#{event.value}" }
    reader.on(:keydown)  { |event| keys << "keydown_#{event.value}" }

    answer = reader.read_keypress
    expect(keys).to eq(["keyup_\e[A", "keypress_\e[A"])
    expect(answer).to eq("\e[A")
  end

  it "publishes :keydown event for read_keypress" do
    input << "\e[Baa"
    input.rewind
    keys = []
    reader.on(:keypress) { |event| keys << "keypress_#{event.value}" }
    reader.on(:keyup)    { |event| keys << "keyup_#{event.value}" }
    reader.on(:keydown)  { |event| keys << "keydown_#{event.value}" }

    answer = reader.read_keypress
    expect(keys).to eq(["keydown_\e[B", "keypress_\e[B"])
    expect(answer).to eq("\e[B")
  end

  it "publishes :keynum event" do
    input << "5aa"
    input.rewind
    keys = []
    reader.on(:keypress) { |event| keys << "keypress_#{event.value}" }
    reader.on(:keyup)    { |event| keys << "keyup_#{event.value}" }
    reader.on(:keynum)   { |event| keys << "keynum_#{event.value}" }

    answer = reader.read_keypress
    expect(keys).to eq(["keynum_5", "keypress_5"])
    expect(answer).to eq("5")
  end

  it "publishes :keyreturn event" do
    input << "\r"
    input.rewind
    keys = []
    reader.on(:keypress)  { |event| keys << "keypress" }
    reader.on(:keyup)     { |event| keys << "keyup" }
    reader.on(:keyreturn) { |event| keys << "keyreturn" }

    answer = reader.read_keypress
    expect(keys).to eq(["keyreturn", "keypress"])
    expect(answer).to eq("\r")
  end

  it "subscribes to multiple events" do
    input << "\n"
    input.rewind
    keys = []
    reader.on(:keyenter) { |event| keys << "keyenter" }
          .on(:keypress) { |event| keys << "keypress" }

    answer = reader.read_keypress
    expect(keys).to eq(["keyenter", "keypress"])
    expect(answer).to eq("\n")
  end

  it "subscribes to ctrl+X type of event event" do
    input << ?\C-z
    input.rewind
    keys = []
    reader.on(:keyctrl_z) { |event| keys << "ctrl_z" }

    answer = reader.read_keypress
    expect(keys).to eq(['ctrl_z'])
    expect(answer).to eq(?\C-z)
  end
end
