# frozen_string_literal: true

# カード１枚のクラス
class Card
  # クラス内メソッドで表示したいだけなので、リーダー
  attr_reader :suit, :number

  # インスタンス初期値（引数はカードのスートとナンバー）
  def initialize(suit, number)
    @suit = suit
    @number = number
  end

  # スートとナンバーの情報を文字列として出力するメソッド
  def show
    "#{@suit}の#{@number}"
  end

  # 各ナンバーに配点するメソッド
  def allotment(scores)
    if @number == 'A'
      Score.select_ace_number(scores)
    elsif @number == 'Jack' || @number == 'Queen' || @number == 'King'
      10
    else
      @number.to_i # 文字列で取得しているので、Integerに変更する
    end
  end
end
