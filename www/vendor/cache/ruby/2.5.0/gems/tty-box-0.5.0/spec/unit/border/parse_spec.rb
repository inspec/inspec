# frozen_string_literal: true

RSpec.describe TTY::Box::Border, '.parse' do
  it "parses default border" do
    border = TTY::Box::Border.parse({})
    top_border = [border.top_left, border.top, border.top_right]
    bottom_border = [border.bottom_left, border.bottom, border.bottom_right]

    expect(border.type).to eq(:light)
    expect(top_border).to eq([:corner_top_left, :line, :corner_top_right])
    expect(bottom_border).to eq([:corner_bottom_left, :line, :corner_bottom_right])
    expect(border.left).to eq(:pipe)
    expect(border.right).to eq(:pipe)
  end

  it "parses only border type" do
    border = TTY::Box::Border.parse(:thick)
    top_border = [border.top_left, border.top, border.top_right]
    bottom_border = [border.bottom_left, border.bottom, border.bottom_right]

    expect(border.type).to eq(:thick)
    expect(top_border).to eq([:corner_top_left, :line, :corner_top_right])
    expect(bottom_border).to eq([:corner_bottom_left, :line, :corner_bottom_right])
    expect(border.left).to eq(:pipe)
    expect(border.right).to eq(:pipe)
  end

  it "parses custom border" do
    border = TTY::Box::Border.parse({
      top: true,
      top_left: :cross,
      top_right: :cross,
      bottom: true,
      bottom_left: :cross,
      bottom_right: :cross
    })

    top_border = [border.top_left, border.top, border.top_right]
    bottom_border = [border.bottom_left, border.bottom, border.bottom_right]

    expect(border.type).to eq(:light)
    expect(top_border).to eq([:cross, true, :cross])
    expect(bottom_border).to eq([:cross, true, :cross])
  end

  it "parses divider values" do
    border = TTY::Box::Border.parse({
      top_left: :divider_right,
      top_right: :divider_left,
      bottom_left: :divider_down,
      bottom_right: :divider_up
    })

    top_border = [border.top_left, border.top, border.top_right]
    bottom_border = [border.bottom_left, border.bottom, border.bottom_right]

    expect(border.type).to eq(:light)
    expect(top_border).to eq([:divider_right, :line, :divider_left])
    expect(bottom_border).to eq([:divider_down, :line, :divider_up])
  end
end
