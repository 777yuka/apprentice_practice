# 繰り返し処理

# 4. 総和
# 2つの整数 x と y が与えられ、x から y までの足し算の結果を出力する関数 sum を定義してください。

def sum(x, y)
  numbers = (x..y).to_a
  sum = 0
  if x < 1 || x > 100 || y < 1 || y > 100 || (x >= y)
    puts "xとyには1〜100の整数を入れてください。また、xはyより小さい整数をいれてください。"
  else
    numbers.each do |n|
      sum += n
    end
    puts sum
  end
end

sum(10, 80)
sum(80, 10)
sum(50, 101)
sum(0, 99)
