
# EmailMigrator

EmailMigrator is a Bash-based script for migrating emails between two IMAP servers. It reads email and password pairs from a file and uses `imapsync` to transfer emails from `host1` to `host2`.

## Prerequisites

Ensure that you have the following prerequisites installed on your system:

```bash
sudo apt-get install imapsync
```

## Project Structure

- `accounts.txt` - Contains email and password pairs (one per line).
- `config.sh` - Stores host information (`host1` and `host2`) for the source and destination servers.
- `migration.sh` - Main migration script that reads credentials and performs email migration using `imapsync`.

## Setup

1. **Clone this repository** to your local machine:

   ```bash
   git clone https://github.com/bytegrit/EmailMigrator.git
   cd EmailMigrator
   ```

2. **Configure Host Information**  
   Edit the `config.sh` file to specify `host1` (source IMAP server) and `host2` (destination IMAP server) values.

   ```bash
   # config.sh
   host1="imap.sourcehost.com"
   host2="imap.destinationhost.com"
   ```

3. **Prepare Accounts File**  
   Create an `accounts.txt` file in the root directory with email and password pairs, each pair on a new line, separated by a space:

   ```plaintext
   user1@example.com password1
   user2@example.com password2
   ```

4. **Make Scripts Executable**  
   Ensure that `migration.sh` is executable:

   ```bash
   chmod +x migration.sh
   ```

## Usage

Run the migration script to start migrating emails:

```bash
./migration.sh
```

The script will:

1. Source the `config.sh` file to get `host1` and `host2`.
2. Read each line from `accounts.txt`.
3. For each email-password pair, use `imapsync` to sync emails from `host1` to `host2`.

## Example Configuration

Example for `accounts.txt`:

```plaintext
alice@example.com alice_password
bob@example.com bob_password
```

Example for `config.sh`:

```bash
host1="imap.sourcehost.com"
host2="imap.destinationhost.com"
```

## Additional Notes

- **Error Handling**: Monitor the output for any errors during migration. If you encounter issues with specific accounts, check the credentials and server configurations.
- **Security**: This script reads plaintext passwords, so it’s best to restrict access to `accounts.txt` and the scripts.
- **Password Requirement**: For the migration to succeed, passwords must be the same on both `host1` and `host2`. If they differ, update them on one of the servers to match.

## License

[MIT](https://choosealicense.com/licenses/mit/)
