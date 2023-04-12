# ブロックを使った配列の処理ができる

# 2. map

# 与えられた整数の配列の要素を2乗した配列を返す square 関数を定義してください。
# なお、map メソッドを使うようにしてください。

numbers = [1, 2, 3, 4, 5]

def square(numbers)
  squared_numbers = numbers.map { |n| n ** 2 }
  print squared_numbers
end

square(numbers)
