# frozen_string_literal: true

class Position
  attr_accessor :x_coordinate, :y_coordinate, :direction

  def initialize(x_coordinate, y_coordinate, direction)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @direction = direction
  end
end
