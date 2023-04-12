# ブロックを使った配列の処理ができる

# 1. each

# 従業員の名前がID順に配列で渡されるので、IDと従業員の名前をセットにして出力する
# print_names 関数を定義してください。
# なお、each メソッドと with_index メソッドを使うようにしてください。

names = ["中村", "菅田", "本高", "佐々木", "今野", "矢花"]

# def print_names(names)
#   id = 1
#   names.each do |name|
#     puts "#{id}. #{name}"
#     id += 1
#   end
# end

# print_names(names)

def print_names(names)
  names.each_with_index { |name , i| puts "#{i + 1}. #{name}" }
end

print_names(names)