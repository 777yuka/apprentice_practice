# frozen_string_literal: true

require_relative 'deck'

# プレーヤーのクラス
class Player
  attr_accessor :name, :deal # 空の配列にカードが追加されていくので、アクセサー

  # インスタンス初期値
  def initialize(name, draw_card)
    @name = name
    @deal = [] # 引いたカードを溜める（手札の）空の配列を用意
    hand(draw_card)
  end

  # 引いたカードを貯めていくメソッド（引数にDeckクラスのインスタンス.drawが入る想定）
  def hand(draw_card)
    @deal += draw_card
  end
end
