wuhanqueries <- read.csv("data/wuhan-pubmed-searches-long.csv", sep = ",")
wuhanqueries$Date <- as.Date(wuhanqueries$Date, "%Y-%m-%d")

jpeg('plots/fig6-covid-searches.jpg', width = 3840, height = 2160, pointsize = 12, res = 300)
plot(wuhanqueries$Date[wuhanqueries$Databases=="PubMedLegacyMostRecent"],
     wuhanqueries$Hits[wuhanqueries$Databases=="PubMedLegacyMostRecent"],
     type = "b",
     pch = 19,
     col = "red",
     xlab = "Dates",
     ylab = "Search Hits",
     xlim = range(wuhanqueries$Date),
     ylim = range(wuhanqueries$Hits))

lines(wuhanqueries$Date[wuhanqueries$Databases=="PubMedLegacyBestMatch"],
      wuhanqueries$Hits[wuhanqueries$Databases=="PubMedLegacyBestMatch"],
      pch = 19,
      col = "orange",
      type = "b")

lines(wuhanqueries$Date[wuhanqueries$Databases=="PubMedNew"],
      wuhanqueries$Hits[wuhanqueries$Databases=="PubMedNew"],
      pch = 19,
      col = "black",
      type = "b")

lines(wuhanqueries$Date[wuhanqueries$Databases=="ProQuestPubmed"],
      wuhanqueries$Hits[wuhanqueries$Databases=="ProQuestPubmed"],
      pch = 19,
      col = "blue",
      type = "b")

lines(wuhanqueries$Date[wuhanqueries$Databases=="EBSCOhostPubMed"],
      wuhanqueries$Hits[wuhanqueries$Databases=="EBSCOhostPubMed"],
      pch = 19,
      col = "green",
      type = "b")

lines(wuhanqueries$Date[wuhanqueries$Databases=="WebofSciencePubMed"],
      wuhanqueries$Hits[wuhanqueries$Databases=="WebofSciencePubMed"],
      pch = 19,
      col = "gray",
      type = "b")
 
lines(wuhanqueries$Date[wuhanqueries$Databases=="OvidPubMed"],
      wuhanqueries$Hits[wuhanqueries$Databases=="OvidPubMed"],
      pch = 19,
      col = "purple",
      type = "b")

legend("topleft", legend=c("PMLMR", "PMLBM", "PMN",
                       "PrQPM", "EPM", "WSPM", "OPM"),
       col = c("red", "orange", "black", "blue", "green", "gray", "purple"),
       lty=1:5, cex=0.8, ncol = 1)
dev.off()
