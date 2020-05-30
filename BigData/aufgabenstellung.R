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
tempPath <- "D:/Users/sugeelan/RProject_Anime/TEMP"
tempPath <- tempfile()

## Check Temp path
getOption("fftempdir")

## set Temp path
options("fftempdir" = tempPath)

## Check Temp path again
getOption("fftempdir")

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


####### Test
#iris.ffdf <- as.ffdf(iris)

#td <- tempfile()
#td <- tempPath

# save the ffdf into the supplied directory
#save.ffdf(iris.ffdf, dir=td)


# what in the directory?
#dir(td)

#remove the ffdf from memory
#rm("iris.ffdf")

# and reload the stored ffdf
#load.ffdf(dir=td)

#tf <- paste(td, ".zip", sep="")
#close(iris.ffdf)
#packed <- pack.ffdf(file=tf, iris.ffdf)

#remove the ffdf from memory
#rm("iris.ffdf")

# restore the ffdf from the packed ffdf
#unpack.ffdf(tf)

#iris.ffdf

####### \test



#################################################################################### skippable- Save

getOption("fftempdir")


dir(tempPath)

# save the ffdf into the supplied directory
save.ffdf(anime.ffdf, dir = tempPath)
#finalize.ffdf()

# what in the directory?
dir(tempPath)

# remove ffdf from memory
rm(anime.ffdf)




#################################################################################### skippable- Load

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


aData <- anime.ffdf

## Wie sieht der Data aus?
View(aData)

## Dataframe? sieht hässlich aus
str(aData)

# Dimension
dim(aData)

# Spalten
names(aData)


str(anime.ffdf[1:10,])





