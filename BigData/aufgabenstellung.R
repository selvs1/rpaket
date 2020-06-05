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
memory.limit()

#install.packages("ff")
#install.packages("ffbase")
library(ff)
library(ffbase)
library(lubridate)
library(datasets)
library(ggplot2)
library(plotrix)
library(dplyr)

#install.packages("devtools")
#devtools::install_github("edwindj/ffbase2")
library(ffbase2)





## ff Vorbereiten
sourcePath <- "D:/Users/sugeelan/RProject_Anime/myanimelist/UserAnimeList.csv"
tempPath <- "D:/Users/sugeelan/RProject_Anime/TEMP"

outZIP <- "D:/Users/sugeelan/RProject_Anime/Out1"
#tempPath <- tempfile()

## Check Temp path
getOption("fftempdir")

## set Temp path
options("fftempdir" = tempPath)

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

tf <- "D:/Users/sugeelan/RProject_Anime/OutAnimeList.zip"
unpack.ffdf(tf)

tf <- "D:/Users/sugeelan/RProject_Anime/OutUserList.zip"
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
getwd()
setwd("BigData")
############################ Ab hier Data Science #########################################


#animeUserList <- read.table(sourcePath, header = T, sep=",", nrows = 5000)
animeUserList <- anime.ffdf
gradientVal <- nrow(anime.ffdf)*0.3 # Computer vom Bruder: Win7, 64bit, 12 GB RAM --> Maximal kann nur 30% der Daten geladen werden.
animeUserList <- as.ffdf(animeUserList[1:gradientVal,])



# nrow(anime.ffdf)


## Dataframe? sieht hässlich aus
str(animeUserList)

# Dimension
dim(animeUserList)

## Schauen wir uns einmal die Daten in einem kleinen Umfang an
#View(animeUserList)

# Spalten
names(animeUserList)



#Anime Liste laden
csvAnimeList <- "AnimeList.csv"
#animeList <- read.csv(file = csvAnimeList, header = T, sep = ",")
animeList <- animeList.ffdf



#View(animeList)

names(animeList)


# Userlist laden
csvUserList <- "UserList.csv"
#userList <- read.csv(file = csvUserList, header = T, sep = ",")
userList <- userList.ffdf


str(userList)
dim(userList)
#View(userList)







##############################################
##############################################
########## Anime XYZ wir von welcher##########
########## Altersklasse angeschaut  ##########
##############################################
##############################################
##############################################



db <- animeUserList


anime <- animeList


user <- userList



#View(db)
#View(anime)
#View(user)

#rm(list = c("db", "anime", "user", "p11", "p12", "genderData", "female", "male", "mergedAnime", "serie_trimmed", "cleanedAnime", "dfGender",
#            "df", "animeUserList", "userList", "animeList"))


#db <- merge(db, user[c("username", "user_id", "birth_date", "gender")], by = "username")

#anime.ffdf <- merge.ffdf(anime.ffdf, userList.ffdf[c("username", "user_id", "birth_date", "gender")], by = "username")

db <- merge.ffdf(db, user[c("username", "user_id", "birth_date", "gender")], by = "username")

user <- as.data.frame.ffdf(user)
anime <- as.data.frame.ffdf(anime)
db <- as.data.frame.ffdf(db)

# Dragon Ball Z 
#tmp_anime_id <- 813


#db[db$anime_id == tmp_anime_id,]


#t <- ymd(c("1991-08-01", "2020-06-05"))
#t <- unique(db$birth_date)


# Alter [year] angeben
db$birth_date_age <- as.period(interval(start = as.Date(db$birth_date), end = "2020-06-05"), unit = "days")@day/365

#db$birth_date <- as.Date.ff_vector(db$birth_date)

#### FFDF fix

#list1 <- 1:nrow(db)
#list2 <- rep("2020-06-05",length(list1))
#list3 <- cbind(list2, list1)
#list3 <- data.frame(date = list2, number = list1)

#date(db$birth_date[1])

#as.Date(db$birth_date[1]) 



#require(doBy)
#result2 <- ffdfdply(
# x = db[c("username")],
# split = "birth_date",
# FUN = function(x){
#   result <- as.period(interval(start = as.Date(x), end = "2020-06-05"), unit = "days")@day/365
#   result
# })
#
#
#result2 <- ffdfdply(
# x = db[c("username")],
# split = "birth_date",
# FUN = function(x){
#   result <- as.period(interval(start = as.Date(x), end = "2020-06-05"), unit = "days")@day/365
#   return(as.data.frame(result))
# })


#ffiris <- as.ffdf(iris)

#youraggregatorFUN <- function(x){
# result <- as.period(interval(start = as.Date(x), end = "2020-06-05"), unit = "days")@day/365
# return(as.data.frame(result))
#}
#result <- ffdfdply( x = db$birth_date, split = db$user_id,
#                   FUN = function(x) youraggregatorFUN(x),
#                   BATCHBYTES = 5000, trace=TRUE)
#
#str(as.data.frame.ffdf(db))  # 5000
#length(db$user_id)


names(db)




#boxplot(db[db$anime_id == tmp_anime_id,]$birth_date_age)


#rm(list = ls())



#db[db$anime_id == 120,]
unique(db$gender)
db$gender <- factor(db$gender, labels = c("Uknown", "Female", "Male", "Non-Binary"))
p11 <- ggplot(db[db$anime_id == 120,], aes(x = gender, y = birth_date_age)) + geom_boxplot()
p11


####
library(RColorBrewer)

#View(anime)

animeID_member <- anime$anime_id[anime$members == max(anime$members)][1] # Anime mit meisten Members
animeID_rank <- as.integer(table(anime$anime_id[anime$rank == 1]))[1] # Rang 1
animeID_popularity <- anime$anime_id[anime$popularity == 10][1] # Popularität

db <- merge(db, anime[c("anime_id", "title")], by = "anime_id")



#db$anime_id == animeID_member

#db$anime_id == animeID_member 

#tmp <- db[db$anime_id == animeID_member[1], ]



serie_trimmed <- db[which(db$anime_id == animeID_member |
                            db$anime_id == animeID_rank |
                            db$anime_id == animeID_popularity),]
#serie_trimmed$gender.f <- factor(db$gender, labels = c("Uknown", "Female", "Male"))
serie_trimmed$gender.f <- serie_trimmed$gender


p12 <- ggplot(serie_trimmed, aes(x = title, y = birth_date_age, fill = gender.f)) +
  geom_boxplot(alpha = 0.7) +
  scale_y_continuous(name = "Altersverteilung",
                     breaks = seq(18, 36, 6),
                     limits = c(18, 36)) +
  scale_x_discrete(name = "Anime ID") +
  ggtitle("Boxplots für Animes") +
  theme_bw() +
  theme(plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
        text = element_text(size = 12, family = "Tahoma"),
        axis.title = element_text(face = "bold"),
        axis.text.x = element_text(size = 11)) +
  scale_fill_brewer(palette = "Accent")
p12


#########################################


### Fragen


# AnimeList interessante Attribute sind
# anime_id, title, type, rank, popularity, episodes, genre, producer --> wer bringt die besten Anime raus?, source --> mangaleser?, 


# Wer (Mann/Frau) schaut am meisten Anime an? -> Piechart


# Average Rating Typen -> Music, Film, TV -> Balkendiagramm --> Stefanie

# Wie lange braucht der Konsument um Anime ID 3244.. fertig anzuschauen -> my_start_date - my_finish_date -> ??


# Anime XYZ wird von welcher Alterklasse geguckt --> Sugi

# linreg member, popularity, rank

############ ?? ################33
#animeList$genre

#animeList$genre[1]

#x <- strsplit(animeList$genre[1],split = ",")

#trimws(x)

#x <- unlist(lapply(x, trimws))

#str(x)

#x <- c(1,2,1,1,1,1,2,9,19)
#factor(x)
##############################

db <- animeUserList # unser big data
anime <- animeList
user <- userList




mergedAnime <- merge(db, anime)
mergedAnime <- as.data.frame.ffdf(mergedAnime)


# drop useless rows


cleanedAnime <- mergedAnime %>%
  select(-my_tags, -image_url, -title_japanese, -title_synonyms, -background, -broadcast, -related, -opening_theme, -ending_theme)




#View(mergedAnime)


##############################################
########## mean Score per Anime Type #########
##############################################


# schauen welche Anime Typen es gibt
#unique(cleanedAnime$type)



# Scores vorbereiten für Movie, Music, ONA, OVA, Special, TV, Unknown
scoreMovie <- subset(cleanedAnime$score, cleanedAnime$type == "Movie")
scoreMusic <- subset(cleanedAnime$score, cleanedAnime$type == "Music")
scoreONA <- subset(cleanedAnime$score, cleanedAnime$type == "ONA")
scoreOVA <- subset(cleanedAnime$score, cleanedAnime$type == "OVA")
scoreSpecial <- subset(cleanedAnime$score, cleanedAnime$type == "Special")
scoreTV <- subset(cleanedAnime$score, cleanedAnime$type == "TV")
scoreUnknown <- subset(cleanedAnime$score, cleanedAnime$type == "Unknown")


# Averages berechnen
avgScore <- c(mean(scoreMovie), mean(scoreMusic), mean(scoreONA), mean(scoreOVA), mean(scoreSpecial), mean(scoreTV), mean(scoreUnknown))



# data frame aus average scores und types erstellen
df <- data.frame(avgScore, types = c("Movie","Music","ONA","OVA","Special","TV", "Unknown"))



# plot erstellen
ggplot(df, aes(x = types, y = avgScore)) +
  geom_bar(stat = "identity", fill = "blue")




#########################
##### Gender Analyse ####
#########################



# Daten anschauen
unique(user$gender)
user$user_days_spent_watching

user <- as.data.frame.ffdf(user)

# Dataframe mit Gender und user_days_spent_watching
genderData <- user %>%
  select(gender, user_days_spent_watching)

genderData <- user %>%
  select(gender, user_days_spent_watching)



str.ff(unique(db$username))


# nach Frauen und Männern auftrennen
female <- filter(genderData, genderData$gender == "Female")
male <- filter(genderData, genderData$gender == "Male")



# Average
avgDaysSpentWatching <- c(mean(female$user_days_spent_watching), mean(male$user_days_spent_watching))



# data frame erstellen
dfGender <- data.frame(avgDaysSpentWatching, gender = c("Female", "Male"))



# Plot erstellen
pie(avgDaysSpentWatching, labels = dfGender$gender, main = "Schauen Männer oder Frauen mehr Anime?")




pie3D(avgDaysSpentWatching, labels = dfGender$gender, main = "Schauen Männer oder Frauen mehr Anime?")
