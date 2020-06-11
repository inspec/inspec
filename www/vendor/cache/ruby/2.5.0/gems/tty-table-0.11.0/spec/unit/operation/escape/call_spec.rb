# frozen_string_literal: true

RSpec.describe TTY::Table::Operation::Escape, '#call' do
  let(:object) { described_class }
  let(:text)   { "太丸\nゴシ\tック体\r" }
  let(:field)  { TTY::Table::Field.new(text) }

  subject(:operation) { object.new }

  it 'changes field value' do
    expect(operation.call(field, 0, 0)).to eql("太丸\\nゴシ\\tック体\\r")
  end
end
