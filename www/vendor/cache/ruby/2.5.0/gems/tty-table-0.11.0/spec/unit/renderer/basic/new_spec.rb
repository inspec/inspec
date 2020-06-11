# frozen_string_literal: true

RSpec.describe TTY::Table::Renderer::Basic, '.new' do
  let(:header) { ['h1'] }
  let(:rows)   { [['a1']] }

  subject(:renderer) { described_class }

  context 'without table' do
    let(:table) { nil }

    it {
      expect {
        renderer.new(table)
      }.to raise_error(TTY::Table::ArgumentRequired)
    }
  end

  context 'with table' do
    let(:table)  { TTY::Table.new(header, rows) }

    it { expect { renderer.new(table) }.not_to raise_error }
  end
end
