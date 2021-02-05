# frozen_string_literal: true

require 'matrix'
require_relative '../lib/board'
require_relative '../lib/cell'

RSpec.describe 'Board' do
  let(:board) { Board.new(2, 2) }
  let(:matrix) { Matrix.build(2, 2) { Cell.new } }

  it 'print . ■ ■ . two cells alive' do
    matrix[0, 1].state = true
    matrix[1, 0].state = true
    expect do
      board.draw(matrix)
    end.to output(". ■ \n■ . \n").to_stdout
  end
end
