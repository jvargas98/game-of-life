# frozen_string_literal: true

require 'matrix'
require 'prime'
require_relative 'cell'
require_relative 'board'

class GameOfLive
  def initialize(width, height)
    @rows = height
    @cols = width
    @matrix_cells = Matrix.build(height, width) { Cell.new(rand(0..1) == 1) }
    @board = Board.new(width, height)
  end

  def evaluate_life(matrix)
    matrix_cells_next = Matrix.build(@rows, @cols) { Cell.new }
    (0...@rows).each do |row|
      (0...@cols).each do |col|
        state = matrix[row, col].state
        neighbors = count_neighbors(matrix, row, col)
        matrix_cells_next[row, col].state = eveluate_rules(state, neighbors)
      end
    end
    matrix_cells_next
  end

  def eveluate_rules(cell_state, neighbors)
    return true if !cell_state && neighbors == 3 # Birth
    return false if cell_state && neighbors < 2 || neighbors > 3 # Die

    cell_state # surive
  end

  def count_neighbors(matrix, row, col)
    sum = 0
    (-1..1).each do |i|
      (-1..1).each do |j|
        sum += matrix[(row + i + @rows) % @rows, (col + j + @cols) % @cols].state ? 1 : 0
      end
    end
    sum -= (matrix[row, col].state ? 1 : 0)
    sum
  end

  def play
    loop do
      sleep(0.5)
      @matrix_cells = evaluate_life(@matrix_cells)
      @board.draw(@matrix_cells)
    end
  end
end

# game = GameOfLive.new(40, 60)
# game.play
