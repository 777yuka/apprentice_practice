class Card
  SUITS = %w[♣ ◆ ♥ ♠]
  RANKS = %w[2 3 4 5 6 7 8 9 10 J Q K A]

  # カードのスートを日本語に対応づけるためのハッシュ
  SUITS_JP = {
    "♣" => "クラブ",
    "◆" => "ダイヤ",
    "♥" => "ハート",
    "♠" => "スペード"
  }

  attr_reader :suit, :rank # スートとランクの読み取り属性を定義

  def initialize(suit, rank) # スートとランクを引数にもつCardクラスのコンストラクタ
    @suit = suit
    @rank = rank
  end

  def score # カードのスコアを返すメソッド
    return @rank.to_i if @rank.to_i > 0 # ランクが数字の場合は、その数値を返す

    case @rank # ランクが絵札の場合は、スコアを返す
    when "J" then 11
    when "Q" then 12
    when "K" then 13
    when "A" then 14
    end
  end

  def to_s
    "#{SUITS_JP[@suit]}の#{@rank}" # スートを日本語表記にして、ランクと組み合わせた文字列を返す
  end
end
