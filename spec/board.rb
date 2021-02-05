require "byebug"
require "matrix"
require_relative "../lib/board.rb"
require_relative "../lib/cell.rb"

RSpec.describe "Cell" do
  let(:board) { Board.new(2, 2) }
  let(:matrix) { Matrix.build(2, 2) { Cell.new } }

  it "print . ■ ■ . two cell alive" do
    matrix[0, 1].state = true
    matrix[1, 0].state = true
    expect do
      board.draw(matrix)
    end.to output(". ■ \n■ . \n").to_stdout
  end
end
