# retrosheet-schedules

Various Bit of work wit the Retrosheet Schedule Dataset

[Retrosheet](https://www.retrosheet.rog) has a done a usefull data about 
baseball, including [play-by-play](https://www.retrosheet.org/game.htm)
data, [gamelogs](https://www.retrosheet.org/gamelogs/index.html), 
[ejection logs](https://www.retrosheet.org/eject.htm), and 
[schedules](https://www.retrosheet.org/schedule/index.html).

This report is a quick and easy way to grab and import the data files 
into a [SQLite](http://www.sqlite.org) database. 

I have create a [setup](setup.sh) script that will:
 Pull the zip files from 1877 - CURRENT_YEAR-1.
* Unzip files the files.
* Create an empty database using the [sql](sched.sql) file. 
* Load the csv files into the database. 

The SQL file is very basic and should be easy to modify for use in 
any reasonable RMDBS out there. 

The script should work on any reasonable compatible 
[bourne shell](https://en.wikipedia.org/wiki/Bourne_shell). This means
Linux and Mac users should be able to run the shell out of the box. 
Windows users will need to run [WSL](https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux) or install a UNIX-like subsystem. 

__I will be working on a Powershell script, but not at this time.__

There script also assume you have the following in your PATH.

* curl
* unzip (that supports the -B command)
* sqlite3

There are standard utilities that are generally installed by default on 
your Linux system, or can be installed with your package management 
tools (brew for MacOS as them all).
