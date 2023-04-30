require_relative 'card'

class Deck

  attr_accessor :cards

  def initialize
    @cards = []
  end

  # カードを作成し、シャッフルするメソッド
  def shuffle
    marks = %w[ハート ダイヤ スペード クラブ]
    numbers = %w[A 2 3 4 5 6 7 8 9 10 Jack Queen King]

    marks.each do |mark|
      numbers.each do |number|
        set_cards = Card.new(mark,number)
        @cards << set_cards
      end
    end
    @cards.shuffle!
  end

  # 確認用
  # deck1 = Deck.new
  # deck1.shuffle
  # p deck1.shuffle[0].point
  # p deck1.shuffle[0].show

  # シャッフルされたカードから最初の1枚を引くメソッド
  def draw
    @cards.pop
  end

  # 確認用
  # deck1 = Deck.new
  # deck1.shuffle
  # p deck1.draw
  # p deck1.draw.point
  # p deck1.draw.show

end

