# frozen_string_literal: true

require_relative 'card'
require_relative 'deck'
require_relative 'player'
require_relative 'dealer'
require_relative 'score'

puts 'ブラックジャックを開始します。'

deck = Deck.new # カード一束を作成
deck.create

players = []
3.times do |n| # プレーヤーを3人作成して、2回カードを引く
  player = Player.new("player#{n + 1}")
  players << player
  2.times do
    player.hand(deck.draw)
    player.show_card
  end
end

dealer = Dealer.new('ディーラー') # ディーラーを作成

2.times do # ディーラーが2回カードを引いて、２枚目は内容を隠す
  dealer.hand(deck.draw)
  dealer.show_card(hide: true)
end

players[0].show_score
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
  if Score.sum(player.deal) < 17
    while Score.sum(player.deal) < 17 # プレーヤー2・3の得点が17点以上になるまでカードを引き続ける
      player.hand(deck.draw)
      player.show_card
      player.show_score
    end
  end
  if Score.sum(player.deal) == 21 # 引き終わった最終得点ごとに出力する文字列を変更する
    player.blackjack
    next_method
  elsif Score.sum(player.deal) < 21
    player.stand
  else
    player.burst
  end
end

if Score.sum(players[0].deal) > 21 && Score.sum(players[1].deal) > 21 && Score.sum(players[2].deal) > 21
  puts 'プレーヤーは全員バーストしたため、ディーラーの勝ちです。'
else # ディーラーのターン
  dealer.show_card # ディーラーの2枚目のカードを出力する（隠さない＝デフォルト値）
  dealer.show_score # ディーラーの合計得点を出力する
  if Score.sum(dealer.deal) < 17
    while Score.sum(dealer.deal) < 17 # ディーラーの得点が17点以上になるまでカードを引く
      dealer.hand(deck.draw)
      dealer.show_card
      dealer.show_score
    end
  end
  dealer.blackjack if Score.sum(dealer.deal) == 21
  # ディーラーがバーストしなかった場合

  if Score.sum(dealer.deal) <= 21
    dealer.stand
    # ここからバーストしなかったプレーヤーとディーラーの最終得点発表
    survivor_players = [] # バーストしなかったプレーヤーを入れる配列を初期化
    players.each do |player|
      if Score.sum(player.deal) <= 21 # バーストしなかったプレーヤーのみ
        player.show_final_score
        survivor_players << player
      end
    end
    if Score.sum(dealer.deal) <= 21
      dealer.show_final_score
      survivor_players << dealer # バーストしなかったディーラーも配列に入れる
    end

    # ここから勝敗決め
    current_highest_score = 0 # 現在の最高得点を初期化
    # max_score = []
    max_score_player = [] # 現在の最高得点を持つプレーヤーを入れる配列を初期化
    survivor_players.each do |player| # バーストしなかったプレーヤーの配列から一人ずつ取得
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

    # 勝敗の結果発表
    if max_score_player.size == 1 # 最高得点を取得したプレーヤーが一人だけの場合
      max_score_player[0].winner
    else # 最高得点を取得したプレーヤーが複数の場合
      puts '同点の場合、引き分けです。同点以外のプレーヤー、ディーラーは負けです。'
    end

  # ディーラーがバーストした場合
  else
    dealer.burst
    players.each do |player| # プレーヤーを一人ずつ取り出す
      if Score.sum(player.deal) <= 21 # バーストしなかったプレーヤー（最終得点が21点以下）がいる場合
        player.show_final_score
        player.winner_dealer_burst
      end
    end
  end
end

puts 'ブラックジャックを終了します。'
