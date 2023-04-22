# frozen_string_literal: true

require_relative 'card'

# スコアの合計を算出するクラス
class Score
  # スコアの合計を算出するクラスメソッド（引数にはプレーヤーの手札の配列が入る）
  def self.sum(hand)
    scores = 0
    hand.each do |card| # 手札の配列の要素を一つずつ取り出していく
      # カードのナンバーごとに、得点を分ける
      scores += allotment(card, scores)
    end
    scores
  end

  # 各ナンバーに配点するメソッド
  def self.allotment(card, scores)
    card_value = card[1]
    card_value = 10 if %w[Jack Queen King].include?(card_value)
    card_value = 11 if card_value == 'A' && scores < 11
    card_value = 1 if card_value == 'A' && scores >= 11
    card_value.to_i
  end
end

# score = Score.new
# hand = [ ["クラブ", "4"],["ハート", "Queen"],["スペード", "A"] ]
# p score.sum(hand)
