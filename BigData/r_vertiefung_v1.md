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

https://www.gartner.com/en/information-technology/glossary/big-data
https://www.sas.com/de_ch/insights/big-data/what-is-big-data.html

Big Data in R
========================================================
- Data > RAM
- Dataset > 2 GB wird schwierig
- int64 Datentyp gibt es nicht
  - (2^31 -1) --> max. 2'147'483'647 Indexierung möglich
- Daumenregel: RAM 2-3x > Datasetgrösse

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
  - bigmemory, ff
- (10> GB)
  - hadoop, Spark, ..
  - https://rstudio.com/resources/webinars/working-with-big-data-in-r/
  





ff Paket
========================================================
- hilft beim Überwinden des RAM-Problems


-	http://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.487.1317&rep=rep1&type=pdf

Anime Daten
========================================================
- Daten über Zuschauer von Anime
- 9GB gross


Vorgehen
========================================================
1. ff Package testen
2. Problemgrösse verkleinern (5000 Zeiliger Sample)
3. Statistische Modelle vorbereiten
4. Modelle auf Bigdata Datensatz anwenden



Slide With Code
========================================================
- 5000 Zeilen laden



Probleme
========================================================
- 5000 Zeilen laden
- ffdf.data.frame
- data.frame.ffdf
- Rtools -> ZIP Probleme
- Wenig Speicher auf der Festplatte

Probleme
========================================================
- Kaeggle Notepad: 12 GB RAM, 4 GB Disk
- Colab Notepad: 12 GB RAM, 120 GB Disk
- R-Studio Cloud: 1 GB RAM, 1 CPU

