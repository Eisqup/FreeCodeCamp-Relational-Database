#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE teams, games")
echo $($PSQL "ALTER SEQUENCE games_game_id_seq RESTART WITH 1")
echo $($PSQL "ALTER SEQUENCE teams_team_id_seq RESTART WITH 1")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOLAS
do
  if [[ $WINNER != winner ]]
  then
    # get team id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPENENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    # echo $YEAR, $ROUND, $WINNER, $OPPONENT, $WINNER_GOALS
    # ADD winner team to datbase if not excist
    if [[ -z $WINNER_ID ]]
    then
      INSERT_WINNER_ID=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi

    # Add opponent team to database if not excist
    if [[ -z $OPPENENT_ID ]]
    then
      INSERT_OPPENENT_ID=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      OPPENENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi

    # Insert the game
    INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', $WINNER_ID, $OPPENENT_ID, $WINNER_GOALS, $OPPONENT_GOLAS)") 
  
  fi
done
echo "ALL DONE"