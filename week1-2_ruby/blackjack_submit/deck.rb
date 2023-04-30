# frozen_string_literal: true

require_relative 'card'

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank|
        Card.new(suit, rank)
        @cards << [suit, rank]
      end
    end
    @cards.shuffle!
  end

  def draw(num = 1)
    @cards.shift(num)
  end
end
