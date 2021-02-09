# frozen_string_literal: true

require 'matrix'
require_relative 'cell'
require_relative 'board'

# GameOfLife contains the rules and all logic of the game
class GameOfLife
  attr_reader :rows, :cols

  def initialize(width, height)
    @rows = height
    @cols = width
    @board = Board.new(width, height)
    @matrix_cells = Matrix.build(height, width) { Cell.new(rand(0..1) == 1) }
  end

  def evaluate(matrix)
    matrix_cells_next = Matrix.build(@rows, @cols) { Cell.new }
    (0...@rows).each do |row|
      (0...@cols).each do |col|
        matrix_cells_next[row, col].state = evaluate_life(matrix[row, col], count_neighbors(matrix, row, col))
      end
    end
    matrix_cells_next
  end

  def evaluate_life(cell, neighbors)
    # Birth
    return true if cell.dead? && neighbors == 3
    # Die
    return false if cell.alive? && neighbors < 2 || neighbors > 3

    # Survive
    cell.state
  end

  def count_neighbors(matrix, row, col)
    sum = 0
    (-1..1).each do |row_iterator|
      (-1..1).each do |col_iterator|
        sum += matrix[(row + row_iterator + @rows) % @rows, (col + col_iterator + @cols) % @cols].state ? 1 : 0
      end
    end
    sum -= (matrix[row, col].state ? 1 : 0)
  end

  def play
    loop do
      sleep(0.5)
      @matrix_cells = evaluate(@matrix_cells)
      @board.draw(@matrix_cells)
    end
  end
end

# game = GameOfLife.new(40, 60)
# game.play
