report-script
=============

A simple script in powershell for doing a nightly report against a database.

Requpirements
=============

7-zip must be installed.

Installation
============

1. Edit the script and enter in all the required credentials and email addresses.
2. Create a directory called "Scripts"
3. Create a directory called "Temp"
4. Create a directory called "Archive"
5. Schedule a job with the working path of where you have the script located and the action set to : powershell.exe -f Report.ps1
6. Do a test run of the scheduled job.

Notes
=====

Any .sql file placed into the Scripts folder will be executed. The results will be saved into a .csv file with the same name as the sql file. At the end it will all be zipped up and emailed to whoever is in the to list.

The results of the previous night's run will be placed into the Archive folder in a dated folder. If you need to go back and review any previous run they will be there. Don't forget to clean out the archive folder every once in a while or you will run out of disk space.
