require_relative "two_card_hand"
require_relative "three_card_hand"

class Player
  attr_reader :cards, :name # cardsとnameインスタンス変数への読み取りアクセスを許可する

  def initialize(name, hand)
    @name = name # プレイヤー名を格納するためのインスタンス変数を初期化する
    @cards = []  # プレイヤーの手札として保持するカードを格納するための空の配列を用意する
    @hand = hand # 手札の種類を判定するためのHandオブジェクトを格納する
  end

  def deal(deck, number_cards = 1) # number_cards = 1はデフォルト値
    cards = deck.draw(number_cards) # deckからカードをnumber_cards枚引いてくる
    @hand.add_cards(cards) # 引いたカードを手札に加える
    @cards = cards.flatten # 引いたカードを配列から平らにした状態で@cardsに代入する
  end

  def hand
    @hand.judge # 手札の種類を判定して返す
  end
end
