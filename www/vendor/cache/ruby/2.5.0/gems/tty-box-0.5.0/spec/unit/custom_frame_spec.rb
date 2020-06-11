# frozen_string_literal: true

RSpec.describe TTY::Box, "custom frames" do
  it "draws info type message" do
    box = TTY::Box.info("Hello world!")

    expect(box).to eq([
      "\e[104m\e[30m╔\e[0m\e[0m\e[104m\e[30m ℹ INFO \e[0m\e[0m\e[104m\e[30m═══\e[0m\e[0m\e[104m\e[30m═══\e[0m\e[0m\e[104m\e[30m╗\e[0m\e[0m\n",
      "\e[104m\e[30m║\e[0m\e[0m\e[104m\e[30m              \e[0m\e[0m\e[104m\e[30m║\e[0m\e[0m\n",
      "\e[104m\e[30m║\e[0m\e[0m\e[104m\e[30m Hello world! \e[0m\e[0m\e[104m\e[30m║\e[0m\e[0m\n",
      "\e[104m\e[30m║\e[0m\e[0m\e[104m\e[30m              \e[0m\e[0m\e[104m\e[30m║\e[0m\e[0m\n",
      "\e[104m\e[30m╚\e[0m\e[0m\e[104m\e[30m═══════\e[0m\e[0m\e[104m\e[30m═══════\e[0m\e[0m\e[104m\e[30m╝\e[0m\e[0m\n"
    ].join)
  end

  it "draws warning type message" do
    box = TTY::Box.warn("Hello world!")

    expect(box).to eq([
      "\e[103m\e[30m╔\e[0m\e[0m\e[103m\e[30m ⚠ WARNING \e[0m\e[0m\e[103m\e[30m═\e[0m\e[0m\e[103m\e[30m══\e[0m\e[0m\e[103m\e[30m╗\e[0m\e[0m\n",
      "\e[103m\e[30m║\e[0m\e[0m\e[103m\e[30m              \e[0m\e[0m\e[103m\e[30m║\e[0m\e[0m\n",
      "\e[103m\e[30m║\e[0m\e[0m\e[103m\e[30m Hello world! \e[0m\e[0m\e[103m\e[30m║\e[0m\e[0m\n",
      "\e[103m\e[30m║\e[0m\e[0m\e[103m\e[30m              \e[0m\e[0m\e[103m\e[30m║\e[0m\e[0m\n",
      "\e[103m\e[30m╚\e[0m\e[0m\e[103m\e[30m═══════\e[0m\e[0m\e[103m\e[30m═══════\e[0m\e[0m\e[103m\e[30m╝\e[0m\e[0m\n"
    ].join)
  end

  it "draws success type message" do
    box = TTY::Box.success("Hello world!")

    expect(box).to eq([
      "\e[102m\e[30m╔\e[0m\e[0m\e[102m\e[30m ✔ OK \e[0m\e[0m\e[102m\e[30m════\e[0m\e[0m\e[102m\e[30m════\e[0m\e[0m\e[102m\e[30m╗\e[0m\e[0m\n",
      "\e[102m\e[30m║\e[0m\e[0m\e[102m\e[30m              \e[0m\e[0m\e[102m\e[30m║\e[0m\e[0m\n",
      "\e[102m\e[30m║\e[0m\e[0m\e[102m\e[30m Hello world! \e[0m\e[0m\e[102m\e[30m║\e[0m\e[0m\n",
      "\e[102m\e[30m║\e[0m\e[0m\e[102m\e[30m              \e[0m\e[0m\e[102m\e[30m║\e[0m\e[0m\n",
      "\e[102m\e[30m╚\e[0m\e[0m\e[102m\e[30m═══════\e[0m\e[0m\e[102m\e[30m═══════\e[0m\e[0m\e[102m\e[30m╝\e[0m\e[0m\n"
    ].join)
  end

  it "draws error type message" do
    box = TTY::Box.error("Hello world!")

    expect(box).to eq([
      "\e[41m\e[97m╔\e[0m\e[0m\e[41m\e[97m ⨯ ERROR \e[0m\e[0m\e[41m\e[97m══\e[0m\e[0m\e[41m\e[97m═══\e[0m\e[0m\e[41m\e[97m╗\e[0m\e[0m\n",
      "\e[41m\e[97m║\e[0m\e[0m\e[41m\e[97m              \e[0m\e[0m\e[41m\e[97m║\e[0m\e[0m\n",
      "\e[41m\e[97m║\e[0m\e[0m\e[41m\e[97m Hello world! \e[0m\e[0m\e[41m\e[97m║\e[0m\e[0m\n",
      "\e[41m\e[97m║\e[0m\e[0m\e[41m\e[97m              \e[0m\e[0m\e[41m\e[97m║\e[0m\e[0m\n",
      "\e[41m\e[97m╚\e[0m\e[0m\e[41m\e[97m═══════\e[0m\e[0m\e[41m\e[97m═══════\e[0m\e[0m\e[41m\e[97m╝\e[0m\e[0m\n"
    ].join)
  end
end
