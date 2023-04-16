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
end

# スコアの合計を算出するクラス
class Score
  # スコアの合計を算出するクラスメソッド（引数にはPlayerクラスのインスタンス.dealが入る想定）
  def self.sum(hand)
    scores = 0
    aces = 0

    hand.each do |card| # 手札の配列の要素を一つずつ取り出していく
      # カードのナンバーごとに、得点を分ける
      if card.number == 'A'
        scores += 11
        aces += 1 # エースが配列内にあると+1カウントされる
      elsif card.number == 'Jack' || card.number == 'Queen' || card.number == 'King'
        scores += 10
      else
        scores += card.number.to_i # 文字列で取得しているので、Integerに変更する
      end

      while scores > 21 && aces >= 1
        scores -= 10
        aces -= 1
      end
    end

    scores
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

print "あなたの現在の得点は#{Score.sum(player1.deal)}です。"

while Score.sum(player1.deal) <= 21
  puts 'カードを引きますか？（Y/N）'
  answer = gets.chomp.upcase
  if answer == 'Y'
    player1.hand(deck.draw)
    player1.show_card
    puts "あなたの現在の得点は#{Score.sum(player1.deal)}です。"
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
  puts "ディーラーの現在の得点は#{Score.sum(dealer.deal)}です。"

  # ディーラーの得点が17点以上になるまでカードを引く
  if Score.sum(dealer.deal) < 17
    while Score.sum(dealer.deal) < 17
      dealer.hand(deck.draw)
      dealer.show_card
      puts "ディーラーの得点は#{Score.sum(dealer.deal)}です。"
    end
  end

  puts "あなたの得点は#{Score.sum(player1.deal)}です。"
  puts "ディーラーの得点は#{Score.sum(dealer.deal)}です。"

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
