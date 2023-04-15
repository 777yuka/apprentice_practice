# frozen_string_literal: true

# オブジェクト指向を使うことができる

# 自動販売機のプログラムを書くクエストです。

# 1. クラスの定義
# 自動販売機のプログラムをオブジェクト指向を使って書きましょう。今回実装する内容は下記の通りです。
#
# 自動販売機のクラス VendingMachine を宣言してください
# ボタンを押すとサイダーが出るようにします。press_button メソッドを実行すると 'cider' の文字列を返してください

# 2. initializeメソッド
# 自動販売機のプログラムに initialize メソッド を追加しましょう。下記の仕様を追加します。
#
# オブジェクトの生成時に自動販売機のメーカー名を記録できるように、initialize メソッドを追加します
# 自動販売機のメーカー名確認ボタンを押すと、メーカー名を返す press_manufacturer_name メソッドを追加する

# 3. メソッドの可視性
# 自動販売機のプログラムのメソッドに可視性を追記します。下記の仕様を追加します。
#
# コインを入れることのできる deposit_coin メソッドを作成します。100円以外のコインは入れられず、100円コインが入れられると自動販売機に金額が貯まります
# 100円以上貯まった状態でボタンを押すとサイダーが出るようにします。サイダーが出ると入れた金額から100円が減ります
# press_manufacturer_name メソッドは外部に公開しない非公開メソッドにしてください。private キーワードを使用します

# 自動販売機にいれる、アイテムのクラス
class Item
  attr_accessor :name

  def initialize(name)
    @name = name
  end

end

# 自動販売機にいれる、カップコーヒーのクラス
class CapCoffee < Item

end

# 自動販売機にいれる、飲み物のクラス
class Drink < Item
end

# 自動販売機にいれる、菓子のクラス
class Sweet < Item
end

# 自動販売機のクラス
class VendingMachine
  def initialize(manufacturer)
    @manufacturer = manufacturer
    @coins = 0
    @cups = 0
  end

  # 自動販売機に100円が入ったら保管する、100円以外は受け付けないメソッド
  def deposit_coin(coin)
    if coin == 100
      @coins += coin
    else
      print ' '
    end
  end

  # コーヒーカップを追加するメソッド
  def add_cup(cup)
    @cups += cup
  end

  def natara(item_name)
    print item_name
  end

  # 自動販売機が100円以上保持している時、ボタンを押すと「サイダー」が出力され、100円が減るメソッド
  def press_button(drink)
    if @coins >= 100 && drink.name == 'cider'
      @coins -= 100
      print 'cider'
    elsif @coins >= 150 && drink.name == 'cola'
      @coins -= 150
      print 'cola'
    elsif @coins >= 100 && @cups >= 1 && drink.name == 'hot'
      @coins -= 100
      @cups -= 1
      print 'hot cup coffee'
    elsif @coins >= 100 && @cups >= 1 && drink.name == 'ice'
      @coins -= 100
      @cups -= 1
      print 'ice cup coffee'
    elsif @coins >= 150 && drink.name == 'potato'
      @coins -= 150
      print 'potato chips'
    else
      print ' '
    end
  end

  # これ以下は、プライベートメソッド
  private

  # メーカーの名前を出力するメソッド
  def press_manufacturer_name
    print @manufacturer
  end
end

hot_cup_coffee = CapCoffee.new('hot')
cider = Drink.new('cider')
snack = Sweet.new('potato')
vending_machine = VendingMachine.new('サントリー')
vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cider)

puts vending_machine.press_button(hot_cup_coffee)
vending_machine.add_cup(1)
puts vending_machine.press_button(hot_cup_coffee)

puts vending_machine.press_button(snack)
vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(snack)
