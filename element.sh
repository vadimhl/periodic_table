#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ $1 == "" ]]
then
  echo Please provide an element as an argument
fi
else
  if [[  $1 =~ ^[0-9]+$ ]]
  then
    echo "Number: $1"
  else
    echo "Not a number: $1"
  fi
fi
