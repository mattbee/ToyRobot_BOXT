# frozen_string_literal: true

require_relative "../lib/board"

RSpec.describe Board do
  subject { Board.new }

  it "returns false if both params out of bounds" do
    expect(subject.valid_position?(Board::WIDTH + 1, Board::HEIGHT + 1)).to be false
  end

  it "returns false if x param out of bounds" do
    expect(subject.valid_position?(Board::WIDTH + 1, 0)).to be false
  end

  it "returns false if y param out of bounds" do
    expect(subject.valid_position?(0, Board::HEIGHT + 1)).to be false
  end

  it "provides an interpretation of the board through arrays" do
    expect(subject.board_as_array).to match(
      [
        ["▢", "▢", "▢", "▢", "▢"],
        ["▢", "▢", "▢", "▢", "▢"],
        ["▢", "▢", "▢", "▢", "▢"],
        ["▢", "▢", "▢", "▢", "▢"],
        ["▢", "▢", "▢", "▢", "▢"]
      ]
    )
  end

  describe "#update_position" do
    it "updates robot position on the board" do
      subject.update_board(2, 2)
      expect(subject.board_as_array).to match(
        [
          ["▢", "▢", "▢", "▢", "▢"],
          ["▢", "▢", "▢", "▢", "▢"],
          ["▢", "▢", "X", "▢", "▢"],
          ["▢", "▢", "▢", "▢", "▢"],
          ["▢", "▢", "▢", "▢", "▢"]
        ]
      )
    end
  end
end
