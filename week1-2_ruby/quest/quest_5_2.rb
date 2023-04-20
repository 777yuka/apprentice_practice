# frozen_string_literal: true

# 条件分岐を使うことができる

# 2. 電車の料金
# 年齢に応じて東京駅から新宿駅までの料金を出力する関数 train_fare を定義してください。
# 12歳以上は大人料金で200円
# 6歳以上12歳未満はこども料金で100円
# 6歳未満は幼児で無料

def train_fare(age)
  adult_price_minimum_age = 12
  child_price_minimum_age = 6
  adult_price = 200
  child_price = 100
  infant_price = 0

  if age >= adult_price_minimum_age
    puts adult_price
  elsif age >= child_price_minimum_age
    puts child_price
  else
    puts infant_price
  end
end

train_fare(12)
train_fare(6)
train_fare(5)
