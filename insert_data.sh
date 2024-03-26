#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo "$($PSQL "TRUNCATE teams,games")"
  teams=()
tail -n +2 games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  winner_found=0
  opponent_found=0
  for name in "${teams[@]}"
  do
    if [[ $name == $WINNER ]];then
      winner_found=1
    fi

    if [[ $name == $OPPONENT ]];then
      opponent_found=1
    fi

    if [[ $winner_found == 1 && $opponent_found == 1 ]];then
      break;
    fi
  done

  if [[ $winner_found == 0 ]];then
    teams+=("$WINNER")
    INSERT_INTO_TEAMS="$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")"
    if [[ $INSERT_INTO_TEAMS=="INSERT 0 1" ]];then
      echo "insert into teams, $WINNER"
    fi
    # echo $WINNER >> .teams
  fi

  if [[ $opponent_found == 0 ]];then
    teams+=("$OPPONENT")
    INSERT_INTO_TEAMS="$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")"
    if [[ $INSERT_INTO_TEAMS=="INSERT 0 1" ]];then
      echo "insert into teams, $OPPONENT"
    fi
    # echo $OPPONENT >> .teams
  fi
    #get winner_id and opponent_id
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    INSERT_INTO_GAMES="$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)")"
    if [[ $INSERT_INTO_GAMES == "INSERT 0 1" ]];then
      echo "insert into games"
    fi
done
