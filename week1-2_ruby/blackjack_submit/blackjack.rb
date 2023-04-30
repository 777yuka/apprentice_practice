# frozen_string_literal: true

require_relative 'game'

puts 'ブラックジャックを開始します。'

game = Game.new

[game.player1, game.player2, game.player3].each { |player| game.show_card(player) } # 全員手札を２枚ずつ見せる（ディーラーは2枚目を隠す）
game.show_card(game.dealer, hide: true)

game.show_score(game.player1)
game.first_player_turn(game.player1)
game.show_score(game.player2)
game.other_player_turn(game.player2)
game.show_score(game.player3)
game.other_player_turn(game.player3)

game.show_card(game.dealer)
game.show_score(game.dealer)

game.player_burst_check([game.player1, game.player2, game.player3, game.dealer])

game.other_player_turn(game.dealer)

game.dealer_burst_check([game.player1, game.player2, game.player3, game.dealer])

game.judge([game.player1, game.player2, game.player3, game.dealer])

puts 'ブラックジャックを終了します。'
