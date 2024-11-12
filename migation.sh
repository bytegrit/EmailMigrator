#!/bin/bash

# Source the config file for host definitions
source config.sh

# Specify the text file with email-password combinations
file="accounts.txt"

# Check if the accounts file exists
if [[ ! -f "$file" ]]; then
  echo "Error: File $file not found!"
  exit 1
fi

# Read the file and loop through each email with source and destination passwords
while IFS=' ' read -r email source_password dest_password; do
  echo "Migrating $email"
  
  # Run imapsync and capture any error messages
  if imapsync --host1 "$host1" --user1 "$email" --password1 "$source_password" --ssl1 --host2 "$host2" --user2 "$email" --password2 "$dest_password" --ssl2; then
    echo "Migration for $email successful."
  else
    echo "Migration for $email failed." >> migration_errors.log
  fi
done < "$file"

echo "Migration process completed. Check migration_errors.log for any errors."
