class Board
  attr_reader :width, :height

  def initialize(width, height)
    @width = width
    @height = height
  end

  def draw(matrix_cells)
    for i in 0...@height
      for j in 0...@width
        print matrix_cells[i, j]
      end
      puts
    end
  end
end
