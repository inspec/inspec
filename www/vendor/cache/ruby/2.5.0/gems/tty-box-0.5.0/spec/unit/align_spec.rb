# frozen_string_literal: true

RSpec.describe TTY::Box, ':align option' do
  it "aligns content without positioning" do
    box = TTY::Box.frame(width: 26, height: 4, align: :center) do
      "Drawing a box in terminal emulator"
    end

    expect(box).to eq([
      "┌────────────────────────┐\n",
      "│   Drawing a box in     │\n",
      "│   terminal emulator    │\n",
      "└────────────────────────┘\n"
    ].join)
  end

  it "aligns content with the option" do
    box = TTY::Box.frame(top: 0, left: 0, width: 26, height: 4, align: :center) do
      "Drawing a box in terminal emulator"
    end

    expect(box).to eq([
      "\e[1;1H┌────────────────────────┐",
      "\e[2;1H│   Drawing a box in     \e[2;26H│",
      "\e[3;1H│   terminal emulator    \e[3;26H│",
      "\e[4;1H└────────────────────────┘"
    ].join)
  end
end
