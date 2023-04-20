# frozen_string_literal: true

# ハッシュを使うことができる

# 2. 首都
# 国名と首都名が組み合わせになったハッシュに対して、
# "#{国名}の首都は#{首都名}です"と出力する関数 print_capitals を作成してください。

def print_capitals(capitals)
  capitals.each do |country, capital|
    puts "#{country}の首都は#{capital}です"
  end
end

print_capitals({ '日本' => '東京', '韓国' => 'ソウル' })
