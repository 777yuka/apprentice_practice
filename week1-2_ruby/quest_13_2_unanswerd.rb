# frozen_string_literal: true

# 例外処理を使うことができる

## 2. 電卓

# 例外処理の付いた電卓プログラムを作成してください。
# このプログラムでは、2つの数値と演算子（+、-、*、/）を引数として受け取り、演算を実行して結果を出力します。
# ゼロで割ったり、無効な演算子を入力したりといった潜在的なエラーを処理するために、例外処理を追加します。

# - num1、num2、operatorの3つのパラメータを受け取るcalculateという関数を作成する。
# この関数は、対応する演算を実行し、結果を返す必要があります。

▼インプット

num1：整数
num2：整数
operator：文字列

▼アウトプット

num2 が 0 で割り算が実行されたときには ZeroDivisionError が発生し、"ゼロによる割り算は許可されていません" と出力してください。
num1、num2 が整数以外の場合は "num1、 num2 には整数を入力してください" と出力してください。
operator が +、-、*、/ の場合は、"演算子には  +、-、*、/ のいずれかを使用してください" と出力してください。
それ以外の演算を実行し、結果を出力してください。


def calculate(num1, num2, operator)
  # クラスを完成させてください
end

puts "1番目の整数を入力してください:"
num1 = gets.chomp.to_f

puts "2番目の整数を入力してください:"
num2 = gets.chomp.to_f

puts "演算子(+, -, *, /)を入力してください:"
operator = gets.chomp

begin
  result = calculate(num1, num2, operator)
  puts result
rescue # 例外処理を記載してください
  
end

▼サンプル呼び出し
calculate(1, 0, '/')
calculate(1.5, 2, '+')
calculate(1.5, 2, '**')
calculate(5, 2, '*')

▼サンプルアウトプット
ゼロによる割り算は許可されていません
num1、 num2 には整数を入力してください
演算子には  +、-、*、/ のいずれかを使用してください
10
