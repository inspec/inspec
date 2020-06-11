# frozen_string_literal: true

RSpec.describe TTY::Table, 'unicode support' do
  it "measures utf characters correctly for :basic" do
    table = TTY::Table[['こんにちは', 'a2'], ['b1','選択']]
    expect(table.render(:basic)).to eq unindent(<<-EOS)
      こんにちは a2  
      b1         選択
    EOS
  end

  it "measure utf characters correctly for :ascii" do
    table = TTY::Table[['こんにちは', 'a2'], ['b1','選択']]
    expect(table.render(:ascii)).to eq unindent(<<-EOS)
     +----------+----+
     |こんにちは|a2  |
     |b1        |選択|
     +----------+----+
    EOS
  end

  it "measure utf characters correctly for :unicode" do
    table = TTY::Table[['こんにちは', 'a2'], ['b1','選択']]
    expect(table.render(:unicode)).to eq unindent(<<-EOS)
     ┌──────────┬────┐
     │こんにちは│a2  │
     │b1        │選択│
     └──────────┴────┘
    EOS
  end
end
