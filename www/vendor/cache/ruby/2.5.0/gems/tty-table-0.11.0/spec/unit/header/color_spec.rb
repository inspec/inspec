# frozen_string_literal: true

RSpec.describe TTY::Table::Header, 'color' do

  context 'when default' do

  end

  context 'when ascii' do
    let(:renderer) { :ascii }
    let(:red)      { "\e[31m" }
    let(:clear)    { "\e[0m" }

    xit 'renders header background in color' do
    end
  end
end
