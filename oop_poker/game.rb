require_relative "deck"
require_relative "player"
require_relative "two_card_hand"
require_relative "three_card_hand"

class Game
  def initialize(number_cards)
    @number_cards = number_cards # ゲームの開始時に引くカードの枚数をインスタンス変数に格納する
    @deck = Deck.new # ゲームに必要なデッキを用意する
    @user = Player.new("あなた", hand(number_cards)) # プレイヤー（あなた）を生成する
    @dealer = Player.new("ディーラー", hand(number_cards)) # プレイヤー（ディーラー）を生成する
  end

  def hand(number_cards)
    if number_cards == 2
      TwoCardHand.new
    elsif number_cards == 3
      ThreeCardHand.new
    end
  end

  def start
    puts "ポーカーを開始します。"
    @user.deal(@deck, @number_cards)
    @user.cards.each_with_index { |_card, i| puts "#{@user.name}の引いたカードは#{@user.cards[i]}です。" }
    @dealer.deal(@deck, @number_cards)
    @dealer.cards.each_with_index { |_card, i| puts "#{@dealer.name}の引いたカードは#{@dealer.cards[i]}です。" }
    puts "#{@user.name}の役は#{@user.hand}です。"
    puts "#{@dealer.name}の役は#{@dealer.hand}です。"
  end
end
