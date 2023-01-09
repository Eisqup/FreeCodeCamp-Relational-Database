#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~ Welcome to my Salon ~~~"
echo -e "\nWelcome to My Salon, how can I help you?\n"

MAIN_MENU(){

  if [[ ! -z $1 ]]
    then
    echo -e "$1"
  fi


  # GET ALL SERVICES FROM SQL
  GET_SERVICES=$($PSQL "SELECT * FROM services")
  
  # DISPLAY SERVIES "x) <name>"
  echo -e "$GET_SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done

  # Ask for customer input
  read SERVICE_ID_SELECTED

  # Check if customer input is a number
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU "\nPlease use a valide number. What yould you like to do?\n"

  else

    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

    # Check if user input is a valide service id
    if [[ -z $SERVICE_NAME ]]
    then
      MAIN_MENU "\nI could not find that service. What would you like today?\n"
    
    else
      # ask for customer number
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE

      # Check if customer is in data
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

      # If customer doesn't exist
      if [[ -z $CUSTOMER_NAME ]]
      then

        #ask for customer name
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME

        # Save new customer
        NEW_CUSTOMER_SAVE_SQL=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
      fi

      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

      echo -e "\nWhat time would you like your$SERVICE_NAME,$CUSTOMER_NAME?"
      read SERVICE_TIME

      # Insert appointment
      INSERT_SERVICE_TIME=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES('$CUSTOMER_ID',$SERVICE_ID_SELECTED,'$SERVICE_TIME')")

      #get appointment ID
      APPOINTMENT_ID=$($PSQL "SELECT appointment_id from appointments WHERE customer_id=$CUSTOMER_ID AND time='$SERVICE_TIME' AND service_id=$SERVICE_ID_SELECTED")
      
      # get all data needed from SQL
      CUSTOMER_APPOINTMENT=$($PSQL "SELECT a.time, c.name, s.name FROM appointments AS a INNER JOIN customers AS c USING (customer_id) INNER JOIN services AS s USING (service_id) WHERE a.appointment_id=$APPOINTMENT_ID")
      
      # print appointment information to the customer
      echo $CUSTOMER_APPOINTMENT | while read TIME BAR C_NAME BAR S_NAME
      do
        echo -e "\nI have put you down for a $S_NAME at $TIME, $C_NAME."
      done

    fi
  fi
}

MAIN_MENU