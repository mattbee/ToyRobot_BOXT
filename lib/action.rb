# frozen_string_literal: true

require_relative "board"
require_relative "robot"

class Action
  attr_reader :robot, :board

  PLACE_COMMAND = /^PLACE\s+\d+\s*,\s*\d+\s*,\s*(WEST||NORTH||EAST||SOUTH)$/.freeze
  COMMANDS = %w[MOVE LEFT RIGHT REPORT].freeze

  def initialize(robot, board)
    @robot = robot
    @board = board
  end

  def validate_command(command)
    return true if command.match(PLACE_COMMAND) || COMMANDS.include?(command)

    false
  end

  def process_command(command)
    if command.start_with?("PLACE")
      place_command = command.split
      coords = place_command[1].split(",")

      return unless board.valid_position?(coords[0].to_i, coords[1].to_i)

      update_robot_and_board(*coords)
    elsif command == "MOVE"
      return unless validate_move(
        robot.position.x_coordinate,
        robot.position.y_coordinate,
        robot.position.direction
      )

      update_board_for_move
      robot.public_send(command.downcase)
    else
      robot.public_send(command.downcase)
    end

    print_board_for_report(command)
  end

  def instructions
    puts "Please use the command PLACE X,Y,DIRECTION to start"
    puts "Use MOVE, LEFT and RIGHT to move the robot around."
    puts "Type REPORT to show current position and direction."
  end

  def validate_move(current_x, current_y, direction)
    new_x, new_y = calculate_new_robot_position(current_x, current_y, direction)

    board.valid_position?(new_x, new_y)
  end

  private

  def print_board_for_report(command)
    pp board.board_as_array if command == "REPORT"
  end

  def update_robot_and_board(x_position, y_position, direction)
    robot.update_position(x_position.to_i, y_position.to_i, direction)
    board.update_board(x_position.to_i, y_position.to_i)
  end

  def update_board_for_move
    new_board_location = calculate_new_robot_position(robot.position.x_coordinate,
                                                      robot.position.y_coordinate,
                                                      robot.position.direction)
    board.update_board(*new_board_location)
  end

  def calculate_new_robot_position(current_x, current_y, direction)
    new_x = current_x
    new_y = current_y

    case direction
    when "NORTH" then new_y = current_y + 1
    when "EAST" then new_x = current_x + 1
    when "SOUTH" then new_y = current_y - 1
    when "WEST" then new_x = current_x - 1
    end

    [new_x, new_y]
  end
end
