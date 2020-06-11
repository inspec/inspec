# frozen_string_literal: true

RSpec.describe TTY::Reader, '#read_line' do
  let(:input)  { StringIO.new }
  let(:output) { StringIO.new }
  let(:env)    { { "TTY_TEST" => true } }

  subject(:reader) { described_class.new(input: input, output: output, env: env) }

  it 'masks characters' do
    input << "password\n"
    input.rewind

    answer = reader.read_line(echo: false)

    expect(answer).to eq("password\n")
  end

  it "echoes characters back" do
    input << "password\n"
    input.rewind

    answer = reader.read_line

    expect(answer).to eq("password\n")
    expect(output.string).to eq([
      "\e[2K\e[1Gp",
      "\e[2K\e[1Gpa",
      "\e[2K\e[1Gpas",
      "\e[2K\e[1Gpass",
      "\e[2K\e[1Gpassw",
      "\e[2K\e[1Gpasswo",
      "\e[2K\e[1Gpasswor",
      "\e[2K\e[1Gpassword",
      "\e[2K\e[1Gpassword\n"
    ].join)
  end

  it "doesn't echo characters back" do
    input << "password\n"
    input.rewind

    answer = reader.read_line(echo: false)

    expect(answer).to eq("password\n")
    expect(output.string).to eq("\n")
  end

  it "displays a prompt before input" do
    input << "aa\n"
    input.rewind

    answer = reader.read_line('>> ')

    expect(answer).to eq("aa\n")
    expect(output.string).to eq([
      ">> ",
      "\e[2K\e[1G>> a",
      "\e[2K\e[1G>> aa",
      "\e[2K\e[1G>> aa\n"
    ].join)
  end

  it "displays custom input with a prompt" do
    input << "aa\n"
    input.rewind

    answer = reader.read_line("> ", value: "xx")

    expect(answer).to eq("xxaa\n")
    expect(output.string).to eq([
      "> xx",
      "\e[2K\e[1G> xxa",
      "\e[2K\e[1G> xxaa",
      "\e[2K\e[1G> xxaa\n"
    ].join)
  end

  it 'deletes characters when backspace pressed' do
    input << "aa\ba\bcc\n"
    input.rewind

    answer = reader.read_line

    expect(answer).to eq("acc\n")
  end

  it 'reads multibyte line' do
    input << "한글"
    input.rewind

    answer = reader.read_line

    expect(answer).to eq("한글")
  end

  it "supports multiline prompts" do
    allow(TTY::Screen).to receive(:width).and_return(50)
    prompt = "one\ntwo\nthree"
    input << "aa\n"
    input.rewind

    answer = reader.read_line(prompt)

    expect(answer).to eq("aa\n")
    expect(output.string).to eq([
      prompt,
      "\e[2K\e[1G\e[1A" * 2,
      "\e[2K\e[1G",
      prompt + "a",
      "\e[2K\e[1G\e[1A" * 2,
      "\e[2K\e[1G",
      prompt + "aa",
      "\e[2K\e[1G\e[1A" * 2,
      "\e[2K\e[1G",
      prompt + "aa\n"
    ].join)
  end
end
