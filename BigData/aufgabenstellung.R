#Aufgabenstellung: 
  
#Möglichkeiten in R mit großen Datenmengen umzugehen zeigen und dabei klären, 
# was Big Data ist

#Für folgende Daten https://www.kaggle.com/azathoth42/myanimelist#UserAnimeList.csv 
# zeigen Sie, 
# wie man diese auswertbar macht mit R-Big Data Funktionen. 
# Machen Sie dazu beschreibende Statistiken

#Links: 
#  https://rstudio.com/resources/webinars/working-with-big-data-in-r/
#  https://rpubs.com/msundar/large_data_analysis


# Kaggle Dataset ist 9 GB gross!!

###################################################################################


#install.packages("ff")
#install.packages("ffbase")
library(ff)
library(ffbase)

## ff Vorbereiten
sourcePath <- "D:/Users/sugeelan/RProject_Anime/myanimelist/UserAnimeList.csv"
#tempPath <- "D:/Users/sugeelan/RProject_Anime/TEMP"

outZIP <- "D:/Users/sugeelan/RProject_Anime/Out1"
#tempPath <- tempfile()

## Check Temp path
getOption("fftempdir")

## set Temp path
#options("fftempdir" = tempPath)

## Check Temp path again
getOption("fftempdir")







#### DO NOT USE ###
################################################################################### skippable
# creating the file
anime.ffdf <- read.csv.ffdf(file=sourcePath) # Achtung dauert 8 Minuten
#anime.ffdf <- as.ffdf(iris)
# creates a ffdf object
class(anime.ffdf)
# ffdf is a virtual dataframe
str(anime.ffdf)
# ffdf object can be treated as any other R object
sum(anime.ffdf[,3])
head(anime.ffdf)
View(anime.ffdf)
anime.ffdf["username"]
factor(anime.ffdf$username)
# Wieviele Benutzer gibt es?
length(unique(anime.ffdf$username))


#### USE ###
            ############################################ SAVE DATA in Tempfolder
anime.ffdf <- read.csv.ffdf(file=sourcePath)
#anime.ffdf
#outZIP
outPath <- outZIP

#td <- tempfile()
td <- outPath
tmpFile <- outPath

# save the ffdf into the supplied directory
save.ffdf(anime.ffdf, dir=td)

# what in the directory?
dir(td)

#remove the ffdf from memory
rm("anime.ffdf")

# and reload the stored ffdf
load.ffdf(dir=td)

#tf <- paste(tempfile(), ".zip", sep="")
tf <- paste(tmpFile, ".zip", sep="")
packed <- pack.ffdf(file=tf, anime.ffdf) # 30 Min.

#remove the ffdf from memory
rm("anime.ffdf")



###################################################### Load Data from Zip file
# restore the ffdf from the packed ffdf
# unter TF ish "D:/Users/sugeelan/RProject_Anime/Out1.zip"
tf <- "D:/Users/sugeelan/RProject_Anime/Out1.zip"
unpack.ffdf(tf)



################## JUHU Daten vollständig geladen in nur 2 Minuten #######################





#### DO NOT USE ###
                    ################################################################# skippable- Save
getOption("fftempdir")
dir(tempPath)
# save the ffdf into the supplied directory
save.ffdf(anime.ffdf, dir = tempPath)
#finalize.ffdf()
# what in the directory?
dir(tempPath)
# remove ffdf from memory
rm(anime.ffdf)

#### DO NOT USE ###
                  #################################################################### skippable- Load

# and reload the stored ffdf
load.ffdf(dir = tempPath)
outPath <- "D:/Users/sugeelan/RProject_Anime/Out1"
tf <- paste(outPath, ".zip", sep = "")
close(anime.ffdf)
is.open(anime.ffdf)
packed <- pack.ffdf(file = tf, anime.ffdf)

#remove the ffdf from memory
rm("anime.ffdf")
# restore the ffdf from the packed ffdf
unpack.ffdf(tf)
anime.ffdf
###################################################################################






######### Use ########

############################ Ab hier Data Science #########################################
aData <- anime.ffdf
bData <- read.table(sourcePath, header = T, sep=",", nrows = 5000)

## Wie sieht der Data aus?
View(aData)
View(bData)

## Dataframe? sieht hässlich aus
str(aData)
str(bData)

# Dimension
dim(aData)
dim(bData)

# Spalten
names(aData)


## Schauen wir uns einmal die Daten in einem kleinen Umfang an

View(bData)
csvAnimeList <- "D:/Users/sugeelan/RProject_Anime/myanimelist/AnimeList.csv"

#Anime Liste laden
animeList <- read.csv(file = csvAnimeList, header = T, sep = ",")

View(animeList)

dim(animeList)
names(animeList)

# AnimeList interessante Attribute sind
# anime_id, title, type, rank, popularity, episodes, genre, producer --> wer bringt die besten Anime raus?, source --> mangaleser?, 



