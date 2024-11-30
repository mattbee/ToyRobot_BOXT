# frozen_string_literal: true

require_relative "../lib/robot"

RSpec.describe Robot do
  subject { Robot.new }

  it "intializes with position nil" do
    expect(subject.position).to be nil
  end

  describe "#update_position" do
    context "when position doesn't exist" do
      it "updates position for 0" do
        subject.update_position(0, 0, "EAST")
        expect(subject.position.x_coordinate).to eq(0)
        expect(subject.position.y_coordinate).to eq(0)
        expect(subject.position.direction).to eq("EAST")
      end

      it "updates position for different coordinates" do
        subject.update_position(3, 4, "EAST")
        expect(subject.position.x_coordinate).to eq(3)
        expect(subject.position.y_coordinate).to eq(4)
        expect(subject.position.direction).to eq("EAST")
      end
    end

    context "when position exists" do
      it "updates position for 0" do
        subject.position = Position.new(0, 1, "NORTH")

        subject.update_position(0, 0, "EAST")
        expect(subject.position.x_coordinate).to eq(0)
        expect(subject.position.y_coordinate).to eq(0)
        expect(subject.position.direction).to eq("EAST")
      end

      it "updates position for different coordinates" do
        subject.position = Position.new(0, 1, "EAST")

        subject.update_position(3, 4, "NORTH")
        expect(subject.position.x_coordinate).to eq(3)
        expect(subject.position.y_coordinate).to eq(4)
        expect(subject.position.direction).to eq("NORTH")
      end
    end
  end

  describe "#left" do
    let(:robot) { Robot.new }

    it "turns from NORTH to WEST" do
      robot.update_position(3, 4, "NORTH")
      robot.left
      expect(robot.position.direction).to eq("WEST")
    end

    it "turns from WEST to SOUTH" do
      robot.update_position(3, 4, "WEST")
      robot.left
      expect(robot.position.direction).to eq("SOUTH")
    end

    it "turns from SOUTH to EAST" do
      robot.update_position(3, 4, "SOUTH")
      robot.left
      expect(robot.position.direction).to eq("EAST")
    end

    it "turns from EAST to NORTH" do
      robot.update_position(3, 4, "EAST")
      robot.left
      expect(robot.position.direction).to eq("NORTH")
    end
  end

  describe "#right" do
    let(:robot) { Robot.new }

    it "turns from NORTH to EAST" do
      robot.update_position(3, 4, "NORTH")
      robot.right
      expect(robot.position.direction).to eq("EAST")
    end

    it "turns from WEST to NORTH" do
      robot.update_position(3, 4, "WEST")
      robot.right
      expect(robot.position.direction).to eq("NORTH")
    end

    it "turns from SOUTH to WEST" do
      robot.update_position(3, 4, "SOUTH")
      robot.right
      expect(robot.position.direction).to eq("WEST")
    end

    it "turns from EAST to SOUTH" do
      robot.update_position(3, 4, "EAST")
      robot.right
      expect(robot.position.direction).to eq("SOUTH")
    end
  end
end
