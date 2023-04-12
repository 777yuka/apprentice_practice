# 繰り返し処理

# 5. フィボナッチ数列(advanced)
# 家事継続日数 n 日に応じて、もらえるお小遣いの金額が増えていく。
# お小遣いの金額条件
# f(0) = 0 円 f(1) = 1円 f(n) = f(n-1) + f(n-2)円 (n ≧ 2)
# 整数 n に対して、n 日間お手伝いを継続した時のお小遣いの金額を算出する関数 fibonacci を定義してください。
# n：整数、1 <= n <= 30

@memo = {} # 計算済みの項を保存するためのハッシュ

def fibonacci(n)
  # 再帰終了条件
  if n < 0 || n > 30
    puts "引数nには、0〜30の数値を入れてください"
    return
  elsif n == 0
    puts 0
    return 0
  # 再帰終了条件
  elsif n == 1
    puts 1
    return 1
  else
    fibonacci(n - 1) + fibonacci(n - 2)
  end
end

fibonacci(2)


