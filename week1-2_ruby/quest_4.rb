# 変数を宣言し代入することができる

# 1. 三角形の面積
# 底辺が x cm、高さが y cm
# 三角形の面積を出力する関数 area を定義してください。
# x：整数、y：整数、1 <= x, y <= 100

1 <= x, y <= 100

def area(bottom, height)

  if bottom < 1 || bottom > 100 || height < 1 || height > 100
    puts "引数x,yには、1以上100以内の整数を入れてください"
  else
    area_of_triangle = (bottom * height) / 2.0
    puts area_of_triangle
  end
end

area(5, 4)
area(7, 5)
area(5, 101)
area(101, 4)
area(0, 0)