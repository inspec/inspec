# frozen_string_literal: true

RSpec.describe TTY::Box, ':border option' do
  it "creates frame with double lines and no position" do
    box = TTY::Box.frame(
      width: 35, height: 4,
      border: :thick
    )

    expect(box).to eq([
      "╔═════════════════════════════════╗\n",
      "║                                 ║\n",
      "║                                 ║\n",
      "╚═════════════════════════════════╝\n"
    ].join)
  end

  it "creates frame with double lines and absolute position" do
    box = TTY::Box.frame(
      top: 0, left: 0,
      width: 35, height: 4,
      border: :thick
    )

    expect(box).to eq([
      "\e[1;1H╔═════════════════════════════════╗",
      "\e[2;1H║\e[2;35H║",
      "\e[3;1H║\e[3;35H║",
      "\e[4;1H╚═════════════════════════════════╝"
    ].join)
  end

  it "creates an ASCII box" do
    box = TTY::Box.frame(
      width: 10, height: 4,
      border: :ascii
    )

    expect(box).to eq([
      "+--------+\n",
      "|        |\n",
      "|        |\n",
      "+--------+\n",
    ].join)
  end

  it "creates frame with without top & bottom borders" do
    box = TTY::Box.frame(
      top: 0, left: 0,
      width: 15, height: 4,
      border: {
        type: :thick,
        top: false,
        bottom: false
      }
    ) { "Hello Piotr!" }

    expect(box).to eq([
      "\e[1;1H║Hello Piotr! \e[1;15H║",
      "\e[2;1H║\e[2;15H║",
      "\e[3;1H║\e[3;15H║",
      "\e[4;1H║\e[4;15H║",
    ].join)
  end

  it "creates frame without left & right borders" do
    box = TTY::Box.frame(
      top: 0, left: 0,
      width: 15, height: 4,
      border: {
        left: false,
        right: false
      }
    ) { "Hello Piotr!" }

    expect(box).to eq([
      "\e[1;1H───────────────",
      "\e[2;1HHello Piotr! ",
      "\e[3;1H",
      "\e[4;1H───────────────"
    ].join)
  end

  it "creates frame without left & top borders" do
    box = TTY::Box.frame(
      top: 0, left: 0,
      width: 15, height: 4,
      border: {
        left: false,
        top: false
      }
    ) { "Hello Piotr!" }

    expect(box).to eq([
      "\e[1;1HHello Piotr! \e[1;15H│",
      "\e[2;1H\e[2;15H│",
      "\e[3;1H\e[3;15H│",
      "\e[4;1H──────────────┘"
    ].join)
  end

  it "creates frame with all corners changed to cross" do
    box = TTY::Box.frame(
      width: 10, height: 4,
      border: {
        top_left: :cross,
        top_right: :cross,
        bottom_left: :cross,
        bottom_right: :cross
      }
    )

    expect(box).to eq([
      "┼────────┼\n",
      "│        │\n",
      "│        │\n",
      "┼────────┼\n"
    ].join)
  end

  it "creates frame with all corners changed to dividers" do
    box = TTY::Box.frame(
      width: 10, height: 4,
      border: {
        top_left: :divider_down,
        top_right: :divider_left,
        bottom_left: :divider_right,
        bottom_right: :divider_up
      }
    ) { "hello" }

    expect(box).to eq([
      "┬────────┤\n",
      "│hello   │\n",
      "│        │\n",
      "├────────┴\n"
    ].join)
  end

  it "fails to recognise border value" do
    expect {
      TTY::Box.frame(border: {left: :unknown})
    }.to raise_error(ArgumentError, "Invalid border value: 'unknown' for :left")
  end

  it "fails to recognise border option" do
    expect {
     TTY::Box.frame(width: 35, height: 4, border: [:unknown])
    }.to raise_error(ArgumentError, "Wrong value `[:unknown]` for :border configuration option")
  end
end
