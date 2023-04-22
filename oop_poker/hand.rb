class Hand
  attr_reader :cards

  def initialize
    @cards = [] # 手札のカードを格納するための空の配列を用意する
  end

  def add_cards(cards)
    @cards += cards # 引数で渡されたカードを手札に加える
  end
end
