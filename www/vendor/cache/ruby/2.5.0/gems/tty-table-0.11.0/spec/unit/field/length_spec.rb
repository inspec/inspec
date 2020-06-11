# frozen_string_literal: true

RSpec.describe TTY::Table::Field, '.length' do
  it "calculates length for nil string" do
    field = described_class.new(nil)
    expect(field.length).to eq(0)
  end

  it "calculates length for empty string" do
    field = described_class.new('')
    expect(field.length).to eq(0)
  end

  it "calculates maximum length for multiline string" do
    field = described_class.new("Multi\nLine\nContent")
    expect(field.length).to eq(7)
  end

  it "calculates length for unicode string" do
    field = described_class.new('こんにちは')
    expect(field.length).to eq(10)
  end

  it "calculates length for escaped string" do
    field = described_class.new("Multi\\nLine")
    expect(field.length).to eq(11)
  end

  it "calculates length for colored string" do
    field = described_class.new("\e[32;41mgreen on red\e[0m")
    expect(field.length).to eq(12)
  end
end
