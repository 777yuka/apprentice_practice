# frozen_string_literal: true

# カードの束のクラス
class Deck
  attr_accessor :cards # 空の配列にカードが追加されていくので、アクセサー

  # インスタンス初期値（カードの束を入れる空の配列を用意）
  def initialize
    @cards = []
  end

  # カードの束を、カードクラスのインスタンスを使って作成するメソッド
  def create
    suits = %w[ハート ダイヤ スペード クラブ]
    numbers = %w[A 2 3 4 5 6 7 8 9 10 Jack Queen King]

    suits.each do |suit|
      numbers.each do |number|
        card = Card.new(suit, number) # カードクラスのインスタンスを作成
        @cards << card # カードクラスのインスタンスを、配列に入れていく
      end
    end
    @cards.shuffle! # 配列内をシャッフルする
    # p @cards
  end

  # シャッフルされたカードの束（配列）から最初の1枚を抜き出すメソッド
  def draw
    @cards.shift
  end
end
