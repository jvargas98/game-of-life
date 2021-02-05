# frozen_string_literal: true

require 'matrix'
require 'prime'
require_relative 'cell'
require_relative 'board'

class GameOfLive
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
        cell = matrix[row, col]
        neighbors = count_neighbors(matrix, row, col)
        matrix_cells_next[row, col].state = eveluate_rules(cell, neighbors)
      end
    end
    matrix_cells_next
  end

  def eveluate_life(cell, neighbors)
    return true if !cell.is_alive? && neighbors == 3 # Birth
    return false if cell.is_alive? && neighbors < 2 || neighbors > 3 # Die

    cell.state # surive
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
      @matrix_cells = evaluate(@matrix_cells)
      @board.draw(@matrix_cells)
    end
  end
end

# game = GameOfLive.new(40, 60)
# game.play
