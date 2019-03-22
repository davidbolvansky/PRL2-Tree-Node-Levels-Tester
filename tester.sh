#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

if [ -z "$1" ]
then
    start=1
else
    start=$1
fi

if [ -z "$2" ]
then
    end=256
else
    end=$2
fi

gcc -std=c99 -O3 tester.c -lm -o tester
for i in `seq $start $end`;
do
    RANDOM_STR=$(cat /dev/urandom | tr -dc 'A-Z' | fold -w $i | head -n 1)
    bash test.sh $RANDOM_STR &> out
    ./tester $RANDOM_STR &> ref
    diff out ref
    if [ "$?" == "0" ]
    then
      echo -e "[n = $i] ${GREEN}OK${NC}"
    else
      echo -e "[n = $i] ${RED}BAD${NC}"

    rm out ref
  fi

done