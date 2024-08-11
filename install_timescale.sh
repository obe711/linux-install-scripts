#!/bin/sh

echo "Installing Timescale DB..."

# Install the latest PostgreSQL packages
sudo apt install gnupg postgresql-common apt-transport-https lsb-release wget

# Run the PostgreSQL package setup script
sudo /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh

# Add the TimescaleDB package
echo "deb https://packagecloud.io/timescale/timescaledb/ubuntu/ $(lsb_release -c -s) main" | sudo tee /etc/apt/sources.list.d/timescaledb.list

# Install the TimescaleDB GPG key
wget --quiet -O - https://packagecloud.io/timescale/timescaledb/gpgkey | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/timescaledb.gpg


# For Ubuntu 21.10 and earlier use the following command:
# wget --quiet -O - https://packagecloud.io/timescale/timescaledb/gpgkey | sudo apt-key add -

# Update your local repository list
sudo apt update

# Install TimescaleDB
sudo apt install timescaledb-2-postgresql-16 postgresql-client-16

# Tune your PostgreSQL instance for TimescaleDB
sudo timescaledb-tune

# Restart PostgreSQL
sudo systemctl restart postgresql

# POST Install - not automated
echo 'PostgresSQL install complete! \n\nTo set security, Login to PostgreSQL as "postgres" and set password \n  
$ sudo -u postgres psql

# set password
\password postgres

# type \q to exit psql

## Next step: Connect to a database on your PostgreSQL instance & Add TimescaleDB to the database

# In PostgreSQL, the default user and database are both postgres. To use a different database, set <database-name> to the name of that database:
$ psql -d "postgres://<username>:<password>@<host>:<port>/<database-name>"

# Add TimescaleDB
CREATE EXTENSION IF NOT EXISTS timescaledb;

# Check that TimescaleDB is installed
\dx

# You see the list of installed extensions:
List of installed extensions
Name     | Version |   Schema   |                                      Description                                      
-------------+---------+------------+---------------------------------------------------------------------------------------
plpgsql     | 1.0     | pg_catalog | PL/pgSQL procedural language
timescaledb | 2.15.1  | public     | Enables scalable inserts and complex queries for time-series data (Community Edition)
'