# frozen_string_literal: true

require_relative "board"

class Robot
  attr_reader :position, :board

  def initialize
    instructions

    @board = Board.new.board
    @position = nil
  end

  def instructions
    puts "Please use the command PLACE X,Y,DIRECTION to start"
    puts "Use MOVE, LEFT and RIGHT to move the robot around."
    puts "Type REPORT to show current position and direction."
  end
end
