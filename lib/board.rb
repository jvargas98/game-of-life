# frozen_string_literal: true

# Draw the matrix with all the cells
class Board
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def draw(matrix_cells)
    (0...@height).each do |row|
      (0...@width).each do |col|
        print matrix_cells[row, col]
      end
      puts
    end
  end
end
