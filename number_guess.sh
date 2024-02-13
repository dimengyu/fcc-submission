#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

GUESS_NUMBER() {
  # ask for username
  echo "Enter your username:"
  read USERNAME

  # determine if the user is new user or not
  USERNAME_ID=$($PSQL "SELECT username_id FROM usernames WHERE username = '$USERNAME'")

  if [[ -z $USERNAME_ID ]]
  then 
    # if new user, output welcome message and insert username into usernames table
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    INSERT_USERNAME=$($PSQL "INSERT INTO usernames(username) VALUES('$USERNAME')") 
    USERNAME_ID=$($PSQL "SELECT username_id FROM usernames WHERE username = '$USERNAME'")
  else 
    # if not new user, output welcome message with previous game info
    GAME_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE username_id=$USERNAME_ID")
    BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE username_id=$USERNAME_ID")
    echo "Welcome back, $USERNAME! You have played $GAME_PLAYED games, and your best game took $BEST_GAME guesses."
  fi

  # start a new game by generating a random number to guess
  NUMBER_TO_GUESS=$(( $RANDOM % 1000 + 1 ))
  echo $NUMBER_TO_GUESS

  echo "Guess the secret number between 1 and 1000:"
  read NUMBER_GUESSED

  TIME_GUESSED=1
  while [[ $NUMBER_GUESSED != $NUMBER_TO_GUESS ]] 
  do 
    if [[ ! $NUMBER_GUESSED =~ ^[0-9]+$ ]]
    then 
      echo "That is not an integer, guess again:"
      read NUMBER_GUESSED
    elif [ "$NUMBER_GUESSED" -gt "$NUMBER_TO_GUESS" ]
    then 
      echo "It's higher than that, guess again:"
      read NUMBER_GUESSED
      ((TIME_GUESSED++))
    else [ "$NUMBER_GUESSED" -lt "$NUMBER_TO_GUESS" ]
      echo "It's lower than that, guess again:"
      read NUMBER_GUESSED
      ((TIME_GUESSED++))
    fi
  done 

  # output congratulation message
  echo "You guessed it in $TIME_GUESSED tries. The secret number was $NUMBER_TO_GUESS. Nice job!"

  # insert this game info into table games
  INSERT_NEW_GAME=$($PSQL "INSERT INTO games(username_id, number_of_guesses) VALUES('$USERNAME_ID', '$TIME_GUESSED')")
}

GUESS_NUMBER