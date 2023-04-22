require_relative "card"

class Deck
  def initialize
    @cards = [] # デッキのカードを格納するための空の配列を用意する
    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank|
        @cards << Card.new(suit, rank)
      end
    end
    @cards.shuffle!
  end

  def draw(number)
    @cards.pop(number) # 指定された枚数（引数）のカードをデッキから取り出す
  end
end
