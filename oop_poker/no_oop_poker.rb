# Step 1-2 のコードです

require 'debug'

# デッキをつくるメソッド
def set_deck
  deck = []
  %w(スペード ハート ダイヤ クラブ).each do |suit|
    %w(2 3 4 5 6 7 8 9 10 J Q K A).each do |rank|
      deck << [suit, rank] # 配列の中に配列
    end
  end
  deck.shuffle
end

# デッキの配列の中から、指定されたnum数だけ、引く
def draw_cards(deck, num)
  deck.pop(num) # popに引数を渡すと、その引数分配列末尾から要素を削除して、取り出した要素を返す
end

# デッキの配列の中から、指定されたnum数だけ、引く
def hand(cards)
  scores = cards.map { |card| score(card) }.sort
  if cards.size == 2
    if scores[1] == scores[0] + 1 || scores[1] == scores[0] + 12
      "ストレート"
    elsif cards[0][1] == cards[1][1]
      "ペア"
    else
      "ハイカード"
    end
  elsif cards.size == 3
    if scores.each_cons(2).all? { |a, b| b == a + 1 } || scores == [1, 12, 13]
      "ストレート"
    elsif scores.group_by(&:itself).values.any? { |group| group.size == 2 }
      "ペア"
    else
      "ハイカード"
    end
  end
end

def score(card)
  return card[1].to_i if card[1].to_i > 0
  case card[1]
  when "A" then 1
  when "J" then 11
  when "Q" then 12
  when "K" then 13
  end
end

puts "ポーカーを開始します。カードを引く枚数を選択してください（2, 3）："
while number_cards = gets.chomp.to_i
  break if [2, 3].include?(number_cards)
  puts "カードを引く枚数は2か3を入力してください："
  next
end

deck = set_deck
player_cards = []
player_cards += draw_cards(deck, number_cards)
player_cards.each.with_index do |card, i|
  binding.break
  puts "あなたの引いたカードは#{player_cards[i][0]}の#{player_cards[i][1]}です。"
end

dealer_cards = []
dealer_cards += draw_cards(deck, number_cards)
dealer_cards.each.with_index do |card, i|
  puts "あなたの引いたカードは#{dealer_cards[i][0]}の#{dealer_cards[i][1]}です。"
end

puts "あなたの役は#{hand(player_cards)}です。"
puts "ディーラーの役は#{hand(dealer_cards)}です。"
