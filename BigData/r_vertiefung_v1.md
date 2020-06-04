Big Data in R
========================================================
author: Stefanie Neuenschwander, Sugeelan Selvasingham
date: 05.06.2020
autosize: true

Inhalt
========================================================

- Was ist Big Data?
- Big Data in R
- ff Paket
- Anime Daten
- Vorgehen
- Code

Was ist Big Data?
========================================================
"Big data" is high-volume, -velocity and -variety information assets that demand cost-effective, innovative forms of information processing for enhanced insight and decision making.

Big Data in R
========================================================
- Data > RAM
- Dataset > 2 GB wird schwierig
- int64 Datentyp gibt es nicht
  - (2^31 -1) --> max. 2'147'483'647 Indexierung möglich
- Daumenregel: 2-3x Datasetgrösse

Big Data in R
========================================================
- Probleme
  - RAM/OS Limitierung
  - Lange Bearbeitungszeit
- Lösung
  - Mehr RAM / Teile & herrschen
  - Parallelität
  
Big Data in R
========================================================
- (<2 GB)
  - Lade bestimmte Spalten/Zeilen

- (2-10 GB)
  - bigmemory
  - ff



ff Paket
========================================================
- hilft beim Überwinden des RAM-Problems



Anime Daten
========================================================
- Daten über Zuschauer von Anime
- 9GB gross

```r
summary(mtcars)
```

```
      mpg             cyl             disp             hp       
 Min.   :10.40   Min.   :4.000   Min.   : 71.1   Min.   : 52.0  
 1st Qu.:15.43   1st Qu.:4.000   1st Qu.:120.8   1st Qu.: 96.5  
 Median :19.20   Median :6.000   Median :196.3   Median :123.0  
 Mean   :20.09   Mean   :6.188   Mean   :230.7   Mean   :146.7  
 3rd Qu.:22.80   3rd Qu.:8.000   3rd Qu.:326.0   3rd Qu.:180.0  
 Max.   :33.90   Max.   :8.000   Max.   :472.0   Max.   :335.0  
      drat             wt             qsec             vs        
 Min.   :2.760   Min.   :1.513   Min.   :14.50   Min.   :0.0000  
 1st Qu.:3.080   1st Qu.:2.581   1st Qu.:16.89   1st Qu.:0.0000  
 Median :3.695   Median :3.325   Median :17.71   Median :0.0000  
 Mean   :3.597   Mean   :3.217   Mean   :17.85   Mean   :0.4375  
 3rd Qu.:3.920   3rd Qu.:3.610   3rd Qu.:18.90   3rd Qu.:1.0000  
 Max.   :4.930   Max.   :5.424   Max.   :22.90   Max.   :1.0000  
       am              gear            carb      
 Min.   :0.0000   Min.   :3.000   Min.   :1.000  
 1st Qu.:0.0000   1st Qu.:3.000   1st Qu.:2.000  
 Median :0.0000   Median :4.000   Median :2.000  
 Mean   :0.4062   Mean   :3.688   Mean   :2.812  
 3rd Qu.:1.0000   3rd Qu.:4.000   3rd Qu.:4.000  
 Max.   :1.0000   Max.   :5.000   Max.   :8.000  
```


Slide With Code
========================================================
- 5000 Zeilen laden


```r
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
#tempPath <- "D:/Users/sugeelan/RProject_Anime/TEMP"

outZIP <- "D:/Users/sugeelan/RProject_Anime/Out1"
#tempPath <- tempfile()

## Check Temp path
getOption("fftempdir")
```

```
[1] "C:/Users/sugeelan/AppData/Local/Temp/Rtmp6p952F"
```

```r
## set Temp path
#options("fftempdir" = tempPath)

## Check Temp path again
getOption("fftempdir")
```

```
[1] "C:/Users/sugeelan/AppData/Local/Temp/Rtmp6p952F"
```

```r
animeUserList <- read.table(sourcePath, header = T, sep=",", nrows = 5000)
```

Slide With Plot
========================================================


```
'data.frame':	5000 obs. of  11 variables:
 $ username           : chr  "karthiga" "karthiga" "karthiga" "karthiga" ...
 $ anime_id           : int  21 59 74 120 178 210 232 233 249 269 ...
 $ my_watched_episodes: int  586 26 26 26 26 161 70 78 167 366 ...
 $ my_start_date      : chr  "0000-00-00" "0000-00-00" "0000-00-00" "0000-00-00" ...
 $ my_finish_date     : chr  "0000-00-00" "0000-00-00" "0000-00-00" "0000-00-00" ...
 $ my_score           : int  9 7 7 7 7 7 6 6 8 10 ...
 $ my_status          : int  1 2 2 2 2 2 2 2 2 2 ...
 $ my_rewatching      : int  NA NA NA NA 0 NA NA NA NA NA ...
 $ my_rewatching_ep   : int  0 0 0 0 0 0 0 0 0 0 ...
 $ my_last_updated    : int  1362307973 1362923691 1367081015 1362308037 1364399953 1362923826 1362849882 1362893384 1363709086 1362303563 ...
 $ my_tags            : chr  "" "" "" "" ...
```


![plot of chunk unnamed-chunk-4](r_vertiefung_v1-figure/unnamed-chunk-4-1.png)

Slide With Image
========================================================


```
[1] 5000   11
```

```
 [1] "username"            "anime_id"            "my_watched_episodes"
 [4] "my_start_date"       "my_finish_date"      "my_score"           
 [7] "my_status"           "my_rewatching"       "my_rewatching_ep"   
[10] "my_last_updated"     "my_tags"            
```

sdfasdf
========================================================
asdfafasdfasdf
asdfa
