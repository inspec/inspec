# frozen_string_literal: true

RSpec.describe TTY::Box, ":style option" do
  it "applies styling to content and border" do
    box = TTY::Box.frame(
      top: 0,
      left: 0,
      width: 30,
      height: 4,
      border: :thick,
      title: {
        top_left: ' file1 '
      },
      style: {
        fg: :bright_yellow,
        bg: :blue,
        border: {
          fg: :bright_yellow,
          bg: :blue
        }
      }
    ) do
      "Midnight Commander\nis the best"
    end

    expect(box).to eq([
      "\e[1;1H\e[44m\e[93m╔\e[0m\e[0m\e[44m\e[93m file1 \e[0m\e[0m\e[44m\e[93m══════════\e[0m\e[0m\e[44m\e[93m═══════════\e[0m\e[0m\e[44m\e[93m╗\e[0m\e[0m",
      "\e[2;1H\e[44m\e[93m║\e[0m\e[0m\e[44m\e[93mMidnight Commander          \e[0m\e[0m\e[2;30H\e[44m\e[93m║\e[0m\e[0m",
      "\e[3;1H\e[44m\e[93m║\e[0m\e[0m\e[44m\e[93mis the best                 \e[0m\e[0m\e[3;30H\e[44m\e[93m║\e[0m\e[0m",
      "\e[4;1H\e[44m\e[93m╚\e[0m\e[0m\e[44m\e[93m══════════════\e[0m\e[0m\e[44m\e[93m══════════════\e[0m\e[0m\e[44m\e[93m╝\e[0m\e[0m"
    ].join)
  end

  it "creates box without corners and only color fill" do
    box = TTY::Box.frame(
      width: 10, height: 4,
      border: {
        top_left: false,
        top_right: false,
        bottom_left: false,
        bottom_right: false,
      },
      style: {
        fg: :bright_yellow,
        bg: :blue,
      }
    )

    expect(box).to eq([
      "──────────\n",
      "│\e[44m\e[93m        \e[0m\e[0m│\n",
      "│\e[44m\e[93m        \e[0m\e[0m│\n",
      "──────────\n"
    ].join)
  end

  it "creates box without left & right borders and only color fill" do
    box = TTY::Box.frame(
      width: 10, height: 4,
      border: {
        left: false,
        right: false
      },
      style: {
        fg: :bright_yellow,
        bg: :blue,
      }
    )

    expect(box).to eq([
      "──────────\n",
      "\e[44m\e[93m          \e[0m\e[0m\n",
      "\e[44m\e[93m          \e[0m\e[0m\n",
      "──────────\n"
    ].join)
  end

  it "creates box without top & bottom borders and only color fill" do
    box = TTY::Box.frame(
      width: 10, height: 4,
      border: {
        top: false,
        bottom: false
      },
      style: {
        fg: :bright_yellow,
        bg: :blue,
      }
    )

    expect(box).to eq([
      "│\e[44m\e[93m        \e[0m\e[0m│\n",
      "│\e[44m\e[93m        \e[0m\e[0m│\n",
      "│\e[44m\e[93m        \e[0m\e[0m│\n",
      "│\e[44m\e[93m        \e[0m\e[0m│\n",
    ].join)
  end

  it "creates box without top & left borders and only color fill" do
    box = TTY::Box.frame(
      width: 10, height: 4,
      border: {
        top: false,
        left: false
      },
      style: {
        fg: :bright_yellow,
        bg: :blue,
        border: {
          fg: :bright_yellow,
          bg: :blue
        }
      }
    )

    expect(box).to eq([
      "\e[44m\e[93m         \e[0m\e[0m\e[44m\e[93m│\e[0m\e[0m\n",
      "\e[44m\e[93m         \e[0m\e[0m\e[44m\e[93m│\e[0m\e[0m\n",
      "\e[44m\e[93m         \e[0m\e[0m\e[44m\e[93m│\e[0m\e[0m\n",
      "\e[44m\e[93m────\e[0m\e[0m\e[44m\e[93m─────\e[0m\e[0m\e[44m\e[93m┘\e[0m\e[0m\n"
    ].join)
  end
end
