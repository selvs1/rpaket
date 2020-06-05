#install.packages("ff")
#install.packages("ffbase")
library(ff)
library(ffbase)
library(lubridate)
library(datasets)
library(ggplot2)
library(plotrix)
library(dplyr)

## ff Vorbereiten
sourcePath <- "D:/Users/sugeelan/RProject_Anime/myanimelist/UserAnimeList.csv"
tempPath <- "D:/Users/sugeelan/RProject_Anime/TEMP"

outZIP <- "D:/Users/sugeelan/RProject_Anime/Out1"
#tempPath <- tempfile()

options("fftempdir" = tempPath)

## Check Temp path
getOption("fftempdir")




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


############################################ ############################################ 
####################################animeList.ffdf##################################### 
############################################ ############################################ 


sourcePath <- "D:/Users/sugeelan/RProject_Anime/myanimelist/AnimeList.csv"


outZIP <- "D:/Users/sugeelan/RProject_Anime/OutAnimeList"
#tempPath <- tempfile()



#### USE ###
############################################ SAVE DATA in Tempfolder
animeList.ffdf <- read.csv.ffdf(file=sourcePath)
#anime.ffdf
#outZIP
outPath <- outZIP

#td <- tempfile()
td <- outPath
tmpFile <- outPath

# save the ffdf into the supplied directory
save.ffdf(animeList.ffdf, dir=td)

# what in the directory?
dir(td)

#remove the ffdf from memory
rm("animeList.ffdf")

# and reload the stored ffdf
load.ffdf(dir=td)

#tf <- paste(tempfile(), ".zip", sep="")
tf <- paste(tmpFile, ".zip", sep="")
packed <- pack.ffdf(file=tf, animeList.ffdf) # 30 Min.

#remove the ffdf from memory
rm("animeList.ffdf")



###################################################### Load Data from Zip file
# restore the ffdf from the packed ffdf
# unter TF ish "D:/Users/sugeelan/RProject_Anime/Out1.zip"
tf <- "D:/Users/sugeelan/RProject_Anime/OutAnimeList.zip"
unpack.ffdf(tf)


############################################ ############################################ 
####################################userList.ffdf##################################### 
############################################ ############################################ 


sourcePath <- "D:/Users/sugeelan/RProject_Anime/myanimelist/UserList.csv"


outZIP <- "D:/Users/sugeelan/RProject_Anime/OutUserList"
#tempPath <- tempfile()



#### USE ###
############################################ SAVE DATA in Tempfolder
userList.ffdf <- read.csv.ffdf(file=sourcePath)
#anime.ffdf
#outZIP
outPath <- outZIP

#td <- tempfile()
td <- outPath
tmpFile <- outPath

# save the ffdf into the supplied directory
save.ffdf(userList.ffdf, dir=td)

# what in the directory?
dir(td)

#remove the ffdf from memory
rm("userList.ffdf")

# and reload the stored ffdf
load.ffdf(dir=td)

#tf <- paste(tempfile(), ".zip", sep="")
tf <- paste(tmpFile, ".zip", sep="")
packed <- pack.ffdf(file=tf, userList.ffdf) # 30 Min.

#remove the ffdf from memory
rm("userList.ffdf")



###################################################### Load Data from Zip file
# restore the ffdf from the packed ffdf
# unter TF ish "D:/Users/sugeelan/RProject_Anime/Out1.zip"
tf <- "D:/Users/sugeelan/RProject_Anime/OutUserList.zip"
unpack.ffdf(tf)

############################################ ############################################ 
####################################  anime.ffdf    ##################################### 
############################################ ############################################ 


sourcePath <- "D:/Users/sugeelan/RProject_Anime/myanimelist/UserAnimeList.csv"


outZIP <- "D:/Users/sugeelan/RProject_Anime/OutUserAnimeList"
#tempPath <- tempfile()



#### USE ###
############################################ SAVE DATA in Tempfolder
#anime.ffdf <- read.csv.ffdf(file=sourcePath)
anime.ffdf <- read.table.ffdf(file=sourcePath, nrows = 500000)
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
tf <- "D:/Users/sugeelan/RProject_Anime/OutUserAnimeList.zip"
unpack.ffdf(tf)


