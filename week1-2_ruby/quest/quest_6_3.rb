# frozen_string_literal: true

# 繰り返し処理

# 3. 総和
# 1 から 100 までの足し算の結果を出力する関数 sum_1_100 を定義してください。

def sum_1_100
  numbers = (1..100).to_a
  sum = 0
  numbers.each do |n|
    sum += n
  end
  puts sum
end

sum_1_100
