#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

if [[ $1 ]]
then
  if [[ $1 =~ ^[0-9]+$ ]]
  then 
    atomic_number=$($PSQL "select atomic_number from elements where atomic_number=$1")
  else 
    atomic_number=$($PSQL "select atomic_number from elements where symbol='$1' or name='$1'")
  fi 

  if [[ -z $atomic_number ]] 
  then 
    echo "I could not find that element in the database."
  else 
    name=$($PSQL "select name from elements where atomic_number=$atomic_number")
    symbol=$($PSQL "select symbol from elements where atomic_number=$atomic_number")
    type_id=$($PSQL "select type_id from properties where atomic_number=$atomic_number")
    type=$($PSQL "select type from types where type_id='$type_id'")
    mass=$($PSQL "select atomic_mass from properties where atomic_number=$atomic_number")
    melting=$($PSQL "select melting_point_celsius from properties where atomic_number=$atomic_number")
    boiling=$($PSQL "select boiling_point_celsius from properties where atomic_number=$atomic_number")
    echo -e "The element with atomic number $atomic_number is $name ($symbol). It's a $type, with a mass of $mass amu. $name has a melting point of $melting celsius and a boiling point of $boiling celsius."
  fi
else 
  echo -e "Please provide an element as an argument."
fi
