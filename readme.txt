Vatsim Data Reader

phpVMS module to display online pilot and atc data for a phpVMS based virtual airline.

Released under the following license:
Creative Commons Attribution-Noncommercial-Share Alike 3.0 Unported License
A visible link to http://www.simpilotgroup.com must be provided on any webpage utilizing
this script for the license to be valid.

Developed by:
simpilot
www.simpilotgroup.com

Developed on:
phpVMS v2.1.934-158
php 5.3.4
mysql 5.0.7
apache 2.2.17

Install:

-Download the attached package.
-unzip the package and place the files as structured in your root phpVMS install.

core
--modules
----Vatsim
------Vatsim.php
--templates
----vatsim
------vatsim.tpl

The module will download a text data file from one of four random Vatsim servers
and place it in the root of your install. When the data is called the script will check
to see if the data is over 5 minutes old, if so it will refresh the data with a new file.

Usage:

To show a list of Vatsim online pilot data:

The last parameter ('AAL' in the example) is the id of the airline you are searching for and would like to
display, if you want to show everyone online leave an empty set of single quotes - ''

<?php MainController::Run('Vatsim', 'create_vatsim_data', '!CLIENTS:', 'PILOT', 'AAL'); ?>

To show a count of Vatsim online pilots, the last parameter is used just as the function above

<?php echo MainController::Run('Vatsim', 'count_vatsim_data', '!CLIENTS:', 'PILOT', 'AAL'); ?>

To show a list of Vatsim online atc controllers:

<?php MainController::Run('Vatsim', 'create_vatsim_data', '!CLIENTS:', 'ATC', ''); ?>

To show a count of Vatsim online atc controllers

<?php echo MainController::Run('Vatsim', 'count_vatsim_data', '!CLIENTS:', 'ATC', ''); ?>

The vatsim.tpl file simply shows all the available data to you in a list for each dataset available.
You can display what info you would like and build it into a list, table, or anything else you
would like for your site. 