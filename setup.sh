#!/bin/sh
###
# By Mat Kovach <mek at mek dot cc>
# 20240325
#
# Create an sqlite database from the Retrosheet schedule files
# https://retrosheet.org/schedule/index.html
#
# requires:
#   * sqlite3 in your path.
#   * unzip with the '-B' write backup files option.
#   * sched.sql - which you should have got with this script.
#
# NOTE:
#   * Any reasonable bourne-type shell should work. Therefore, out 
#     of the box, any Linux and MacOS based system should work. 
#     For Windows, installing WSL Linux should work, and 
#     it should not be hard to convert this to Powershell.
#     Maybe next release
#
#   * These will not delete any files, so the zip and csv files 
#     will be left. If you re-run it, it will skip download a
#     zip file if it is already there, it does not check to see
#     if it changed. If a file did change, simply delete it
#     and re-run the script.
#     
#   * For unziping files, the script will automatically FORCE
#     overwrting an existing file, each time.
#
#   * When you run this script, it will wipe out the current 
#     database and re-create a new on from scratch. 
#
# BUGS:
#   * We should backup the current database before wiping it.
# 
#   * We should add some look up tables for some of the values, 
#     but that is for the next release.
###
set -e  # stop if there is an error.

start_year=1877
end_year=$(date +%Y)

# Get the zips if we need them.
for year in $(seq "$start_year" 1 "$end_year")
do
	echo "Grabbing schedules for $year"
	if [ ! -f ${year}SKED.zip] ; then
		curl -LsSf -O https://www.retrosheet.org/schedule/${year}SKED.zip
	fi
done

# Unzip the zips, overwriting by default
for zipfile in $(ls *.zip)
do
	unzip -B "$zipfile"
done
rm -f *~ # unzip -B creates ~ backup files.

# Wipe out the old database (if present) and create an empty table.
sqlite3 sched.db < sched.sql

# IMPORT ALL THE THINGS!
for csvfile in $(ls *.csv)
do
	echo "importing $csvfile"
	echo ".import --csv --skip 1 $csvfile schedules" | sqlite3 sched.db
done

# Take a bow, we are done.
exit 0
