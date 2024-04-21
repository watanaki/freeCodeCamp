#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\n~~~ MY SALON ~~~\n"
echo -e "Welcome to My Salon, how can I help you?\n"

MAIN_MENU(){
  if [[ $1 ]];then
    echo -e "\n$1"
  fi

  SERVICES=$($PSQL "SELECT * FROM services")
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  read SERVICE_ID_SELECTED
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_NAME ]];then
    MAIN_MENU "I could not find that service. What would you like today?\n"
  else
    SERVICE $SERVICE_NAME $SERVICE_ID_SELECTED
  fi
}

SERVICE(){
  echo "What's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'" | sed 's/^ //') 
  if [[ -z $CUSTOMER_NAME ]];then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_A_CUSTOMER=$($PSQL "INSERT INTO customers (phone,name) VALUES ('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
    if [[ "$INSERT_A_CUSTOMER" != "INSERT 0 1" ]];then
      echo -e "ERROR! Failed to insert the customer!"
      return;
    fi
  fi
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE name='$CUSTOMER_NAME'")
echo -e "查询到的顾客ID: $CUSTOMER_ID"
  echo -e "\nWhat time would you like your $1, $CUSTOMER_NAME?"
  read SERVICE_TIME
  INSERT_AN_APPOINTMENT=$($PSQL "INSERT INTO appointments (customer_id,service_id,time) VALUES ($CUSTOMER_ID,$2,'$SERVICE_TIME')")
  if [[ "$INSERT_AN_APPOINTMENT" == "INSERT 0 1" ]];then
  echo -e "\nI have put you down for a $1 at $SERVICE_TIME, $CUSTOMER_NAME." 
  fi
}
MAIN_MENU
