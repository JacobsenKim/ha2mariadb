#!/bin/bash
#
# Domain: https://github.com/JacobsenKim/ha2mariadb
# Wiki: https://github.com/JacobsenKim/ha2mariadb/wiki
# Discussions: https://github.com/JacobsenKim/ha2mariadb/discussions
#
# sql_import_remote.sh
#
# Usage: ./sql_import_remote.sh <MYSQL_HOST>
#
# Provide MYSQL_HOST as a command line argument when running the script.
#
# MySQL connection parameters
MYSQL_USER="homeassistant"
MYSQL_HOST="$1"
MYSQL_DB="homeassistant"
MYSQL_CHARSET="utf8mb4"
Foreign_Key_Checks="SET foreign_key_checks = 1;" # 1 = on, 0 = off
Continue_On_Error="0" # 1 = continue, 0 = stop

# Directory containing SQL files
SQL_DIR="$HOME/ha2mariadb/output"
SQL_DIR_successful="$SQL_DIR/successful"
# Log file
LOG_FILE="$SQL_DIR/0000_a_sql_import_remote.log"
DATE="$(date)"

# Check if the IP is provided as an argument
if [ -z "$1" ]; then
    echo "Usage: ./$0 192.168.X.X <---- your IP"
    echo "The user $MYSQL_USER and DB $MYSQL_DB is used in this script"
    echo -e "\a"
    exit 1
fi

# Create target folder if it doesn't exist
mkdir -p "$SQL_DIR_successful"

#MYSQL_PASSWORD=lasy_password_her
# Prompt for the MySQL password without echoing the input
echo -e "\a"
echo -n "Enter password for User: $MYSQL_USER and DB: $MYSQL_DB Password: "
read -s MYSQL_PASSWORD
echo ""

# Print the start time
echo "$DATE Import started Host: $MYSQL_HOST DB: $MYSQL_DB" >> "$LOG_FILE"
echo "$DATE Import started Host: $MYSQL_HOST DB: $MYSQL_DB"

# Connect to MySQL and import SQL files
for file in "$SQL_DIR"/*.sql; do
    # Skip non-SQL files
    [ -f "$file" ] || continue

    # Import SQL file
    echo "Importing $file ..."
    echo "Importing $file at $DATE" >> "$LOG_FILE"

    # Execute MySQL command securely
    output=$(mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -h "$MYSQL_HOST" --default-character-set="$MYSQL_CHARSET" "$MYSQL_DB" --init-command="$Foreign_Key_Checks" < "$file" 2>&1)
    import_status=$?

    if [ $import_status -ne 0 ]; then
        error_message=$(echo "$output" | tail -n 1)  # Get the last line of the output as the error message
        echo "SQL: $error_message"
        echo "SQL: $error_message" >> "$LOG_FILE"
        echo "WARNING: Importing $file at $DATE"
        echo "WARNING: Importing $file at $DATE" >> "$LOG_FILE"
        
        # Check if Continue_On_Error is set to 0 (stop)
        if [ "$Continue_On_Error" -eq 0 ]; then
            echo "Stopping script due to error. Log: $LOG_FILE"
            exit 1
        fi
    else
        # Move the file to the successful directory
        mv "$file" "$SQL_DIR_successful"
        echo "successful $file at $DATE"
        echo "successful $file at $DATE" >> "$LOG_FILE"
    fi
done

# Commit changes
# Ensures that any changes made during the import process are committed and permanently saved in the MySQL database.
# This is an important step to finalize the transaction.
echo "COMMIT;" | mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -h "$MYSQL_HOST" "$MYSQL_DB"

# Print the end time
echo "$(date) Import completed Host: $MYSQL_HOST DB: $MYSQL_DB" >> "$LOG_FILE"
echo "###########################################################################" >> "$LOG_FILE"
echo "$(date) Import completed Host: $MYSQL_HOST DB: $MYSQL_DB"

# Prompt user for AUTO_INCREMENT option
echo ""
echo "Y the first time, n the second time one runs this script."
echo ""
echo -e "\a"
read -p "Do you want the AUTO_INCREMENT numbers? (Y/n): " answer
case ${answer:0:1} in
    y|Y )
        auto_increment="YES"

        # List of SQL queries and their corresponding table names
        queries=(
            "SELECT MAX(event_id) + 1 AS Count FROM events;"
            "SELECT MAX(data_id) + 1 AS Count FROM event_data;"
            "SELECT MAX(event_type_id) + 1 AS Count FROM event_types;"
            "SELECT MAX(run_id) + 1 as Count FROM recorder_runs;"
            "SELECT MAX(change_id) + 1 AS Count FROM schema_changes;"
            "SELECT MAX(state_id) + 1 AS Count FROM states;"
            "SELECT MAX(metadata_id) + 1 AS Count FROM states_meta;"
            "SELECT MAX(attributes_id) + 1 AS Count FROM state_attributes;"
            "SELECT MAX(id) + 1 AS Count FROM statistics;"
            "SELECT MAX(id) + 1 AS Count FROM statistics_meta;"
            "SELECT MAX(run_id) + 1 AS Count FROM statistics_runs;"
            "SELECT MAX(id) + 1 AS Count FROM statistics_short_term;"
        )

        # Execute queries and process output
        for query in "${queries[@]}"; do
            echo "Executing query: $query" >> "$LOG_FILE" # Add this line for debugging
            # Execute the query and capture the output
            query_result=$(mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -h "$MYSQL_HOST" "$MYSQL_DB" -s -N -e "$query")
            
            # Output the result
            table_name=$(echo "$query" | awk -F ' ' '{print $4}')
            echo "$query_result" >> "$LOG_FILE"
            echo "$query_result"
        done

echo "########## Next step: ##########"
echo "Edit the file z9_grep_mysql_importme_last.sql with the numbers above."
echo "Copy the file to /home/USER_NAME/ha2mariadb/output and"
echo "Run the ./sql_import_remote.sh <MYSQL_HOST> once more to finish the Import"
echo "If one has edited and imported the file z9_grep_mysql_importme_last.sql successfully,"
echo "Now one can activate MariaDB in homeassistant configuration.yaml; the merge is completed."

        ;;
    * )
        auto_increment="NO"
        ;;
esac

echo -e "\a"
