# frozen_string_literal: true

# プレーヤーのクラスを継承したディーラーのクラス
class Dealer < Player
  # オーバーライド
  # def show_card(hide)
  #   if @deal.size == 2
  #     puts "#{name}の引いた２枚目のカードは#{@deal[1].show}でした。"
  #   else
  #     puts "#{name}の引いたカードは#{@deal.last.show}です。"
  #   end
  # end

  def show_card(hide: false)
    if @deal.size == 2
      if hide
        puts "#{name}の引いた2枚目のカードはわかりません。"
      else
        puts "#{name}の引いた２枚目のカードは#{@deal[1].show}でした。"
      end
    else
      puts "#{name}の引いたカードは#{@deal.last.show}です。"
    end
  end

  # オーバーライド
  def show_score
    puts "#{name}の現在の得点は#{Score.sum(@deal)}です。"
  end

  # オーバーライド
  def show_final_score
    puts "#{name}の最終得点は#{Score.sum(@deal)}です。"
  end

  # オーバーライド
  def burst
    puts "#{name}はバーストしました。#{name}は負けです。"
  end
end
