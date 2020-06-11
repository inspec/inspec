# frozen_string_literal: true

RSpec.describe TTY::Table::Validatable, '#validate_options!' do
  let(:described_class) { Class.new { include TTY::Table::Validatable } }

  subject { described_class.new.validate_options! options }

  context 'with empty rows' do
    let(:options) { {rows: []} }

    it { expect { subject }.not_to raise_error() }
  end

  context 'with invalid rows type' do
    let(:options) { {rows: 1 } }

    it { expect { subject }.to raise_error(TTY::Table::InvalidArgument) }
  end

  context 'with empty header' do
    let(:options) { {header: []} }

    it { expect { subject }.to raise_error(TTY::Table::InvalidArgument) }
  end

  context 'with invalid header type' do
    let(:options) { {header: 1} }

    it { expect { subject }.to raise_error(TTY::Table::InvalidArgument) }
  end
end
