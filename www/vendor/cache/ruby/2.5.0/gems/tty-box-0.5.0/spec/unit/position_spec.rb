# frozen_string_literal: true

RSpec.describe TTY::Box, ':top, :left options' do
  it "skips positioning when no top & left values provided" do
    output = TTY::Box.frame(width: 35, height: 4)

    expect(output).to eq([
      "┌─────────────────────────────────┐\n",
      "│                                 │\n",
      "│                                 │\n",
      "└─────────────────────────────────┘\n"
    ].join)
  end

  it "allows to absolutely position within the terminal window" do
    output = TTY::Box.frame(top: 10, left: 40, width: 35, height: 4)

    expect(output).to eq([
      "\e[11;41H┌─────────────────────────────────┐",
      "\e[12;41H│\e[12;75H│",
      "\e[13;41H│\e[13;75H│",
      "\e[14;41H└─────────────────────────────────┘"
    ].join)
  end
end
