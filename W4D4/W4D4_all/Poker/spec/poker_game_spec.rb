require "poker_game"

RSpec.describe "Poker_Game" do
  
  subject(:poker_game) {Poker_Game.new}
  let(:player) {double("player")}
  let(:card) {double("card")}

  describe "#initialize" do

    it "sets 5 cards to each player instance" do
      expect (poker_game.hand).to eq(Array.new(5, :card))
    end

    it "sets player to player instance" do
      expect (poker_game.player).to eq(:player)
    end
  end

  
end