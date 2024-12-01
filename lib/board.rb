# frozen_string_literal: true

class Board
  WIDTH = 5
  HEIGHT = 5

  def initialize
  end

  def valid_position?(x_position, y_position)
    return true if x_position < WIDTH && y_position < HEIGHT

    false
  end
end
