require_relative "../lib/cell.rb"

RSpec.describe "Cell" do
  let(:cell_alive) { Cell.new(true) }
  let(:cell_deth) { Cell.new }

  it "is alive" do
    expect(cell_alive.state).to be true
  end

  it "is deth" do
    expect(cell_deth.state).to be false
  end

  it "dies" do
    expect(cell_alive.change_state).to be false
  end

  it "revive" do
    expect(cell_deth.change_state).to be true
  end
end