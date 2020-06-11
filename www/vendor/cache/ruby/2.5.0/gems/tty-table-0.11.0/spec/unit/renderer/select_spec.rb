# frozen_string_literal: true

RSpec.describe TTY::Table::Renderer, '#select' do
  let(:klass)    { ::Class.new }
  let(:instance) { described_class }

  subject { instance.select(renderer) }

  context 'with basic' do
    let(:renderer) { :basic }

    it { is_expected.to be(TTY::Table::Renderer::Basic) }
  end

  context 'with unicode' do
    let(:renderer) { :unicode }

    it { is_expected.to be(TTY::Table::Renderer::Unicode) }
  end
end
