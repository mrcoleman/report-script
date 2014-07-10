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

