# frozen_string_literal: true

require_relative 'deck'

class Player
  attr_accessor :name, :deal

  def initialize(name, draw_card)
    @name = name
    @deal = []
    hand(draw_card)
  end

  def hand(draw_card)
    @deal += draw_card
  end
end
