# frozen_string_literal: true

require_relative 'card'
require_relative 'deck'
require_relative 'player'
require_relative 'score'

class Game
  attr_reader :deck, :player1, :player2, :player3, :dealer

  def initialize
    @deck = Deck.new
    @player1 = Player.new('あなた', @deck.draw(2))
    @player2 = Player.new('player2', @deck.draw(2))
    @player3 = Player.new('player3', @deck.draw(2))
    @dealer = Player.new('ディーラー', @deck.draw(2))
  end

  def show_card(player, hide: false)
    if player.name == 'ディーラー' && player.deal.size == 2
      show_second_card(player, hide)
    else
      show_normal_card(player)
    end
  end

  def show_second_card(player, hide)
    if hide
      card = player.deal.first
      puts "#{player.name}の引いた1枚目のカード#{card[0]}の#{card[1]}です。"
      puts "#{player.name}の引いた2枚目のカードはわかりません。"
    else
      card = player.deal.last
      puts "#{player.name}の引いた2枚目のカードは#{card[0]}の#{card[1]}でした。"
    end
  end

  def show_normal_card(player)
    if player.deal.size == 2
      player.deal.each do |card|
        puts "#{player.name}の引いたカードは#{card[0]}の#{card[1]}です。"
      end
    else
      card = player.deal.last
      puts "#{player.name}の引いたカードは#{card[0]}の#{card[1]}です。"
    end
  end

  def show_score(player, time: '現在の', score: Score.sum(player.deal))
    if Score.sum(player.deal) == 21
      puts "#{player.name}の#{time}得点はブラックジャックです。"
    elsif Score.sum(player.deal) > 21
      puts "#{player.name}の#{time}得点は#{score}です。"
      puts "#{player.name}はバーストしました。#{player.name}は負けです。"
    else
      puts "#{player.name}の#{time}得点は#{score}です。"
    end
  end

  def stand(player)
    puts "#{player.name}はカードを引くのをやめました。"
  end

  def first_player_turn(player)
    while Score.sum(player.deal) <= 21
      puts 'カードを引きますか？（Y/N）'
      answer = gets.chomp.upcase
      if answer == 'Y'
        player.hand(@deck.draw)
        show_card(player)
        show_score(player)
      elsif answer == 'N'
        break
      else
        puts 'YかNで入力してください。'
      end
    end
  end

  def other_player_turn(player)
    while Score.sum(player.deal) < 17
      player.hand(deck.draw)
      show_card(player)
      show_score(player)
    end
    stand(player) if Score.sum(player.deal) <= 21
  end

  def player_burst_check(players)
    return unless players[0...3].all? { |player| Score.sum(player.deal) > 21 }

    puts 'プレーヤーは全員バーストしたため、ディーラーの勝ちです！'
  end

  def dealer_burst_check(players)
    return unless Score.sum(players[3].deal) > 21

    players.each do |player|
      if Score.sum(player.deal) <= 21
        show_score(player, time: '最終の')
        puts "ディーラーがバーストしたため、#{player.name}の勝ちです！"
      end
    end
  end

  def judge(players)
    return unless Score.sum(players[3].deal) <= 21

    valid_players = players.select { |player| Score.sum(player.deal) <= 21 }
    valid_players.each do |player|
      show_score(player, time: '最終の')
    end
    winner = valid_players.max_by { |player| Score.sum(player.deal) }
    winners = valid_players.select { |player| Score.sum(player.deal) == Score.sum(winner.deal) }

    if winners.size == 1
      puts "#{winners[0].name}の勝ちです！"
    else
      puts '同点の場合、引き分けです。同点以外のプレーヤー、ディーラーは負けです。'
    end
  end
end
