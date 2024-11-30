# frozen_string_literal: true

class Board
  WIDTH = 5
  HEIGHT = 5

  attr_reader :board

  def initialize
    row = Array.new(WIDTH, "▢")
    @board = Array.new(HEIGHT) { row.clone }
  end

  def valid_position?(x_position, y_position)
    return true if x_position < WIDTH && y_position < HEIGHT

    false
  end
end
