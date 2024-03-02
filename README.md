# ha2mariadb
Homeassistant Sqlite to mariaDB merger


```
######################################################################
# If one dont have "sqlite3" then one need to install it

# $ sudo apt install sqlite3 -y
#
# First one need to do a dump of the db......
#
# copy home-assistant_v2.db file to this ~/home/ha2mariadb/ then from the same folder:
#
# $ sqlite3 home-assistant_v2.db .dump > sqlite3_dbfile_.dump.sql
#
########## Clean and split big files.
#
# $ chmod +x grep_sql_data.sh
#
# $ ./grep_sql_data.sh sqlite3_dbfile_.dump.sql
#
########## Import remote to homeassistant
#
# Now trancfer the file to our homeassistant mariaDB (DB name: homeassistant user: homeassistant)
#
# $ chmod +x sql_import_remote.sh
#
# $ ./sql_import_remote.sh your_db_IP
#
# It will promt for PASSWORD to the mariaDB (DB name: homeassistant user: homeassistant)
#
######################################################################

```
