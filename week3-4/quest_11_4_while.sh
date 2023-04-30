i=1

while [ $i -le 100 ]
do
  if (( $i % 2 == 0 ))
  then
    echo $i
  fi
  ((i++))
done
