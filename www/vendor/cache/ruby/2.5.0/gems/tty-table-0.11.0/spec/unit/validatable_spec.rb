# frozen_string_literal: true

RSpec.describe TTY::Table::Validatable do
  let(:described_class) { Class.new { include TTY::Table::Validatable } }
  let(:rows) { [['a1', 'a2'], ['b1']] }

  subject { described_class.new }

  it 'raises no exception' do
    rows[1] << ['b2']
    expect { subject.assert_row_sizes(rows) }.not_to raise_error
  end

  it 'raises exception for mismatched rows' do
    expect { subject.assert_row_sizes(rows) }.
      to raise_error(TTY::Table::DimensionMismatchError)
  end

  it "raises exception when :header key has wrong data type" do
    options = {header: 'h1'}
    expect { subject.validate_options!(options) }.
      to raise_error(TTY::Table::InvalidArgument)
  end

  it "raises exception when :rows key has wrong data type" do
    options = {rows: 'a1'}
    expect { subject.validate_options!(options) }.
      to raise_error(TTY::Table::InvalidArgument)
  end
end
