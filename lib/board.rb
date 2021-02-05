# frozen_string_literal: true

class Board
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def draw(matrix_cells)
    (0...@height).each do |i|
      (0...@width).each do |j|
        print matrix_cells[i, j]
      end
      puts
    end
  end
end
