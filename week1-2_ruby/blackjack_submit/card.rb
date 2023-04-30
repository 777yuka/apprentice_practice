# frozen_string_literal: true

class Card
  attr_reader :suit, :rank

  SUITS = %w[ハート ダイヤ スペード クラブ].freeze
  RANKS = %w[A 2 3 4 5 6 7 8 9 10 Jack Queen King].freeze

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def show
    "#{@suit}の#{@rank}"
  end
end
