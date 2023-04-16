require_relative 'deck'

class Player

  attr_accessor :name, :card, :score

  def initialize(name:, card:, score:)
    @name = name
    @card = card
    @score = score
  end

end

# 確認用
# player1 = Player.new(name: "player1", card: [], score: 0)
# p player1.


