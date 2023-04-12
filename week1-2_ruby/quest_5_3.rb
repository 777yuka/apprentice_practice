# 条件分岐を使うことができる

# 3. XOR
# 2つのブーリアン値、xとyが与えられる
# xとyのうちどちらかが真なら true を出力、両方真もしくは両方偽なら false を出力する関数 xor を定義してください。

def xor(x, y)
  if x ==false && y == false
    puts false
  else
    puts true
  end
end

xor(true, true)
xor(true, false)
xor(false, true)
xor(false, false)