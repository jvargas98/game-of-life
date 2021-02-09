# frozen_string_literal: true

# Save the state of the cell
# true is a living cell
class Cell
  attr_accessor :state

  def initialize(state = false)
    @state = state
  end

  def alive?
    @state == true
  end

  def dead?
    @state == false
  end

  def to_s
    @state ? '■ ' : '. '
  end
end
