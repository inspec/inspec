# frozen_string_literal: true

RSpec.describe TTY::Table::Operations, '#new' do
  let(:object) { described_class }
  let(:row)    { [1,2,3] }
  let(:table)  { TTY::Table.new :rows => [row] }
  let(:callable) {
    Class.new do
      def call(val, row, col)
        val.value= val.value + 1
      end
    end
  }
  let(:instance) { callable.new }

  subject { object.new }

  before { subject.add(:alignment, instance) }

  it 'stores away operations' do
    expect(subject[:alignment]).to include(instance)
  end

  it 'applies selected operations' do
    subject.apply_to(table, :alignment)
    expect(table.data[0]).to eql([2,3,4])
  end
end
