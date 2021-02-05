# frozen_string_literal: true

require_relative '../lib/cell'

RSpec.describe 'Cell' do
  let(:cell_alive) { Cell.new(true) }
  let(:cell_deth) { Cell.new }

  it 'is alive' do
    expect(cell_alive.state).to be true
  end

  it 'is deth' do
    expect(cell_deth.state).to be false
  end

  it 'dies' do
    expect(cell_alive.state = false).to be false
  end

  it 'revive' do
    expect(cell_deth.state = true).to be true
  end

  it 'return ■ if cell is alive' do
    expect(cell_alive.to_s).to eq '■ '
  end

  it 'return . if cell is alive' do
    expect(cell_deth.to_s).to eq '. '
  end
end
