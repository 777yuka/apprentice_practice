# frozen_string_literal: true

# 繰り返し処理

# 2. 羊
# 羊の数 nun が与えられ、num 回羊の数えを出力する関数 sheep を定義してください。
# n：整数、1 <= n <= 100

def sheep(num)
  if num < 1 || num > 100
    puts '引数nには、1〜100の整数を入れてください'
  else
    numbers = (1..num).to_a
    numbers.each do |number|
      puts "羊が#{number}匹"
    end
  end
end

sheep(0)
sheep(1)
sheep(3)
sheep(5)
sheep(101)
