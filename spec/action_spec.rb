# frozen_string_literal: true

require_relative "../lib/action"
require_relative "../lib/board"

RSpec.describe Action do
  subject { Action.new(Robot.new, Board.new) }

  it "intializes with empty board" do
    expect(subject.board.board_as_array).to eq Board.new.board_as_array
  end

  it "prints instructions" do
    expect {
      subject.instructions
    }.to output(
      <<~INSTRUCTIONS
        Please use the command PLACE X,Y,DIRECTION to start
        Use MOVE, LEFT and RIGHT to move the robot around.
        Type REPORT to show current position and direction.
      INSTRUCTIONS
    ).to_stdout
  end

  describe "#validate_instructions" do
    it "returns true for PLACE with options" do
      expect(subject.validate_command("PLACE 0,0,EAST")).to be true
    end

    it "returns false for PLACE with bad direction option" do
      expect(subject.validate_command("PLACE 0,0,NORTHISH")).to be false
    end

    it "returns false for PLACE with bad Y option" do
      expect(subject.validate_command("PLACE 0,-3,NORTHISH")).to be false
    end

    it "returns false for PLACE with bad direction option" do
      expect(subject.validate_command("PLACE -3,0,NORTHISH")).to be false
    end
  end

  describe "#process_command" do
    it "updates robot position when PLACE passed" do
      robot = instance_double("Robot")
      board = instance_double("Board")
      action = Action.new(robot, board)

      allow(board).to receive(:valid_position?).with(0, 0).and_return(true)
      allow(board).to receive(:update_board)

      expect(robot).to receive(:update_position).with(0, 0)

      action.process_command("PLACE 0,0,EAST")
    end

    it "updates board position when PLACE passed" do
      robot = instance_double("Robot")
      board = instance_double("Board")
      action = Action.new(robot, board)

      allow(board).to receive(:valid_position?).with(0, 0).and_return(true)
      allow(robot).to receive(:update_position)

      expect(board).to receive(:update_board).with(0, 0)

      action.process_command("PLACE 0,0,EAST")
    end
  end
end