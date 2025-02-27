#!/bin/bash
if [[ $1 =~ ^00[0-9]{7}$ ]]
then
  echo "NUID valid"
else
  echo "NUID invalid, exitting the program"
  exit 0
fi

if [[ $2 =~ ^[A-Za-z]+\.[A-Za-z0-9]+@northeastern.edu$ ]]
then
  echo "NU email valid"
else
  echo "NU email invalid, exitting the program"
  exit 0
fi

nuid=$((10#$1))
sc1=$(( $nuid % 15))
sc1=$(( 2 * $sc1))
echo -e "Thanks, your email is: $2, \nand your 9 programs to work with are:"
for (( c=1; c<10; c++ ))
do
        increment=$(( 2 * $c))
        code=$(($(($sc1 + $increment)) % 32))
        if [[ $code -lt 10 ]]
        then
        echo "$c. codeN110$code.c"
        else
        echo "$c. codeN11$code.c"
        fi
done
