CTWdata
=======

The University of Leiden teaches a course [Configuring the world](https://www.coursera.org/course/configuringworld "link to configuringworld") on the Cousera platform.
Central in this course are six spreadsheets with data describing the state of 152 countries.

The data scattered over these six spreadsheets were merged into one .csv file.
This file can be imported into statistical packages like R, SAS or SPSS.

CTW Files in this repo
* readme.md      (this file)
* ctw.csv        (the merged data)
* ctw_code_book.rtf  (a simple code book with definitions of the column names)
* ctwAll.xlsx (one Excel sheet containing all data, missing values are empty cells)

## Notes by ctw.csv ##

1. Fields are separated by a **;**
2. The used decimal point symbol is **.**
3.  Missing data are coded with **NA**.

----------

Miscellaneous
======
ISO maintains a list of official country codes and names. The file cIDs.csv (country IDs) contains a database of these codes and names (source: [en.wikipedia](http://en.wikipedia.org/wiki/ISO_3166-1 "ISO 3166" "iso 3166 UK") and [fr.wikipedia](http://fr.wikipedia.org/wiki/ISO_3166-1 "ISO 3166 FR")).
* cIDs.csv       (database containing [ISO 3166-1](http://en.wikipedia.org/wiki/ISO_3166-1 "ISO 3166") codes and names for countries)
* the R-script make_cIDs.R contains all the steps needed to reproduce the creation of cIDs.csv (hence the process is fully documented and reproducible)

The [Gapminder](http://www.gapminder.org/data/ "GAP data") project is a rich source of data. It uses standard [display names to identify countries](http://www.gapminder.org/documentation/documentation/formal-list-of-areas.xlsx "GAP display names"). The file gapCID.csv contains a database of these names and corresponding ISO codes (only countries that have ISO codes are listed).
* gapCID.csv (database of Gapminder display names and their ISO codes)

---------

## Example of ctw.csv use

The file ctw_example_using_Python.ipynb gives an example of how the ctw.csv data can be used for data analysis in Python. 
**Note that this file is viewable on gitHub.**


