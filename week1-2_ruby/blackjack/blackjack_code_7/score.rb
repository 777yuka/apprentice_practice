# frozen_string_literal: true

# スコアの合計を算出するクラス
class Score
  # スコアの合計を算出するクラスメソッド（引数にはPlayerクラスのインスタンス.dealが入る想定）
  def self.sum(hand)
    scores = 0
    hand.each do |card| # 手札の配列の要素を一つずつ取り出していく
      # カードのナンバーごとに、得点を分ける
      scores += card.allotment(scores)
    end
    scores
  end

  def self.select_ace_number(scores)
    if scores < 11 # 合計得点が11点未満の場合は11点を追加する
      11
    else # 合計得点が11点以上の場合は、11点を追加するとバーストするので1点を追加する
      1
    end
  end
end
