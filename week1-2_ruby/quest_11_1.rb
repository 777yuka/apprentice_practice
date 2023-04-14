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

class VendingMachine

  def initialize(manufacturer)
    @manufacturer = manufacturer
  end

  def press_manufacturer_name
    print @manufacturer
  end

  def press_button
    print 'cider'
  end

  def deposit_coin(coin)
    if coin == 100

    end

  end

end

vendingmachine = VendingMachine.new('サントリー')
puts vendingmachine.press_button
puts vendingmachine.press_manufacturer_name
puts 

