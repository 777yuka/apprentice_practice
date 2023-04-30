# frozen_string_literal: true

require_relative 'card'

class Score
  def self.sum(hand)
    scores = 0
    hand.each do |card|
      scores += allotment(card, scores)
    end
    scores
  end

  def self.allotment(card, scores)
    card_value = card[1]
    card_value = 10 if %w[Jack Queen King].include?(card_value)
    card_value = 11 if card_value == 'A' && scores < 11
    card_value = 1 if card_value == 'A' && scores >= 11
    card_value.to_i
  end
end
