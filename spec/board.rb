require "byebug"
require_relative "../lib/board.rb"
require_relative "../lib/cell.rb"

RSpec.describe "Cell" do
  let(:board) { Board.new(2, 2) }
  let(:matrix) { [[Cell.new, Cell.new(true)], [Cell.new(true), Cell.new()]] }

  it "print . ■ ■ . two cell is alive" do
    expect do
      board.draw(matrix)
    end.to output(". ■ \n■ . \n").to_stdout
  end
end
