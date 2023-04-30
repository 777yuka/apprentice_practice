# frozen_string_literal: true

require_relative 'card'

# カードの束のクラス
class Deck
  attr_accessor :cards # 空の配列にカードが追加されていくので、アクセサー

  # インスタンス初期値（カードの束を入れる空の配列を用意）
  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank|
        Card.new(suit, rank) # カードクラスのインスタンスを作成
        @cards << [suit, rank] # カードクラスのインスタンスを、配列に入れていく
      end
    end
    @cards.shuffle! # 配列内をシャッフルする
  end

  # シャッフルされたカードの束（配列）から抜き出すメソッド
  def draw(num = 1)
    @cards.shift(num)
  end
end
