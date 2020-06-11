# frozen_string_literal: true

RSpec.describe TTY::Reader::History do
  it "has no lines" do
    history = described_class.new
    expect(history.size).to eq(0)
  end

  it "doesn't navigate through empty buffer" do
    history = described_class.new
    expect(history.next?).to eq(false)
    expect(history.previous?).to eq(false)
  end

  it "allows to cycle through non-empty buffer" do
    history = described_class.new(3, cycle: true)
    history << "line"
    expect(history.next?).to eq(true)
    expect(history.previous?).to eq(true)
  end

  it "defaults maximum size" do
    history = described_class.new
    expect(history.max_size).to eq(512)
  end

  it "presents string representation" do
    history = described_class.new
    expect(history.to_s).to eq("[]")
  end

  it "adds items to history without overflowing" do
    history = described_class.new(3)
    history << "line #1"
    history << "line #2"
    history << "line #3"
    history << "line #4"

    expect(history.to_a).to eq(["line #2", "line #3", "line #4"])
    expect(history.index).to eq(2)
  end

  it "excludes items" do
    exclude = proc { |line| /line #[23]/.match(line) }
    history = described_class.new(exclude: exclude)
    history << "line #1"
    history << "line #2"
    history << "line #3"

    expect(history.to_a).to eq(["line #1"])
    expect(history.index).to eq(0)
  end

  it "allows duplicates" do
    history = described_class.new
    history << "line #1"
    history << "line #1"
    history << "line #1"

    expect(history.to_a).to eq(["line #1", "line #1", "line #1"])
  end

  it "prevents duplicates" do
    history = described_class.new(duplicates: false)
    history << "line #1"
    history << "line #1"
    history << "line #1"

    expect(history.to_a).to eq(["line #1"])
  end

  it "navigates through history buffer without cycling" do
    history = described_class.new(3)
    history << "line #1"
    history << "line #2"
    history << "line #3"

    expect(history.index).to eq(2)
    history.previous
    history.previous
    expect(history.index).to eq(0)
    history.previous
    expect(history.index).to eq(0)
    history.next
    history.next
    expect(history.index).to eq(2)
    history.next
    expect(history.next?).to eq(false)
    expect(history.index).to eq(2)
  end

  it "navigates through history buffer with cycling" do
    history = described_class.new(3, cycle: true)
    history << "line #1"
    history << "line #2"
    history << "line #3"

    expect(history.index).to eq(2)
    history.previous
    history.previous
    expect(history.index).to eq(0)
    history.previous
    expect(history.index).to eq(2)
    expect(history.next?).to eq(true)
    history.next
    history.next
    expect(history.index).to eq(1)
    history.next
    expect(history.index).to eq(2)
  end

  it "checks if navigation is possible" do
    history = described_class.new(3)

    expect(history.index).to eq(nil)
    expect(history.previous?).to eq(false)
    expect(history.next?).to eq(false)

    history << "line #1"
    history << "line #2"
    expect(history.index).to eq(1)
    expect(history.previous?).to eq(true)
    expect(history.next?).to eq(false)

    history.previous
    expect(history.index).to eq(0)
    expect(history.previous?).to eq(true)
    expect(history.next?).to eq(true)

    history.previous
    expect(history.index).to eq(0)
    expect(history.previous?).to eq(true)
    expect(history.next?).to eq(true)
  end

  it "gets line based on index" do
    history = described_class.new(3, cycle: true)
    history << "line #1"
    history << "line #2"
    history << "line #3"

    expect(history[-1]).to eq('line #3')
    expect(history[1]).to eq('line #2')
    expect {
      history[11]
    }.to raise_error(IndexError, 'invalid index')
  end

  it "retrieves current line" do
    history = described_class.new(3, cycle: true)
    expect(history.get).to eq(nil)

    history << "line #1"
    history << "line #2"
    history << "line #3"

    expect(history.get).to eq("line #3")
    history.previous
    history.previous
    expect(history.get).to eq("line #1")
    history.next
    expect(history.get).to eq("line #2")
  end

  it "clears all lines" do
    history = described_class.new(3)

    history << "line #1"
    history << "line #2"
    history << "line #3"

    expect(history.size).to eq(3)
    history.clear
    expect(history.size).to eq(0)
    expect(history.index).to eq(0)
  end
end
