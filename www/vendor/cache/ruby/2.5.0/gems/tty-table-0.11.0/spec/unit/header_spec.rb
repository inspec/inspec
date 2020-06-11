# frozen_string_literal: true

RSpec.describe TTY::Table, '#header' do
  let(:header) { [:header1, :header2] }
  let(:rows)   { [['a1', 'a2'], ['b1', 'b2']] }
  let(:object) { described_class }

  subject(:table) { object.new header, rows }

  it { expect(table.header).to be_instance_of(TTY::Table::Header) }
end
