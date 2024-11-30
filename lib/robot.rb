# frozen_string_literal: true

require_relative "position"

class Robot
  attr_accessor :position

  LEFT_TURNS = %w[NORTH WEST SOUTH EAST].freeze
  RIGHT_TURNS = LEFT_TURNS.reverse

  def initialize
    @position = nil
  end

  def update_position(x_coordinate, y_coordinate, direction)
    @position ||= Position.new(x_coordinate, y_coordinate, direction)

    @position.x_coordinate = x_coordinate
    @position.y_coordinate = y_coordinate
    @position.direction = direction
  end

  def left
    @position.direction = get_next_direction(left_turns_cycle_enum, @position.direction)
  end

  def right
    @position.direction = get_next_direction(right_turns_cycle_enum, @position.direction)
  end

  private

  def left_turns_cycle_enum
    LEFT_TURNS.cycle
  end

  def right_turns_cycle_enum
    RIGHT_TURNS.cycle
  end

  def get_next_direction(enum, current_direction)
    until enum.next == current_direction
    end
    enum.next
  end
end
