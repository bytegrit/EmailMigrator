#!/bin/bash

# Source the config file for host definitions
source config.sh

# Specify the text file with email-password combinations
file="accounts.txt"

# Read the file and loop through each email-password pair
while IFS=' ' read -r email password; do
  echo "Migrating $email"
  imapsync --host1 "$host1" --user1 "$email" --password1 "$password" --ssl1 --host2 "$host2" --user2 "$email" --password2 "$password" --ssl2
done < "$file"
