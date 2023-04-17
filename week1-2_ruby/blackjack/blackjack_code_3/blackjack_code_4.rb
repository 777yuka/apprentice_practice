# frozen_string_literal: true

# カード１枚のクラス
class Card
  attr_reader :suit, :number # クラス内メソッドで表示したいだけなので、リーダー

  # インスタンス初期値（引数はカードのスートとナンバー）
  def initialize(suit, number)
    @suit = suit
    @number = number
  end

  # スートとナンバーを文字列として出力するメソッド
  def show
    "#{@suit}の#{@number}"
  end

  # ナンバーに配点するメソッド
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
  attr_accessor :deal # 空の配列にカードが追加されていくので、アクセサー

  # インスタンス初期値（引いたカードを溜める（手札の）空の配列を用意）
  def initialize
    @deal = []
  end

  # 引いたカードを貯めていくメソッド（引数にDeckクラスのインスタンス.drawが入る想定）
  def hand(draw_card)
    @deal << draw_card
  end

  # 引いたカードを確認するメソッド
  def show_card
    puts "あなたの引いたカードは#{@deal.last.show}です。" # 配列の一番最後を確認
  end

  # def show_score(deal)
  #   puts "あなたの現在の得点は#{Score.sum(deal)}です。"
  # end
  def show_score
    print "あなたの現在の得点は#{Score.sum(@deal)}です。"
  end
end

# プレーヤーのクラスを継承したディーラーのクラス
class Dealer < Player
  # オーバーライド
  def show_card
    puts "ディーラーの引いたカードは#{@deal.last.show}です。"
  end

  # 追加メソッド
  def show_card_second
    puts "ディーラーの引いたカードは#{@deal[1].show}でした。" # 追加メソッド
  end

  # 追加メソッド
  def show_card_secret
    puts 'ディーラーの引いたカードはわかりません。'
  end

  # オーバーライド
  def show_score
    print "ディーラーの現在の得点は#{Score.sum(@deal)}です。"
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

player1 = Player.new
dealer = Dealer.new


2.times do
  player1.hand(deck.draw)
  player1.show_card
  p player1.deal
end

# p player1.deal.length
# p deck.cards.length

dealer.hand(deck.draw)
dealer.show_card
p dealer.deal
dealer.hand(deck.draw)
dealer.show_card_secret
p dealer.deal

# p dealer.deal.length
# p deck.cards.length

player1.show_score

while Score.sum(player1.deal) <= 21
  puts 'カードを引きますか？（Y/N）'
  answer = gets.chomp.upcase
  if answer == 'Y'
    player1.hand(deck.draw)
    player1.show_card
    puts player1.show_score
    break if Score.sum(player1.deal) > 21
  elsif answer == 'N'
    break
  else
    puts 'YかNで入力してください。'
  end
end

# p Score.sum(dealer.deal)

if Score.sum(player1.deal) > 21
  puts 'あなたの負けです。'
else
  print dealer.show_card_second
  puts dealer.show_score

  # ディーラーの得点が17点以上になるまでカードを引く
  # if Score.sum(dealer.deal) < 17
  while Score.sum(dealer.deal) < 17
    dealer.hand(deck.draw)
    dealer.show_card
    puts dealer.show_score if Score.sum(dealer.deal) < 17
  end

  puts player1.show_score
  puts dealer.show_score

  if Score.sum(dealer.deal) >= 22
    puts 'あなたの勝ちです。'
  elsif Score.sum(player1.deal) > Score.sum(dealer.deal)
    puts 'あなたの勝ちです!'
  elsif Score.sum(player1.deal) < Score.sum(dealer.deal)
    puts 'あなたの負けです。'
  # elsif Score.sum(player1.deal) == Score.sum(dealer.deal)
  else
    puts '引き分けです。'
  end
end

puts 'ブラックジャックを終了します。'
