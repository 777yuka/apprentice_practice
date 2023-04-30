echo "Enter two numbers:"
read num1
read num2

echo "Choose an arithmetic operation (+, -, *, /):"
read operator

if [[ "$operator" == "+" ]]; then
  result=$(($num1 + $num2))
elif [[ "$operator" == "-" ]]; then
  result=$(($num1 - $num2))
elif [[ "$operator" == "*" ]]; then
  result=$(($num1 * $num2))
elif [[ "$operator" == "/" ]]; then
  if [[ $num2 -eq 0 ]]; then
    echo "Error: division by zero"
    exit 1
  else
    result=$(($num1 / $num2))
  fi
else
  echo "Invalid operator"
  exit 1
fi

echo "The result: $result"
