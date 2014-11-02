#####################################################################################
#
#   make_cIDs.R is a R script that:
#   - reads data from Wikipedia into two tables (one English UK and one French FR) 
#   - merges data from both tables into one table AUX
#     - each row in AUX contains standard ISO codes and names for a country
#     - there are data for 249 countries and teritories
#   - writes the data from AUX to a .csv file cIDs.csv
#   - cIDs.csv can be imported into softwate packages (R, SPSS, SAS, Exel etc.)  
#
#   This R-script executes all steps in a fully reproducable and automated way
#
#   AUTHOR: Wilko Dijkhuis
#   DATE  : 2 november 21014
#
####################################################################################

library(XML)

#------ download oficial ISO codes from the web (1nov2014) --------------- 

#------- english version of iso code table ------------
url <- 'http://en.wikipedia.org/wiki/ISO_3166-1' 
UK <- readHTMLTable(url, which=1, stringsAsFactors = FALSE)
#-------- give managable column names ---------
names(UK)[1] <- "uk1"
names(UK)[2] <- "uk2"
names(UK)[3] <- "uk3"
names(UK)[4] <- "uk4"
names(UK)[5] <- "uk5"


# ---- remove the doubling of names after the ! in uk1 ------------
library(stringr)

for(cnt in 1:dim(UK)[1]) 
{
  if(str_detect(UK[cnt,1]," !")) 
  {
    repl = str_replace(UK[cnt,1], "(.*) !.*", "\\1" )
    #print( repl )
    UK[cnt,1] <- repl
    #print(UK[cnt,1])
  }
}


#------- french version of iso code table ------------
url <- 'http://fr.wikipedia.org/wiki/ISO_3166-1' 
FR <- readHTMLTable(url, which=2, , stringsAsFactors = FALSE)
#-------- give managable column names ---------
names(FR)[1] <- "fr1"
names(FR)[2] <- "fr2"
names(FR)[3] <- "fr3"
names(FR)[4] <- "fr4"
names(FR)[5] <- "fr5"
names(FR)[6] <- "fr6"
names(FR)[7] <- "fr7"


#----- join the FR and UK tables + put columns in right order -------- 
library(sqldf)

AUX <- sqldf("
  SELECT fr2, uk1, fr3, fr1, uk1, fr5, fr6
  FROM FR, UK
  WHERE UK.uk3 = FR.fr2
  ORDER BY 1
  ")


#------- give meaningfull names to colums --------
names(AUX)[1] <- "cID"
names(AUX)[2] <- "country"
names(AUX)[3] <- "alpha2code"
names(AUX)[4] <- "numCode"
names(AUX)[5] <- "nameUK"
names(AUX)[6] <- "nameFR"
names(AUX)[7] <- "nameISO"


#---- give common names to selected contries --------
AUX[ 32,2] <- "Bolivia"
AUX[ 75,2] <- "Falklands"
AUX[ 78,2] <- "Micronesia"
AUX[108,2] <- "Iran"
AUX[123,2] <- "South Korea"
AUX[125,2] <- "Laos"
AUX[140,2] <- "Moldova"
AUX[145,2] <- "Macedonia"
AUX[182,2] <- "North Korea"
AUX[185,2] <- "Palestine"
AUX[190,2] <- "Russia"
AUX[215,2] <- "Syria"
AUX[223,2] <- "East Timor"
AUX[229,2] <- "Taiwan"
AUX[230,2] <- "Tanzania"
AUX[237,2] <- "Vatican City"
AUX[239,2] <- "Venezuela"


#------- write results to output file cIDs.csv ------------------
write.csv(AUX, file='cIDs.csv', row.names=FALSE)

