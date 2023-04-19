# frozen_string_literal: true

# プレーヤーのクラス
class Player
  attr_accessor :name, :deal # 空の配列にカードが追加されていくので、アクセサー

  # インスタンス初期値（引いたカードを溜める（手札の）空の配列を用意）
  def initialize(name)
    @name = name
    @deal = []
  end

  # 引いたカードを貯めていくメソッド（引数にDeckクラスのインスタンス.drawが入る想定）
  def hand(draw_card)
    @deal << draw_card
  end

  # 引いたカードを確認するメソッド
  def show_card
    if @name == 'player1'
      puts "あなたの引いたカードは#{@deal.last.show}です。" # 配列の一番最後を確認
    else
      puts "#{@name}の引いたカードは#{@deal.last.show}です。" # 配列の一番最後を確認
    end
  end

  # def show_score(deal)
  #   puts "あなたの現在の得点は#{Score.sum(deal)}です。"
  # end
  def show_score
    if @name == 'player1'
      puts "あなたの現在の得点は#{Score.sum(@deal)}です。"
    else
      puts "#{name}の現在の得点は#{Score.sum(@deal)}です。"
    end
  end

  def show_final_score
    if @name == 'player1'
      puts "あなたの最終得点は#{Score.sum(@deal)}です。"
    else
      puts "#{name}の最終得点は#{Score.sum(@deal)}です。"
    end
  end

  def blackjack
    puts "#{name}の得点はブラックジャックのため、カードを引きません。"
  end

  def stand
    puts "#{name}はカードを引くのをやめました。"
  end

  def burst
    if @name == 'player1'
      puts 'あなたはバーストしました。あなたは負けです。'
    else
      puts "#{name}はバーストしました。#{name}は負けです。"
    end
  end
end
