# frozen_string_literal: true

require_relative "lib/robot"
require_relative "lib/board"
require_relative "lib/action"

action = Action.new(Robot.new, Board.new)
action.instructions

loop do
  command = gets.chomp

  next unless action.validate_command(command)

  action.process_command(command)
end
