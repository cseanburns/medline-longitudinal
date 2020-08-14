# DESCRIPTION:
#
# This script generates a line plot based on multiple searches in multiple PubMed
# databases for a semantically equivalent query. The query is based on an early
# COVID19 search published by NIH/NLM. 
# 
# This script generates Figure 9.

rm(list = ls())
covidqueries <- read.csv("data/covid-pubmed-searches-long.csv", sep = ",")
covidqueries$Date <- as.Date(covidqueries$Date, "%Y-%m-%d")

tiff('plots/fig9-covid-searches.tif', width = 3840, height = 2160, pointsize = 12, res = 300)
plot(covidqueries$Date[covidqueries$Databases=="PubMedLegacyMostRecent"],
     covidqueries$Hits[covidqueries$Databases=="PubMedLegacyMostRecent"],
     type = "o",
     pch = 18,
     col = "#999999",
     xlab = "Dates",
     ylab = "Search Hits",
     xlim = range(covidqueries$Date),
     ylim = range(covidqueries$Hits))

lines(covidqueries$Date[covidqueries$Databases=="PubMedLegacyBestMatch"],
      covidqueries$Hits[covidqueries$Databases=="PubMedLegacyBestMatch"],
      pch = 19,
      col = "#E69F00",
      type = "o")

lines(covidqueries$Date[covidqueries$Databases=="PubMedNew"],
      covidqueries$Hits[covidqueries$Databases=="PubMedNew"],
      pch = 20,
      col = "#56B4E9",
      type = "o")

lines(covidqueries$Date[covidqueries$Databases=="ProQuestPubmed"],
      covidqueries$Hits[covidqueries$Databases=="ProQuestPubmed"],
      pch = 21,
      col = "#009E73",
      type = "o")

lines(covidqueries$Date[covidqueries$Databases=="EBSCOhostPubMed"],
      covidqueries$Hits[covidqueries$Databases=="EBSCOhostPubMed"],
      pch = 22,
      col = "#F0E442",
      type = "o")

lines(covidqueries$Date[covidqueries$Databases=="WebofSciencePubMed"],
      covidqueries$Hits[covidqueries$Databases=="WebofSciencePubMed"],
      pch = 23,
      col = "#0072B2",
      type = "o")
 
lines(covidqueries$Date[covidqueries$Databases=="OvidPubMed"],
      covidqueries$Hits[covidqueries$Databases=="OvidPubMed"],
      pch = 24,
      col = "#D55E00",
      type = "o")

legend("topleft", legend=c("PMLMR", "PMLBM", "PMN",
                       "PrQPM", "EPM", "WSPM", "OPM"),
       col = c("#999999", "#E69F00", "#56B4E9", "#009E73",
               "#F0E442", "#0072B2", "#D55E00"),
       lty=1, cex=0.8, ncol = 1, bty = "n")
dev.off()
