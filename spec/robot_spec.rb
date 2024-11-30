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
        subject.update_position(0, 0)
        expect(subject.position.x_coordinate).to eq(0)
        expect(subject.position.y_coordinate).to eq(0)
      end

      it "updates position for different coordinates" do
        subject.update_position(3, 4)
        expect(subject.position.x_coordinate).to eq(3)
        expect(subject.position.y_coordinate).to eq(4)
      end
    end

    context "when position exists" do
      it "updates position for 0" do
        subject.position = Position.new(0, 1)

        subject.update_position(0, 0)
        expect(subject.position.x_coordinate).to eq(0)
        expect(subject.position.y_coordinate).to eq(0)
      end

      it "updates position for different coordinates" do
        subject.position = Position.new(0, 1)

        subject.update_position(3, 4)
        expect(subject.position.x_coordinate).to eq(3)
        expect(subject.position.y_coordinate).to eq(4)
      end
    end
  end
end
