# frozen_string_literal: true

require_relative "../lib/robot"

RSpec.describe Robot do
  subject { Robot.new }

  it "works" do
    expect {
      subject
    }.to output(
      <<~INSTRUCTIONS
        Please use the command PLACE X,Y,DIRECTION to start
        Use MOVE, LEFT and RIGHT to move the robot around.
        Type REPORT to show current position and direction.
      INSTRUCTIONS
    ).to_stdout
  end

  it "intializes with position nil" do
    expect(subject.position).to be nil
  end

  it "intializes with empty board" do
    expect(subject.board).to eq Board.new.board
  end
end
