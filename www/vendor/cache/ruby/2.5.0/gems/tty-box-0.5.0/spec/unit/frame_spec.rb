# frozen_string_literal: true

RSpec.describe TTY::Box, "#frame" do
  it "creates frame without content & width & height values" do
    output = TTY::Box.frame

    expect(output).to eq([
      "┌─┐\n",
      "└─┘\n"
    ].join)
  end

  it "creates frame around content without width & height values" do
    output = TTY::Box.frame "Hello world!"

    expect(output).to eq([
      "┌────────────┐\n",
      "│Hello world!│\n",
      "└────────────┘\n"
    ].join)
  end

  it "creates frame around content without width & height values" do
    output = TTY::Box.frame "Hello\nworld!"

    expect(output).to eq([
      "┌──────┐\n",
      "│Hello │\n",
      "│world!│\n",
      "└──────┘\n"
    ].join)
  end

  it "creates frame based on multiline content without width & height values" do
    output = TTY::Box.frame "Hello", "world!"

    expect(output).to eq([
      "┌──────┐\n",
      "│Hello │\n",
      "│world!│\n",
      "└──────┘\n"
    ].join)
  end

  it "creates frame around block content without width & height values" do
    output = TTY::Box.frame do
      "Hello world!"
    end

    expect(output).to eq([
      "┌────────────┐\n",
      "│Hello world!│\n",
      "└────────────┘\n"
    ].join)
  end
  it "creates frame with only  width & height values" do
    output = TTY::Box.frame(width: 35, height: 4)

    expect(output).to eq([
      "┌─────────────────────────────────┐\n",
      "│                                 │\n",
      "│                                 │\n",
      "└─────────────────────────────────┘\n"
    ].join)
  end

  it "creates frame at a position with direct width & height values" do
    output = TTY::Box.frame(top: 0, left: 0, width: 35, height: 4)

    expect(output).to eq([
      "\e[1;1H┌─────────────────────────────────┐",
      "\e[2;1H│\e[2;35H│",
      "\e[3;1H│\e[3;35H│",
      "\e[4;1H└─────────────────────────────────┘"
    ].join)
  end

  it "displays content when block provided" do
    output = TTY::Box.frame(top: 0, left: 0, width: 35, height: 4) do
      "Hello world!"
    end

    expect(output).to eq([
      "\e[1;1H┌─────────────────────────────────┐",
      "\e[2;1H│Hello world!                     \e[2;35H│",
      "\e[3;1H│\e[3;35H│",
      "\e[4;1H└─────────────────────────────────┘"
    ].join)
  end

  it "wraps content when exceeding width" do
    box = TTY::Box.frame(top: 0, left: 0, width: 20, height: 4) do
      "Drawing a box in terminal emulator"
    end

    expect(box).to eq([
      "\e[1;1H┌──────────────────┐",
      "\e[2;1H│Drawing a box in  \e[2;20H│",
      "\e[3;1H│terminal emulator \e[3;20H│",
      "\e[4;1H└──────────────────┘"
    ].join)
  end

  it "correctly displays colored content" do
    box = TTY::Box.frame(width: 35, height: 3) do
      Pastel.new.green.on_red("Hello world!")
    end

    expect(box).to eq([
      "┌─────────────────────────────────┐\n",
      "│\e[32;41mHello world!\e[0m                     │\n",
      "└─────────────────────────────────┘\n"
    ].join)
  end

  it "handles \r\n line breaks" do
    box = TTY::Box.frame(
          width: 29,
          height: 7
        ) do
      "Closes #360\r\n\r\nCloses !217"
    end

    expect(box).to eq([
      "┌───────────────────────────┐\r\n",
      "│Closes #360                │\r\n",
      "│                           │\r\n",
      "│Closes !217                │\r\n",
      "│                           │\r\n",
      "│                           │\r\n",
      "└───────────────────────────┘\r\n"
    ].join)
  end
end
