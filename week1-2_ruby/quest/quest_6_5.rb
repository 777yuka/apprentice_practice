# frozen_string_literal: true

# 繰り返し処理

# 5. フィボナッチ数列(advanced)
# 家事継続日数 n 日に応じて、もらえるお小遣いの金額が増えていく。
# お小遣いの金額条件
# f(0) = 0 円 f(1) = 1円 f(n) = f(n-1) + f(n-2)円 (n ≧ 2)
# 整数 n に対して、n 日間お手伝いを継続した時のお小遣いの金額を算出する関数 fibonacci を定義してください。
# n：整数、1 <= n <= 30

def fibonacci(num)
  # 再帰終了条件
  if num.negative? || num > 30
    raise ArgumentError, '引数nには、0〜30の数値を入れてください'
  elsif num.zero?
    puts '0'
    0
  # 再帰終了条件
  elsif num == 1
    puts '1'
    1
  else
    # aに0を、bに1を代入する
    a, b = 0, 1
    # num-1回ループする
    (num - 1).times do
      # aにbの値を、bにa+bの値を代入する
      a, b = b, a + b
    end
    # bの値を出力する
    puts b
    # bの値を返す
    b
  end
end

fibonacci(0)
fibonacci(1)
fibonacci(2)
fibonacci(3)
fibonacci(4)
fibonacci(7)
fibonacci(30)
