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

  describe "#validate_move" do
    let(:robot) { instance_double("Robot", position: { x_coordinate: 0, y_coordinate: 0, direction: WEST }) }

    it "returns false for MOVE WEST off board" do
      expect(subject.validate_move(0, 0, "WEST")).to be false
    end

    it "returns false for MOVE SOUTH off board" do
      expect(subject.validate_move(0, 0, "SOUTH")).to be false
    end

    it "returns false for MOVE EAST off board" do
      expect(subject.validate_move(4, 0, "EAST")).to be false
    end

    it "returns false for MOVE NORTH off board" do
      expect(subject.validate_move(0, 4, "NORTH")).to be false
    end
  end

  describe "#process_command" do
    let(:robot) { instance_double("Robot") }
    let(:board) { instance_double("Board") }
    let(:subject) { Action.new(robot, board) }

    it "updates robot position when PLACE passed" do
      allow(board).to receive(:valid_position?).with(0, 0).and_return(true)
      allow(board).to receive(:update_board)

      expect(robot).to receive(:update_position).with(0, 0, "EAST")

      subject.process_command("PLACE 0,0,EAST")
    end

    it "updates board position when PLACE passed" do
      allow(board).to receive(:valid_position?).with(0, 0).and_return(true)
      allow(robot).to receive(:update_position)

      expect(board).to receive(:update_board).with(0, 0)

      subject.process_command("PLACE 0,0,EAST")
    end

    context "when LEFT passed" do
      it "calls left on robot" do
        expect(robot).to receive(:left)

        subject.process_command("LEFT")
      end
    end

    context "when RIGHT passed" do
      it "calls right on robot" do
        expect(robot).to receive(:right)

        subject.process_command("RIGHT")
      end
    end

    context "when MOVE passed" do
      it "calls move on robot" do
        allow(board).to receive(:update_board)
        allow(robot).to receive(:update_position)
        allow(board).to receive(:valid_position?).and_return(true)
        allow(robot).to receive_message_chain(:position, :x_coordinate).and_return(0)
        allow(robot).to receive_message_chain(:position, :y_coordinate).and_return(0)
        allow(robot).to receive_message_chain(:position, :direction).and_return("NORTH")
        expect(robot).to receive(:move)

        subject.process_command("MOVE")
      end
    end

    context "when REPORT passed" do
      it "calls report on robot" do
        expect(robot).to receive(:report)

        subject.process_command("REPORT")
      end
    end
  end
end
