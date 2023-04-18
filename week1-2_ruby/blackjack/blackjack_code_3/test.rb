# def eat(meat = 'beef', vegetable = 'lettuce', topping = 'cheese')
#   puts "ハンバーガーの具材は、#{meat}と#{vegetable}と#{topping}です。"
# end

# eat('pork', 'tomato')

# def eat(meat = 'beef') #'beef'をデフォルト値とする
#   if meat == 'beef' # 引数とデフォルト値の値が等しければ真
#     puts '牛肉は食べられます'
#   else # 引数とデフォルト値の値が等しくなければ偽
#     puts '牛肉以外は食べられません'
#   end
# end

# eat('egg')

# def cook_burger(meat, vegetable = 'lettuce', topping)
#   puts "ハンバーガーの具材は、#{meat}と#{vegetable}と#{topping}です。"
# end

# cook_burger('egg', 'pork')

# def cook_burger(meat = 'beef', vegetable = 'lettuce', topping = 'cheese')
#   puts "ハンバーガーの具材は、#{meat}と#{vegetable}と#{topping}です。"
# end

# cook_burger('egg', 'pork')

# def cook_burger(meat: 'beef', vegetable: 'lettuce', topping: 'cheese')
#   puts "ハンバーガーの具材は、#{meat}と#{vegetable}と#{topping}です。"
# end

# # 期待する出力 => ハンバーガーの具材は、porkとlettuceとeggです。
# cook_burger(meat: 'pork', topping: 'egg')
# cook_burger(topping: 'egg', meat: 'pork')
# => ハンバーガーの具材は、porkとlettuceとeggです。

# def buy_burger(main, drink, potato)
#   puts "#{main}を注文します"
#   if drink
#     puts 'セットに飲み物も注文します。'
#   end
#   if potato
#     puts 'セットにポテトも注文します。'
#   end
# end

# buy_burger('teritama', true, true)

def buy_burger(main, drink:, potato:)
  puts "#{main}を注文します。"
  if drink
    puts 'セットに飲み物も注文します。'
  end
  if potato
    puts 'セットにポテトも注文します。'
  end
end

buy_burger('てりたま', drink: true)
# => てりたまを注文します。
# => セットに飲み物も注文します。
# => セットにポテトも注文します。
