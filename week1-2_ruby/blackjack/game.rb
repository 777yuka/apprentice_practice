require_relative 'card'
require_relative 'deck'
require_relative 'player'
require_relative 'dealer'

puts 'ブラックジャックを開始します。'

deck = Deck.new
player1 = Player.new(name: "player1", card: [], score: 0)
dealer = Dealer.new(name: "player1", card: [], score: 0)
deck.shuffle

2.times do |i|
  player1.card << deck.draw
  puts "あなたの引いたカードは#{player1.card[i].show}です。"
end
# p player1.card
# p deck.cards.size

# p player1.card[0].point
# p player1.card[1].point
player1_total_score = player1.card.sum { |card| card.point }
# p player1_total_score

2.times do
  dealer.card << deck.draw
end
puts "ディーラーの引いたカードは#{dealer.card[0].show}です。"
puts "ディーラーの引いた2枚目のカードはわかりません。"
pp dealer.card[1].show
# p deck.cards.size

# p dealer.card[0].point
# p dealer.card[1].point
dealer_total_score = dealer.card.sum { |card| card.point }
# p dealer_total_score

print "あなたの現在の得点は#{player1_total_score}です。"

i = 2
# player_last_total_score = 0
while player1_total_score <= 21
  puts 'カードを引きますか？（Y/N）'
  answer = gets.chomp.upcase
  if answer == 'Y'
    player1.card << deck.draw
    # p player1.card
    player1_total_score = player1.card.sum { |card| card.point }
    puts "あなたの引いたカードは#{player1.card[i].show}です。"
    i += 1
    puts "あなたの現在の得点は#{player1_total_score}です。"
    break if player1_total_score > 21
  elsif answer == 'N'
    player_last_total_score = player1_total_score
    # p player_last_total_score
    break
  else
    puts 'YかNで入力してください。'
  end
end

if player1_total_score > 21
  puts 'あなたの負けです。'
else
  puts "ディーラーの引いた2枚目のカードは#{dealer.card[1].show}でした。"
  puts "ディーラーの現在の得点は#{dealer_total_score}です。"

  i = 2
  # ディーラーの合計値が17以上になるまで引き続ける
  if dealer_total_score < 17
    while dealer_total_score < 17
      dealer.card << deck.draw
      dealer_total_score = dealer.card.sum { |card| card.point }
      puts "ディーラーの引いたカードは#{dealer.card[i].show}です。"
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