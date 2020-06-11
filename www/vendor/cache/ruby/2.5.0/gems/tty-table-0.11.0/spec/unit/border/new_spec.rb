# frozen_string_literal: true

RSpec.describe TTY::Table::Border, '#new' do
  let(:row) { [] }

  subject(:instance) { klass.new row, [0,0,0,0] }

  context 'when abstract' do
    let(:klass) { described_class }

    it { expect { instance }.to raise_error(NotImplementedError) }
  end

  context 'when concrete' do
    let(:klass) {
      Class.new do
        def initialize(row, padding); end
      end
    }

    it { expect { instance }.to_not raise_error() }

    it { is_expected.to be_instance_of klass }
  end
end
