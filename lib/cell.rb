class Cell
  attr_accessor :state

  def initialize(state = false)
    @state = state
  end

  def change_state
    @state = !@state
  end
end
