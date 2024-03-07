#!/bin/bash
# v.1.0.0
# Domain: https://github.com/JacobsenKim/ha2mariadb
# Wiki: https://github.com/JacobsenKim/ha2mariadb/wiki
# Discussions: https://github.com/JacobsenKim/ha2mariadb/discussions
#
# $ chmod +x grep_sql_data.sh
#
# Run the script like this:
#
# $ ./grep_sql_data.sh sqlite3_dbfile_.dump.sql
#
##########################################################

SOURCE_FILE="./$1"
TARGET_FOLDER="$HOME/ha2mariadb/output"
LOG_FILE="$TARGET_FOLDER/a0_grep_sql_data.log"

# Create target folder if it doesn't exist
mkdir -p "$TARGET_FOLDER/split"

echo "Source file: $SOURCE_FILE $(date)"

# Define a function to perform both grep and split operations
grep_and_split() {
    grep_pattern="$1"
    table_name="$2"
    
    # Perform grep operation
    grep "$grep_pattern" "$SOURCE_FILE" > "$TARGET_FOLDER/grep_$table_name.sql"

    # Split the grep output file if it exceeds 50000 lines
    if [ $(wc -l < "$TARGET_FOLDER/grep_$table_name.sql") -gt 50000 ]; then
        split -d -a 4 -l 50000 --additional-suffix=.sql "$TARGET_FOLDER/grep_$table_name.sql" "$TARGET_FOLDER/split/split_$table_name"_
    fi
}

# Call the function for each table
grep_and_split 'INSERT INTO statistics VALUES' statistics
grep_and_split 'INSERT INTO event_data VALUES' event_data
grep_and_split 'INSERT INTO state_attributes VALUES' state_attributes
grep_and_split 'INSERT INTO statistics_meta VALUES' statistics_meta
grep_and_split 'INSERT INTO recorder_runs VALUES' recorder_runs
grep_and_split 'INSERT INTO schema_changes VALUES' schema_changes
grep_and_split 'INSERT INTO statistics_runs VALUES' statistics_runs
grep_and_split 'INSERT INTO events VALUES' events
grep_and_split 'INSERT INTO statistics_short_term VALUES' statistics_short_term
grep_and_split 'INSERT INTO states VALUES' states
grep_and_split 'INSERT INTO event_types VALUES' event_types
grep_and_split 'INSERT INTO states_meta VALUES' states_meta

cp ./a0_homeassistant_custom_tables.sql ./output/a0_homeassistant_custom_tables.sql
# cp ./z9_grep_mysql_importme_last.sql ./output/z9_grep_mysql_importme_last.sql
echo "Finish.... $(date)"
echo -e "\a"
