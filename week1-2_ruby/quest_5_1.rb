# frozen_string_literal: true

# 条件分岐を使うことができる

# 1. 比較
# 2つの整数 x, y の大小を比較し、xとyの大小関係を出力する関数 greater を定義してください。

# xよりyが大きければ「x > y」
# xよりyが小さければ「x < y」
# xとyの値が同じなら「x == y」

def greater(x, y)
  if x < -100 || x > 100 || y < -100 || y > 100
    puts '引数x,yには、-100以上100以内の整数を入れてください'
  elsif  x > y
    puts 'x > y'
  elsif x < y
    puts 'x < y'
  else
    puts 'x == y'
  end
end

greater(5, 4)
greater(-50, -40)
greater(10, 10)
greater(101,-101)
greater(100,-101)
