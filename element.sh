#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ $1 == "" ]]
then
  echo Please provide an element as an argument
fi
