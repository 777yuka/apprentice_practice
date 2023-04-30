# frozen_string_literal: true

# カード１枚のクラス
class Card
  # クラス内メソッドで表示したいだけなので、リーダー
  attr_reader :suit, :number

  # インスタンス初期値（引数はカードのスートとナンバー）
  def initialize(suit, number)
    @suit = suit
    @number = number
  end

  # スートとナンバーの情報を文字列として出力するメソッド
  def show
    "#{@suit}の#{@number}"
  end

  # 各ナンバーに配点するメソッド
  def allotment(scores)
    if @number == 'A'
      Score.select_ace_number(scores)
    elsif @number == 'Jack' || @number == 'Queen' || @number == 'King'
      10
    else
      @number.to_i # 文字列で取得しているので、Integerに変更する
    end
  end
end

# カードの束のクラス
class Deck
  attr_accessor :cards # 空の配列にカードが追加されていくので、アクセサー

  # インスタンス初期値（カードの束を入れる空の配列を用意）
  def initialize
    @cards = []
  end

  # カードの束を、カードクラスのインスタンスを使って作成するメソッド
  def create
    suits = %w[ハート ダイヤ スペード クラブ]
    numbers = %w[A 2 3 4 5 6 7 8 9 10 Jack Queen King]

    suits.each do |suit|
      numbers.each do |number|
        card = Card.new(suit, number) # カードクラスのインスタンスを作成
        @cards << card # カードクラスのインスタンスを、配列に入れていく
      end
    end
    @cards.shuffle! # 配列内をシャッフルする
    # p @cards
  end

  # シャッフルされたカードの束（配列）から最初の1枚を抜き出すメソッド
  def draw
    @cards.shift
  end
end

# プレーヤーのクラス
class Player
  attr_accessor :name, :deal # 空の配列にカードが追加されていくので、アクセサー

  # インスタンス初期値（引いたカードを溜める（手札の）空の配列を用意）
  def initialize(name)
    @name = name
    @deal = []
  end

  # 引いたカードを貯めていくメソッド（引数にDeckクラスのインスタンス.drawが入る想定）
  def hand(draw_card)
    @deal << draw_card
  end

  # 引いたカードを確認するメソッド
  def show_card
    if @name == 'player1'
      puts "あなたの引いたカードは#{@deal.last.show}です。" # 配列の一番最後を確認
    else
      puts "#{@name}の引いたカードは#{@deal.last.show}です。" # 配列の一番最後を確認
    end
  end

  # def show_score(deal)
  #   puts "あなたの現在の得点は#{Score.sum(deal)}です。"
  # end
  def show_score
    if @name == 'player1'
      puts "あなたの現在の得点は#{Score.sum(@deal)}です。"
    else
      puts "#{name}の現在の得点は#{Score.sum(@deal)}です。"
    end
  end

  def show_final_score
    if @name == 'player1'
      puts "あなたの最終得点は#{Score.sum(@deal)}です。"
    else
      puts "#{name}の最終得点は#{Score.sum(@deal)}です。"
    end
  end

  def blackjack
    puts "#{name}の得点はブラックジャックのため、カードを引きません。"
  end

  def stand
    puts "#{name}はカードを引くのをやめました。"
  end

  def burst
    if @name == 'player1'
      puts 'あなたはバーストしました。あなたは負けです。'
    else
      puts "#{name}はバーストしました。#{name}は負けです。"
    end
  end
end

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

# スコアの合計を算出するクラス
class Score
  # スコアの合計を算出するクラスメソッド（引数にはPlayerクラスのインスタンス.dealが入る想定）
  def self.sum(hand)
    scores = 0
    hand.each do |card| # 手札の配列の要素を一つずつ取り出していく
      # カードのナンバーごとに、得点を分ける
      scores += card.allotment(scores)
    end
    scores
  end

  def self.select_ace_number(scores)
    if scores < 11 # 合計得点が11点未満の場合は11点を追加する
      11
    else # 合計得点が11点以上の場合は、11点を追加するとバーストするので1点を追加する
      1
    end
  end
end

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
# p deck.cards.length

dealer = Dealer.new('ディーラー')
# p dealer.name

2.times do
  dealer.hand(deck.draw)
  p dealer.deal
  dealer.show_card(hide: true)
end
# p deck.cards.length

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
  # プレーヤー2・3の得点が21点だったらカードを引かない
  if Score.sum(player.deal) == 21
    player.blackjack
  # プレーヤー1（わたし）がバーストしていなかったら、
  elsif Score.sum(players[0].deal) < 22
    # プレーヤー2・3の得点が、プレーヤー1（わたし）の得点以下の間、プレーヤー2・3は引き続ける
    while Score.sum(player.deal) <= Score.sum(players[0].deal)
      player.hand(deck.draw)
      player.show_card
      player.show_score
    end
  # プレーヤー1（わたし）がバーストしていなかったら、
  else
    # プレーヤー2・3は17点以上になるまで引き続ける
    while Score.sum(player.deal) < 17
      player.hand(deck.draw)
      player.show_card
      player.show_score
    end
  end
  # 引き終わった最終得点ごとに出力する文字列を変更する
  if Score.sum(player.deal) == 21
    player.blackjack
  elsif Score.sum(player.deal) >= 22
    player.burst
  else # 得点が17〜20の場合
    player.stand
  end
end

if Score.sum(players[0].deal) > 21 && Score.sum(players[1].deal) > 21 && Score.sum(players[2].deal) > 21
  puts 'プレーヤーは全員バーストしたため、ディーラーの勝ちです。'
else
  # ディーラーの2枚目のカードを出力する（隠さない＝デフォルト値）
  dealer.show_card
  # ディーラーの合計得点を出力する
  dealer.show_score
  # プレーヤーの得点が21点だったらカードを引かない
  if Score.sum(dealer.deal) == 21
    dealer.blackjack
  else
    # ディーラーの得点が17点以上になるまでカードを引く
    while Score.sum(dealer.deal) < 17
      dealer.hand(deck.draw)
      dealer.show_card
      dealer.show_score
    end
    # 得点ごとに出力する文字列を変更する
    if Score.sum(dealer.deal) == 21
      dealer.blackjack
    elsif Score.sum(dealer.deal) >= 22
      dealer.burst
    else # 得点が17〜20の場合
      dealer.stand
    end
  end
end

# 得点がバーストしなかったプレーヤーのみ配列に入れる
survivor_players = []
# バーストしなかったプレーヤーのみ、最終得点を出力する。
players.each do |player|
  if Score.sum(player.deal) <= 21
    player.show_final_score
    survivor_players << player
  end
end

# ディーラーがバーストしなかったら、最終得点を出力する。
if Score.sum(dealer.deal) <= 21
  dealer.show_final_score
  survivor_players << dealer
end
# p survivor_players

if survivor_players.size == 1
  puts "#{survivor_players[0].name}の勝ちです。"
else
  max_score = 0
  max_score_player = nil
  survivor_players.each do |player|
    score = Score.sum(player.deal)
    if score > max_score
      max_score = score
      max_score_player = player
    end
  end
end

puts "#{max_score_player.name}の勝ちです。"

puts 'ブラックジャックを終了します。'
