# frozen_string_literal: true

RSpec.describe TTY::Reader, '#read_multiline' do
  let(:input)  { StringIO.new }
  let(:output) { StringIO.new }
  let(:env)    { { "TTY_TEST" => true } }

  subject(:reader) { described_class.new(input: input, output: output, env: env) }

  it 'reads no lines' do
    input << "\C-d"
    input.rewind
    answer = reader.read_multiline
    expect(answer).to eq([])
  end

  it "reads a line and terminates on Ctrl+d" do
    input << "Single line\C-d"
    input.rewind
    answer = reader.read_multiline
    expect(answer).to eq(["Single line"])
  end

  it "reads a line and terminates on Ctrl+z" do
    input << "Single line\C-z"
    input.rewind
    answer = reader.read_multiline
    expect(answer).to eq(["Single line"])
  end

  it 'reads few lines' do
    input << "First line\nSecond line\nThird line\n\C-d"
    input.rewind
    answer = reader.read_multiline
    expect(answer).to eq(["First line\n", "Second line\n", "Third line\n"])
  end

  it "skips empty lines" do
    input << "\n\nFirst line\n\n\n\n\nSecond line\C-d"
    input.rewind
    answer = reader.read_multiline
    expect(answer).to eq(["First line\n", "Second line"])
  end

  it 'reads and yiels every line' do
    input << "First line\nSecond line\nThird line\C-z"
    input.rewind
    lines = []
    reader.read_multiline { |line| lines << line }
    expect(lines).to eq(["First line\n", "Second line\n", "Third line"])
  end

  it 'reads multibyte lines' do
    input << "국경의 긴 터널을 빠져나오자\n설국이었다.\C-d"
    input.rewind
    lines = []
    reader.read_multiline { |line| lines << line }
    expect(lines).to eq(["국경의 긴 터널을 빠져나오자\n", '설국이었다.'])
  end

  it 'reads lines with a prompt' do
    input << "1\n2\n3\C-d"
    input.rewind
    reader.read_multiline(">> ")
    expect(output.string).to eq([
      ">> ",
      "\e[2K\e[1G>> 1",
      "\e[2K\e[1G>> 1\n",
      ">> ",
      "\e[2K\e[1G>> 2",
      "\e[2K\e[1G>> 2\n",
      ">> ",
      "\e[2K\e[1G>> 3",
    ].join)
  end
end
