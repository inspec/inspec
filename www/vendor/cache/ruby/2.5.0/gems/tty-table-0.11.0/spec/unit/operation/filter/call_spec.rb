# frozen_string_literal: true

RSpec.describe TTY::Table::Operation::Filter, '#call' do
  let(:object) { described_class }
  let(:field)  { TTY::Table::Field.new('a1') }
  let(:filter) { Proc.new { |val, row, col| 'new' } }
  let(:value)  { 'new' }

  subject(:operation) { object.new(filter) }

  it 'changes field value' do
    expect(operation.call(field, 0, 0)).to eql(value)
  end
end
