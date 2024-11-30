# frozen_string_literal: true

require_relative "board"
require_relative "robot"

class Action
  attr_reader :robot, :board

  PLACE_COMMAND = /^PLACE\s+\d+\s*,\s*\d+\s*,\s*(WEST||NORTH||EAST||SOUTH)$/.freeze

  def initialize(robot, board)
    @robot = robot
    @board = board
  end

  def validate_command(command)
    return true if command.match(PLACE_COMMAND)

    false
  end

  def process_command(command)
    return unless command.start_with?("PLACE")

    place_command = command.split
    coords = place_command[1].split(",")

    return unless board.valid_position?(coords[0].to_i, coords[1].to_i)

    update_robot_and_board
  end

  def instructions
    puts "Please use the command PLACE X,Y,DIRECTION to start"
    puts "Use MOVE, LEFT and RIGHT to move the robot around."
    puts "Type REPORT to show current position and direction."
  end

  private

  def update_robot_and_board
    robot.update_position(coords[0].to_i, coords[1].to_i)
    board.update_board(coords[0].to_i, coords[1].to_i)
  end
end
