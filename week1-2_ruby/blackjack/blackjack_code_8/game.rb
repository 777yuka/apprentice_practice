# frozen_string_literal: true

require_relative 'card'
require_relative 'deck'
require_relative 'player'
require_relative 'dealer'
require_relative 'score'

puts 'ブラックジャックを開始します。'

deck = Deck.new
deck.create
# p deck.size

players = []
3.times do |n|
  player = Player.new("player#{n + 1}")
  # p player.name
  players << player
end
# puts players

players.each do |player|
  2.times do
    player.hand(deck.draw)
    player.show_card
    # p player.deal
  end
end

dealer = Dealer.new('ディーラー')

2.times do
  dealer.hand(deck.draw)
  dealer.show_card(hide: true)
end
# p dealer.deal

print players[0].show_score
while Score.sum(players[0].deal) <= 21
  puts 'カードを引きますか？（Y/N）'
  answer = gets.chomp.upcase
  if answer == 'Y'
    players[0].hand(deck.draw)
    players[0].show_card
    players[0].show_score
    players[0].burst if Score.sum(players[0].deal) > 21
  elsif answer == 'N'
    break
  else
    puts 'YかNで入力してください。'
  end
end

players[1..2].each do |player|
  player.show_score
  if Score.sum(player.deal) == 21 # プレーヤー2・3の得点が21点だったらカードを引かない
    player.blackjack
  else
    while Score.sum(player.deal) < 18
      player.hand(deck.draw)
      player.show_card
      player.show_score
    end
    if Score.sum(player.deal) == 21 # 引き終わった最終得点ごとに出力する文字列を変更する
      player.blackjack
    elsif Score.sum(player.deal) >= 22
      player.burst
    else # 得点が17〜20の場合
      player.stand
    end
  end
end

if Score.sum(players[0].deal) > 21 && Score.sum(players[1].deal) > 21 && Score.sum(players[2].deal) > 21
  puts 'プレーヤーは全員バーストしたため、ディーラーの勝ちです。'
else
  dealer.show_card # ディーラーの2枚目のカードを出力する（隠さない＝デフォルト値）
  dealer.show_score # ディーラーの合計得点を出力する
  if Score.sum(dealer.deal) == 21 # プレーヤーの得点が21点だったらカードを引かない
    dealer.blackjack
  else
    while Score.sum(dealer.deal) < 17 # ディーラーの得点が17点以上になるまでカードを引く
      dealer.hand(deck.draw)
      dealer.show_card
      dealer.show_score
    end
    if Score.sum(dealer.deal) == 21 # 得点ごとに出力する文字列を変更する
      dealer.blackjack
    end
    if Score.sum(dealer.deal) < 21
      dealer.stand
    end
    if Score.sum(dealer.deal) <= 21
      survivor_players = [] # 得点がバーストしなかったプレーヤーを入れる配列を初期化
      players.each do |player| # プレーヤーを一人ずつ取り出す
        if Score.sum(player.deal) <= 21 # バーストしなかったプレーヤーがいる場合
          player.show_final_score # 最終得点を出力
          survivor_players << player # 得点がバーストしなかったプレーヤーのみ配列に入れる
        end
      end
      if Score.sum(dealer.deal) <= 21 # バーストしなかったディーラーがいる場合
        dealer.show_final_score # 最終得点を出力
        survivor_players << dealer # 得点がバーストしなかったディーラーのみ配列に入れる
      end
      # p survivor_players
      # バーストしなかったプレーヤーとディーラーの点数を比較し、勝敗（または引き分け）を決める
      current_highest_score = 0 # 現在の最高得点を初期化
      # max_score = []
      max_score_player = [] # 現在の最高得点を持つプレーヤーを入れる配列を初期化
      survivor_players.each do |player| # バーストしなかったプレーヤーを一つずつ取得
        player_score = Score.sum(player.deal) # 各プレーヤーの最終得点を代入
        if player_score >= current_highest_score # プレーヤーの最終得点が現在の最高得点以上の場合
          if player_score == current_highest_score # その中でプレーヤーの最終得点と現在の最高得点が同点の場合
            # max_score << player_score
            max_score_player << player # 同点プレーヤーを配列に「追加」する
          else
            current_highest_score = player_score # プレーヤーの最終得点が現在の最高得点より大きい場合
            # max_score = [player_score]
            max_score_player = [player] # 最高得点のプレーヤーのみで配列を「更新」する
          end
        end
      end
      if max_score_player.size == 1 # 最高得点を取得したプレーヤーが一人だけの場合
        if max_score_player[0].name == 'player1'
          puts 'あなたの勝ちです。'
        else
          puts "#{max_score_player[0].name}の勝ちです。"
        end
      else # 最高得点を取得したプレーヤーが複数の場合
        puts '同点の場合、引き分けです。同点以外のプレーヤーは負けです。'
      end
      # p deck.cards.length
    else # 得点が17〜20の場合
      dealer.burst
      players.each do |player| # プレーヤーを一人ずつ取り出す
        if Score.sum(player.deal) <= 21 # バーストしなかったプレーヤー（最終得点が21点以下）がいる場合
          player.show_final_score
          puts "ディーラーがバーストしたため、#{player.name}の勝ちです。"
        end
      end
    end
  end
end

puts 'ブラックジャックを終了します。'
