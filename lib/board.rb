# frozen_string_literal: true

class Board
  WIDTH = 5
  HEIGHT = 5

  attr_reader :board_as_array

  def initialize
    row = Array.new(WIDTH, "▢")
    @board_as_array = Array.new(HEIGHT) { row.clone }
  end

  def valid_position?(x_position, y_position)
    return false if x_position.negative? || y_position.negative?

    return true if x_position < WIDTH && y_position < HEIGHT

    false
  end

  def update_board(x_position, y_position)
    # Clear board first
    row = Array.new(WIDTH, "▢")
    @board_as_array = Array.new(HEIGHT) { row.clone }

    # Y comes first in the array visualisation and must be inversed as
    # the bottom left is position 0,0
    @board_as_array[inverse_y_coordinate(y_position.to_i)][x_position.to_i] = "X"
  end

  private

  def inverse_y_coordinate(y_position)
    # HEIGHT is not 0 indexed so need to remove 1 in y coordinate
    (HEIGHT - y_position) - 1
  end
end
