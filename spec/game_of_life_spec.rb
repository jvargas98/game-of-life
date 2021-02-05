# frozen_string_literal: true

require_relative '../lib/game_of_life'
require_relative '../lib/cell'

RSpec.describe 'Game of life' do
  let(:game_of_life) { GameOfLive.new(3, 3) }
  let(:cell) { Cell.new }
  let(:matrix) { Matrix.build(3, 3) { Cell.new } }

  it 'a cell has 3 live neighbors' do
    matrix[0, 0].state = true
    matrix[1, 0].state = true
    matrix[2, 0].state = true
    expect(game_of_life.count_neighbors(matrix, 1, 1)).to eq 3
  end

  it 'a dead cell with 3 neighbors born in the next generation' do
    neighbors = 3
    expect(game_of_life.eveluate_rules(cell.state, neighbors)).to be true
  end

  it 'a living cell with 1 neighbor or less die in the next generation' do
    neighbors = 1
    cell.state = true
    expect(game_of_life.eveluate_rules(cell.state, neighbors)).to be false
  end

  it 'a living cell with 4 or more neighbors die in the next generation' do
    neighbors = 4
    cell.state = true
    expect(game_of_life.eveluate_rules(cell.state, neighbors)).to be false
  end

  it 'a living cell with 2 neighbors remain alive in the next generation' do
    neighbors = 2
    cell.state = true
    expect(game_of_life.eveluate_rules(cell.state, neighbors)).to be true
  end

  it 'a living cell with 2 neighbors remain alive in the next generation' do
    neighbors = 3
    cell.state = true
    expect(game_of_life.eveluate_rules(cell.state, neighbors)).to be true
  end
end
