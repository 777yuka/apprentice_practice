# ブロックを使った配列の処理ができる

# 3. select

# 整数の配列から偶数を抽出した配列を返す関数 select_even_numbers を作成してください。
# なお、select メソッドを使うようにしてください。


def select_even_numbers(numbers)
  even_numbers = numbers.select { |n| n.even? }
  p even_numbers
end

even_numbers = select_even_numbers([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])