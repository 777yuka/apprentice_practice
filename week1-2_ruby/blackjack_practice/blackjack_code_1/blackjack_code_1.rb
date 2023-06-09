# カードの準備を行う
# カードは、ハッシュにする（キー：トランプの柄と数字（文字列）、値：該当する得点（数値））
# 2から9までは、書かれている数の通りの点数
# Aは11点、もしくは1点
# 10,J,Q,Kは10点

# frozen_string_literal: true

puts 'ブラックジャックを開始します。'

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

cards_array = cards.to_a # ハッシュを配列に変換して、変数に入れる
# p cards_array  # ハッシュから配列化されたすべてのカードを確認

my_cards = []
# メソッド内で使用するため、配列たちを引数に渡す
def draw_cards(cards_array, my_cards)
  selected_card = cards_array.sample # 配列をシャッフルして、一番最初の要素を取得する
  # p selected_card # ランダムに引いたカード１枚を確認
  puts "あなたの引いたカードは#{selected_card[0]}です。" # 配列のインデックス0は、トランプの柄と数字
  my_cards << selected_card # 引いたカードを空の配列に入れていく処理
end
# p draw_cards(cards_array,my_cards) # メソッドの確認

2.times do
  draw_cards(cards_array, my_cards)
end
# p my_cards # 配列の状態を確認（引いたカードの集まり）

dealer_cards = []
# メソッド内で使用するため、配列たちを引数に渡す
def dealer_draw_cards(cards_array, dealer_cards)
  selected_card = cards_array.sample # 配列をシャッフルして、一番最初の要素を取得する
  # p selected_card # ランダムに引いたカード１枚を確認
  dealer_cards << selected_card # 引いたカードを空の配列に入れていく処理
  if dealer_cards.size == 2
    puts 'ディーラーの引いたカードはわかりません。'
  else
    puts "ディーラーの引いたカードは#{selected_card[0]}です。" # 配列のインデックス0は、トランプの柄と数字
  end
end
# p draw_cards(cards_array,my_cards) # メソッドの確認

2.times do
  dealer_draw_cards(cards_array, dealer_cards)
end
# p my_cards # 配列の状態を確認（引いたカードの集まり）

def sum(my_cards)
  my_cards.sum { |card| card[1].to_i } # 配列のインデックス1は、該当する得点
end

total_score = sum(my_cards)
puts "あなたの現在の得点は#{total_score}です。"

player_last_total_score = 0
while total_score <= 21
  puts 'カードを引きますか？（Y/N）'
  answer = gets.chomp.upcase
  if answer == 'Y'
    draw_cards(cards_array, my_cards)
    total_score = sum(my_cards)
    puts "あなたの現在の得点は#{total_score}です。"
    break if total_score > 21
  elsif answer == 'N'
    player_last_total_score = total_score
    break
  else
    puts 'YかNで入力してください。'
  end
end

if total_score > 21
  puts 'あなたの負けです。'
else
  puts "ディーラーの引いた2枚目のカードは#{dealer_cards[1].first}でした。" # 配列のインデックス0は、トランプの柄と数字

  def dealer_sum(dealer_cards)
    dealer_cards.sum { |card| card[1].to_i } # 配列のインデックス1は、該当する得点
  end

  dealer_total_score = dealer_sum(dealer_cards)
  puts "ディーラーの現在の得点は#{dealer_total_score}です。"

  # でぃらのごうけいちが17いかだったら17いじょうになるまでひく
  if dealer_total_score < 17
    while dealer_total_score < 17
      dealer_draw_cards(cards_array, dealer_cards)
      # puts "ディーラーの引いたカードは#{dealer_cards[1].last}です。"
      dealer_total_score = dealer_sum(dealer_cards)
    end
    if dealer_total_score >= 22
      puts "あなたの得点は#{player_last_total_score}です。"
      puts "ディーラーの得点は#{dealer_total_score}です。"
      puts 'あなたの勝ちです。'
    end
  end

  puts "あなたの得点は#{player_last_total_score}です。"
  puts "ディーラーの得点は#{dealer_total_score}です。"

  if player_last_total_score > dealer_total_score
    puts 'あなたの勝ちです!'
  elsif player_last_total_score < dealer_total_score
    puts 'あなたの負けです。'
  elsif player_last_total_score == dealer_total_score
    puts '引き分けです。'
  end
end

puts 'ブラックジャックを終了します。'
