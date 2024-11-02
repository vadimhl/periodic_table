#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
PSQL="psql -X -A --dbname=periodic_table -t --no-align -c"

ELEMENT_INFO(){
   
  DATA=$($PSQL  "select 'The element with atomic number ' || atomic_number || ' is ' || name || ' (' || symbol || '). It''s a ' || type 
   || ', with a mass of ' || atomic_mass || ' amu. ' || name 
   || ' has a melting point of ' || melting_point_celsius || ' celsius and a boiling point of ' 
   || boiling_point_celsius || ' celsius.'
                     from elements left join properties using(atomic_number) 
                                 left join types using(type_id) 
                   where atomic_number =  $1")
  if [[ -z $DATA ]]
  then
    echo I could not find that element in the database.
  else
    echo $DATA
  fi
}
if [[ $1 == "" ]]
then
  echo Please provide an element as an argument
else
  if [[  $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT_INFO $1
  else
    echo "Not a number: $1"
  fi
fi
