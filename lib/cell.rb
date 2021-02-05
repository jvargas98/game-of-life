class Cell
  attr_accessor :state

  def initialize(state = false)
    @state = state
  end

  def change_state
    @state = !@state
  end

  def to_s
    @state ? "■ " : ". "
  end
end
