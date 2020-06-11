# frozen_string_literal: true

RSpec.describe TTY::Table::Header, '#new' do
  it "is empty without arguments" do
    header = TTY::Table::Header.new
    expect(header).to be_empty
  end

  it "isn't empty with attributes" do
    header = TTY::Table::Header.new [:id, :name, :age]
    expect(header.to_a).to eq([:id, :name, :age])
  end
end
