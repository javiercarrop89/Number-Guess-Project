#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

CHECK_INPUT () {
  read INPUT
  if [[ ! $INPUT =~ ^[0-9]+$ ]]
  then
    echo That is not an integer, guess again:
    CHECK_INPUT
  else
    INPUT_NUMBER=$(($INPUT + 0))
  fi
}

PLAY_GAME () {
  RANDOM_NUMBER=$((1 + $RANDOM % 1000))
  echo Guess the secret number between 1 and 1000:
  CHECK_INPUT
  NUMBER_OF_GUESSES=1

  while (( $INPUT_NUMBER != $RANDOM_NUMBER ))
  do
    if (( $INPUT_NUMBER > $RANDOM_NUMBER ))
    then
      echo It\'s lower than that, guess again:
      ((NUMBER_OF_GUESSES++))
      CHECK_INPUT
    else
      echo It\'s higher than that, guess again:
      ((NUMBER_OF_GUESSES++))
      CHECK_INPUT

    fi
  done

  if [[ $INPUT_NUMBER = $RANDOM_NUMBER ]]
  then
    INSERT_GAME=$($PSQL "INSERT INTO games(user_id, number_of_guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES);")
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
  fi
}

echo Enter your username:
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")

if [[ -z $USER_ID ]]
then
  echo Welcome, $USERNAME! It looks like this is your first time here.
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME';")

  PLAY_GAME

else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id=$USER_ID;")
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE user_id=$USER_ID;")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  PLAY_GAME
fi

