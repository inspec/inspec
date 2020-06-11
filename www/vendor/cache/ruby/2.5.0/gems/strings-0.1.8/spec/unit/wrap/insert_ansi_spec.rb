# frozen_string_literal: true

RSpec.describe "#insert_ansi" do
  it "doesn't do anything when empty stack" do
    text = "Ignorance is the parent of fear."

    val = Strings::Wrap.insert_ansi(text, [])

    expect(val).to eq(text)
  end

  it "inserts ANSI strings in a single line" do
    text = "Ignorance is the parent of fear."
    stack = [["\e[32;44m", 0], ["\e[0m", text.size]]

    val = Strings::Wrap.insert_ansi(text, stack)

    expect(val).to eq("\e[32;44mIgnorance is the parent of fear.\e[0m")
    expect(stack).to eq([])
  end

  it "inserts ANSI strings with missing reset in a single line" do
    text = "Ignorance is the parent of fear."
    stack = [["\e[32;44m", 0]]

    val = Strings::Wrap.insert_ansi(text, stack)

    expect(val).to eq("\e[32;44mIgnorance is the parent of fear.\e[0m")
    expect(stack).to eq([["\e[32;44m", 0]])
  end

  it "inserts 3 ansi strings in a single line" do
    text = "Ignorance is the parent of fear."
    stack = [
      ["\e[32m", 0], ["\e[0m", 9],
      ["\e[33m", 13], ["\e[0m", 16],
      ["\e[34m", 27], ["\e[0m", 31]
    ]

    val = Strings::Wrap.insert_ansi(text, stack)

    expect(val).to eq("\e[32mIgnorance\e[0m is \e[33mthe\e[0m parent of \e[34mfear\e[0m.")
    expect(stack).to eq([])
  end

  it "inserts nested ANSI strings in a single line" do
    text = "Ignorance is the parent of fear."
    stack = [["\e[32m", 10], ["\e[33m", 17], ["\e[0m", 23], ["\e[0m", 26]]

    val = Strings::Wrap.insert_ansi(text, stack)

    expect(val).to eq("Ignorance \e[32mis the \e[33mparent\e[0m of\e[0m fear.")
    expect(stack).to eq([])
  end

  it "removes matching pairs of ANSI codes only" do
    text = "one"
    stack =  [["\e[32m", 0], ["\e[0m", 3], ["\e[33m", 3]]

    val = Strings::Wrap.insert_ansi(text, stack)

    expect(val).to eq("\e[32mone\e[0m")
    expect(stack).to eq([["\e[33m", 3]])
  end
end
