covidqueries <- read.csv("data/covid-pubmed-searches-long.csv", sep = ",")
covidqueries$Date <- as.Date(covidqueries$Date, "%Y-%m-%d")

tiff('plots/fig9-covid-searches.tif', width = 3840, height = 2160, pointsize = 12, res = 300)
plot(covidqueries$Date[covidqueries$Databases=="PubMedLegacyMostRecent"],
     covidqueries$Hits[covidqueries$Databases=="PubMedLegacyMostRecent"],
     type = "b",
     pch = 19,
     col = "red",
     xlab = "Dates",
     ylab = "Search Hits",
     xlim = range(covidqueries$Date),
     ylim = range(covidqueries$Hits))

lines(covidqueries$Date[covidqueries$Databases=="PubMedLegacyBestMatch"],
      covidqueries$Hits[covidqueries$Databases=="PubMedLegacyBestMatch"],
      pch = 19,
      col = "orange",
      type = "b")

lines(covidqueries$Date[covidqueries$Databases=="PubMedNew"],
      covidqueries$Hits[covidqueries$Databases=="PubMedNew"],
      pch = 19,
      col = "black",
      type = "b")

lines(covidqueries$Date[covidqueries$Databases=="ProQuestPubmed"],
      covidqueries$Hits[covidqueries$Databases=="ProQuestPubmed"],
      pch = 19,
      col = "blue",
      type = "b")

lines(covidqueries$Date[covidqueries$Databases=="EBSCOhostPubMed"],
      covidqueries$Hits[covidqueries$Databases=="EBSCOhostPubMed"],
      pch = 19,
      col = "green",
      type = "b")

lines(covidqueries$Date[covidqueries$Databases=="WebofSciencePubMed"],
      covidqueries$Hits[covidqueries$Databases=="WebofSciencePubMed"],
      pch = 19,
      col = "gray",
      type = "b")
 
lines(covidqueries$Date[covidqueries$Databases=="OvidPubMed"],
      covidqueries$Hits[covidqueries$Databases=="OvidPubMed"],
      pch = 19,
      col = "purple",
      type = "b")

legend("topleft", legend=c("PMLMR", "PMLBM", "PMN",
                       "PrQPM", "EPM", "WSPM", "OPM"),
       col = c("red", "orange", "black", "blue", "green", "gray", "purple"),
       lty=1:5, cex=0.8, ncol = 1)
dev.off()
