EmailMigrator
This repository provides a simple and efficient script to migrate emails between two IMAP servers. It reads email and password pairs from a file, then uses imapsync to transfer emails from host1 to host2.

Prerequisites
Bash: Make sure you have a Bash shell to run the script.

imapsync: The script uses imapsync for email migration. You can install imapsync on Linux using:

bash
Copy code
sudo apt-get install imapsync
Project Structure
accounts.txt: Contains email and password pairs (one per line).
config.sh: Stores host information (host1 and host2) for the source and destination servers.
migration.sh: Main migration script that handles reading credentials and performing email migration using imapsync.
Setup
Clone this repository to your local machine.

bash
Copy code
git clone https://github.com/bytegrit/EmailMigrator.git
cd EmailMigrator
Configure Host Information
Edit the config.sh file to specify host1 (source IMAP server) and host2 (destination IMAP server) values.

bash
Copy code
# config.sh
host1="imap.sourcehost.com"
host2="imap.destinationhost.com"
Prepare Accounts File
Create an accounts.txt file in the root directory with email and password pairs, each pair on a new line, separated by a space:

plaintext
Copy code
user1@example.com password1
user2@example.com password2
Make Scripts Executable
Ensure that migration.sh is executable:

bash
Copy code
chmod +x migration.sh
Usage
To initiate the migration process, simply run:

bash
Copy code
./migration.sh
The script will:

Source the config.sh file to get host1 and host2.
Read each line from accounts.txt.
For each email-password pair, use imapsync to sync emails from host1 to host2.
Example Configuration
accounts.txt:

plaintext
Copy code
alice@example.com alice_password
bob@example.com bob_password
config.sh:

bash
Copy code
host1="imap.sourcehost.com"
host2="imap.destinationhost.com"
Additional Notes
Error Handling: Make sure to monitor the output for any errors during migration. If you encounter issues with specific accounts, check the credentials and server configurations.
Security: This script reads plaintext passwords, so it’s best to restrict access to accounts.txt and the scripts.
Password Requirement: For this migration to succeed, passwords must be the same on both host1 and host2. If the passwords differ, update them on one of the servers to match.
License
This project is licensed under the MIT License.