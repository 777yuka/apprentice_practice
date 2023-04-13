class Card

  def shuffle_cards
    cards = {} # 空のハッシュを用意
    marks = %w[ハート ダイヤ スペード クラブ]
    numbers = %w[A 2 3 4 5 6 7 8 9 10 Jack Queen King]

    marks.each do |mark|
      numbers.each do |number|
        card = "#{mark}の#{number}" # ハッシュのキーになる部分
        cards[card] = if number.to_i.between?(2, 10) # numberを数値に変換して、1~10の間にあるか
                        number.to_i # ハッシュオブジェクト`card`というキーに対して、値を割り当てる
                      elsif number == 'A'
                        11
                      else # J,Q,Kは10点
                        10 # ハッシュオブジェクト`card`というキーに対して、値を割り当てる
                      end
      end
    end
    # p cards # ハッシュ化されたすべてのカードを確認

    cards_array = cards.to_a.shuffle! # ハッシュを配列に変換し、かつシャッフルして、変数に入れる
    # p cards_array  # ハッシュから配列化されたすべてのカードを確認
  end

  @play_cards = Card.new
# p play_cards.shuffle_cards

end
