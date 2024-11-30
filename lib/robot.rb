# frozen_string_literal: true

require_relative "position"

class Robot
  attr_accessor :position

  def initialize
    @position = nil
  end

  def update_position(x_coordinate, y_coordinate)
    @position ||= Position.new(x_coordinate, y_coordinate)

    @position.x_coordinate = x_coordinate
    @position.y_coordinate = y_coordinate
  end
end
