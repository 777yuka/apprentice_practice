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

# 4. 単一責任の原則
# 自動販売機プログラムを単一責任の原則に基づいて設計しましょう。下記の仕様を追加します。
#
# 押したボタンに応じて、サイダーかコーラが出るようにしましょう。サイダーは100円、コーラは150円とします。100円以外のコインは入れられない仕様はそのままです
# 自動販売機に関する責務とアイテムに関する責務は別のものになります。単一責任の原則に基づいてクラスを設計してください。
#
# press_button メソッドを実行すると、与えられた引数に応じたアイテムを返してください。

# 自動販売機にいれる、飲み物のクラス
class Item
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

# 自動販売機のクラス
class VendingMachine
  def initialize(manufacturer)
    @manufacturer = manufacturer
    @coins = 0
  end

  # 自動販売機が100円以上保持している時、ボタンを押すと「サイダー」が出力され、100円が減る。
  # 自動販売機が150円以上保持している時、ボタンを押すと「コーラ」が出力され、150円が減る。
  def press_button(drink)
    if @coins >= 100 && drink.name == 'cider'
      @coins -= 100
      print 'cider'
    elsif @coins >= 150 && drink.name == 'cola'
      @coins -= 150
      print 'cola'
    else
      print ' '
    end
  end

  # 自動販売機に100円が入ったら、保管する。100円以外は受け付けない。
  def deposit_coin(coin)
    if coin == 100
      @coins += coin
    else
      print ' '
    end
  end

  # これ以下は、プライベートメソッドです
  private

  # メーカーの名前を出力するメソッド
  def press_manufacturer_name
    print @manufacturer
  end
end

cola = Item.new('cola')
vending_machine = VendingMachine.new('サントリー')
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cola)
vending_machine.deposit_coin(100)
puts vending_machine.press_button(cola)
