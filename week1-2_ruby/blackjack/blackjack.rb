# puts "ブラックジャックを開始します。"

# puts "あなたの引いたカードは#{ハートの7}です。"
# puts "あなたの引いたカードは#{クラブの8}です。"

# puts "ディーラーの引いたカードは#{ダイヤのQ}です。"
# puts "ディーラーの引いた2枚目のカードはわかりません。"

# puts "あなたの現在の得点は#{15}です。カードを引きますか？（Y/N）"
# Y
# puts "あなたの引いたカードはスペードの５です。"
# puts "あなたの現在の得点は#{20}です。カードを引きますか？（Y/N）"
# N
# puts "ディーラーの引いた2枚目のカードは#{ダイヤの2}でした。"
# puts "ディーラーの現在の得点は#{12}です。"
# puts "ディーラーの引いたカードは#{ハートのK}です。"
# puts "あなたの得点は#{20}です。"
# puts "ディーラーの得点は#{22}です。"
# puts "あなたの#{勝ちです！}"
# puts "ブラックジャックを終了します。"

puts "ブラックジャックを開始します。"

marks = ["ハート", "ダイヤ", "スペード", "クラブ"]
numbers = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13"]

cards = marks.product(numbers)
# p cards

drawn_card = []

2.times do
  selected_card = cards.shuffle.first
  # p selected_card
  puts "あなたの引いたカードは#{selected_card[0]}の#{selected_card[1]}です。"
  drawn_card << selected_card
  # p drawn_card
end

total_score = drawn_card.sum {|card| card[1].to_i}

puts "あなたの現在の得点は#{total_score}です。カードを引きますか？（Y/N）"

input = gets.chomp.upcase
if input == "Y"
  puts "YES"
elsif input == "N"
  puts "NO"
else
  puts "Y/Nどちらかで入力してください"
end


