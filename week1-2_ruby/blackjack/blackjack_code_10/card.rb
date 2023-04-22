# frozen_string_literal: true

# カード１枚のクラス
class Card
  attr_reader :suit, :rank

  SUITS = %w[ハート ダイヤ スペード クラブ].freeze
  RANKS = %w[A 2 3 4 5 6 7 8 9 10 Jack Queen King].freeze

  # インスタンス初期値（引数はカードのスートとナンバー）
  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  # スートとナンバーの情報を文字列として出力するメソッド
  def show
    "#{@suit}の#{@rank}"
  end
end
