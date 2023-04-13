class Card
  attr_reader :mark
  attr_accessor :number


  #カードクラス初期化（引数はカードのマークとナンバー）
  def initialize(mark, number)
    @mark = mark
    @number = number
  end

  #カードのマークと数字を文字列として出力するメソッド
  def show
    "#{@mark}の#{@number}"
  end

  #カードにポイントを割り振るメソッド
  def point
    if @number == 'A'
      11
    elsif @number == 'Jack' || @number == 'Queen' || @number == 'King'
      10
    else
      @number.to_i
    end
  end
  
  # 確認用
  # card1 = Card.new('A',1)
  # p card1.mark
  # p card1.number
  # p card1.show
  # p card1.point

end

