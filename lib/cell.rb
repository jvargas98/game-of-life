# frozen_string_literal: true

class Cell
  attr_accessor :state

  def initialize(state = false)
    @state = state
  end

  def is_alive?
    @state
  end

  def to_s
    @state ? '■ ' : '. '
  end
end
