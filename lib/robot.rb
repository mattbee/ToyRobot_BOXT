# frozen_string_literal: true

require_relative "position"

class Robot
  attr_accessor :position

  def initialize
    @position = nil
  end

  def update_position(x_coordinate, y_coordinate, direction)
    @position ||= Position.new(x_coordinate, y_coordinate, direction)

    @position.x_coordinate = x_coordinate
    @position.y_coordinate = y_coordinate
    @position.direction = direction
  end
end
