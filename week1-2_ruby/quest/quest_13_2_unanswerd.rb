# frozen_string_literal: true

# 例外処理を使うことができる

## 2. 電卓

# 例外処理の付いた電卓プログラムを作成してください。
# このプログラムでは、2つの数値と演算子（+、-、*、/）を引数として受け取り、演算を実行して結果を出力します。
# ゼロで割ったり、無効な演算子を入力したりといった潜在的なエラーを処理するために、例外処理を追加します。

# - num1、num2、kの3つのパラメータを受け取るcalculateという関数を作成する。
# この関数は、対応する演算を実行し、結果を返す必要があります。

# ▼インプット

# num1：整数
# num2：整数
# operator：文字列

# ▼アウトプット

# num2 が 0 で割り算が実行されたときには ZeroDivisionError が発生し、"ゼロによる割り算は許可されていません" と出力してください。
# num1、num2 が整数以外の場合は "num1、 num2 には整数を入力してください" と出力してください。
# operator が +、-、*、/ の場合は、"演算子には  +、-、*、/ のいずれかを使用してください" と出力してください。
# それ以外の演算を実行し、結果を出力してください。

def calculate(num1, num2, operator)
  # num1、num2が整数でない場合は例外を発生させる
  raise ArgumentError, 'num1、num2には整数を入力してください' unless num1.is_a?(Integer) && num2.is_a?(Integer)
  # operatorが +、-、*、/ 以外の場合は例外を発生させる
  raise ArgumentError, '演算子には +、-、*、/ のいずれかを使用してください' unless ['+', '-', '*', '/'].include?(operator)

  case operator
  when '+'
    num1 + num2
  when '-'
    num1 - num2
  when '*'
    num1 * num2
  when '/'
    # num2が0の場合は例外を発生させる
    raise ZeroDivisionError, 'ゼロによる割り算は許可されていません' if num2.zero?

    num1 / num2
  end
end

puts '1番目の整数を入力してください:'
num1 = gets.chomp.to_i

puts '2番目の整数を入力してください:'
num2 = gets.chomp.to_i

puts '演算子(+, -, *, /)を入力してください:'
operator = gets.chomp

begin
  result = calculate(num1, num2, operator)
  puts result
rescue ArgumentError, ZeroDivisionError => e
  puts e.message
end

# ▼サンプル呼び出し
# calculate(1, 0, '/')
# calculate(1.5, 2, '+')
# calculate(1.5, 2, '**')
# calculate(5, 2, '*')

# ▼サンプルアウトプット
# ゼロによる割り算は許可されていません
# num1、 num2 には整数を入力してください
# 演算子には  +、-、*、/ のいずれかを使用してください
# 10
