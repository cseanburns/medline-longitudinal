# DESCRIPTION: 
# 
# This script generates several figures that provide close up (micro) and far
# out (macro) views of the cases with queries that were restricted by
# publication date.
#
# This script generates Figures 3 through 6.

source("0-libraries.R")
rm(list = ls())
queries <- read.csv("data/queries.csv",
  header = TRUE, row.names = 1, sep = ","
)

# Subset queries that were limited by pub dates
dqueries <- subset(queries, PubDate == 1)

# Subset queries to include only count data
dtqueries <- subset(dqueries, select = c(October:September))

# Transpose dataframe
dtqueries <- t(dtqueries)
dtqueries <- as.data.frame(dtqueries)
dtqueries$months <- rownames(dtqueries)

# Which cases stayed stable throughout data collection
# Of all cases
changes <- dqueries$September - dqueries$October
# get a count of queries with no changes
table(changes)
# add this to the dataframe
dqueries$changes <- changes
rm(changes)

# Get total number of searches that did not change from the first month
# to the last month for queries with publication dates
magic_for(print, silent = TRUE)
for (i in dtqueries[, 1:45]) {
  print(max(i) - min(i))
}
table(magic_result_as_vector())

## Zooming out
tiff("plots/fig3-cases03-11zoom-out.tif", width = 3840, height = 2160, pointsize = 12, res = 300)
par(mfrow = c(3, 3), mar = c(5, 4, 4, 8), xpd = TRUE)
plot(dtqueries$PMML003,
  type = "b",
  frame = FALSE, pch = 19,
  col = "blue",
  xlab = "Months",
  ylab = "Search Hits",
  main = "Case 03",
  xlim = c(0, 13),
  ylim = c(
    min(c(
      dtqueries$PMML003,
      dtqueries$PQML003,
      dtqueries$EHML003,
      dtqueries$WSML003,
      dtqueries$OML003
    )) - 500,
    max(c(
      dtqueries$PMML003,
      dtqueries$PQML003,
      dtqueries$EHML003,
      dtqueries$WSML003,
      dtqueries$OML003
    )) + 500
  )
)
lines(dtqueries$PQML003, type = "b", pch = 19, col = "red")
lines(dtqueries$EHML003, type = "b", pch = 19, col = "orange")
lines(dtqueries$WSML003, type = "b", pch = 19, col = "purple")
lines(dtqueries$OML003, type = "b", pch = 19, col = "black")

plot(dtqueries$PMML004,
  type = "b",
  frame = FALSE, pch = 19,
  col = "blue",
  xlab = "Months",
  ylab = "Search Hits",
  main = "Case 04",
  xlim = c(0, 13),
  ylim = c(
    min(c(
      dtqueries$PMML004,
      dtqueries$PQML004,
      dtqueries$EHML004,
      dtqueries$WSML004,
      dtqueries$OML004
    )) - 500,
    max(c(
      dtqueries$PMML004,
      dtqueries$PQML004,
      dtqueries$EHML004,
      dtqueries$WSML004,
      dtqueries$OML004
    )) + 500
  )
)
lines(dtqueries$PQML004, type = "b", pch = 19, col = "red")
lines(dtqueries$EHML004, type = "b", pch = 19, col = "orange")
lines(dtqueries$WSML004, type = "b", pch = 19, col = "purple")
lines(dtqueries$OML004, type = "b", pch = 19, col = "black")

plot(dtqueries$PMML005,
  type = "b",
  frame = FALSE, pch = 19,
  col = "blue",
  xlab = "Months",
  ylab = "Search Hits",
  main = "Case 05",
  xlim = c(0, 13),
  ylim = c(
    min(c(
      dtqueries$PMML005,
      dtqueries$PQML005,
      dtqueries$EHML005,
      dtqueries$WSML005,
      dtqueries$OML005
    )) - 500,
    max(c(
      dtqueries$PMML005,
      dtqueries$PQML005,
      dtqueries$EHML005,
      dtqueries$WSML005,
      dtqueries$OML005
    )) + 500
  )
)
lines(dtqueries$PQML005, type = "b", pch = 19, col = "red")
lines(dtqueries$EHML005, type = "b", pch = 19, col = "orange")
lines(dtqueries$WSML005, type = "b", pch = 19, col = "purple")
lines(dtqueries$OML005, type = "b", pch = 19, col = "black")

plot(dtqueries$PMML006,
  type = "b",
  frame = FALSE, pch = 19,
  col = "blue",
  xlab = "Months",
  ylab = "Search Hits",
  main = "Case 06",
  xlim = c(0, 13),
  ylim = c(
    min(c(
      dtqueries$PMML006,
      dtqueries$PQML006,
      dtqueries$EHML006,
      dtqueries$WSML006,
      dtqueries$OML006
    )) - 500,
    max(c(
      dtqueries$PMML006,
      dtqueries$PQML006,
      dtqueries$EHML006,
      dtqueries$WSML006,
      dtqueries$OML006
    )) + 500
  )
)
lines(dtqueries$PQML006, type = "b", pch = 19, col = "red")
lines(dtqueries$EHML006, type = "b", pch = 19, col = "orange")
lines(dtqueries$WSML006, type = "b", pch = 19, col = "purple")
lines(dtqueries$OML006, type = "b", pch = 19, col = "black")

plot(dtqueries$PMML007,
  type = "b",
  frame = FALSE, pch = 19,
  col = "blue",
  xlab = "Months",
  ylab = "Search Hits",
  main = "Case 07",
  xlim = c(0, 13),
  ylim = c(
    min(c(
      dtqueries$PMML007,
      dtqueries$PQML007,
      dtqueries$EHML007,
      dtqueries$WSML007,
      dtqueries$OML007
    )) - 500,
    max(c(
      dtqueries$PMML007,
      dtqueries$PQML007,
      dtqueries$EHML007,
      dtqueries$WSML007,
      dtqueries$OML007
    )) + 500
  )
)
lines(dtqueries$PQML007, type = "b", pch = 19, col = "red")
lines(dtqueries$EHML007, type = "b", pch = 19, col = "orange")
lines(dtqueries$WSML007, type = "b", pch = 19, col = "purple")
lines(dtqueries$OML007, type = "b", pch = 19, col = "black")

plot(dtqueries$PMML008,
  type = "b",
  frame = FALSE, pch = 19,
  col = "blue",
  xlab = "Months",
  ylab = "Search Hits",
  main = "Case 08",
  xlim = c(0, 13),
  ylim = c(
    min(c(
      dtqueries$PMML008,
      dtqueries$PQML008,
      dtqueries$EHML008,
      dtqueries$WSML008,
      dtqueries$OML008
    )) - 500,
    max(c(
      dtqueries$PMML008,
      dtqueries$PQML008,
      dtqueries$EHML008,
      dtqueries$WSML008,
      dtqueries$OML008
    )) + 500
  )
)
lines(dtqueries$PQML008, type = "b", pch = 19, col = "red")
lines(dtqueries$EHML008, type = "b", pch = 19, col = "orange")
lines(dtqueries$WSML008, type = "b", pch = 19, col = "purple")
lines(dtqueries$OML008, type = "b", pch = 19, col = "black")

plot(dtqueries$PMML009,
  type = "b",
  frame = FALSE, pch = 19,
  col = "blue",
  xlab = "Months",
  ylab = "Search Hits",
  main = "Case 09",
  xlim = c(0, 13),
  ylim = c(
    min(c(
      dtqueries$PMML009,
      dtqueries$PQML009,
      dtqueries$EHML009,
      dtqueries$WSML009,
      dtqueries$OML009
    )) - 500,
    max(c(
      dtqueries$PMML009,
      dtqueries$PQML009,
      dtqueries$EHML009,
      dtqueries$WSML009,
      dtqueries$OML009
    )) + 500
  )
)
lines(dtqueries$PQML009, type = "b", pch = 19, col = "red")
lines(dtqueries$EHML009, type = "b", pch = 19, col = "orange")
lines(dtqueries$WSML009, type = "b", pch = 19, col = "purple")
lines(dtqueries$OML009, type = "b", pch = 19, col = "black")

plot(dtqueries$PMML010,
  type = "b",
  frame = FALSE, pch = 19,
  col = "blue",
  xlab = "Months",
  ylab = "Search Hits",
  main = "Case 10",
  xlim = c(0, 13),
  ylim = c(
    min(c(
      dtqueries$PMML010,
      dtqueries$PQML010,
      dtqueries$EHML010,
      dtqueries$WSML010,
      dtqueries$OML010
    )) - 500,
    max(c(
      dtqueries$PMML010,
      dtqueries$PQML010,
      dtqueries$EHML010,
      dtqueries$WSML010,
      dtqueries$OML010
    )) + 500
  )
)
lines(dtqueries$PQML010, type = "b", pch = 19, col = "red")
lines(dtqueries$EHML010, type = "b", pch = 19, col = "orange")
lines(dtqueries$WSML010, type = "b", pch = 19, col = "purple")
lines(dtqueries$OML010, type = "b", pch = 19, col = "black")

plot(dtqueries$PMML011,
  type = "b",
  frame = FALSE, pch = 19,
  col = "blue",
  xlab = "Months",
  ylab = "Search Hits",
  main = "Case 11",
  xlim = c(0, 13),
  ylim = c(
    min(c(
      dtqueries$PMML011,
      dtqueries$PQML011,
      dtqueries$EHML011,
      dtqueries$WSML011,
      dtqueries$OML011
    )) - 500,
    max(c(
      dtqueries$PMML011,
      dtqueries$PQML011,
      dtqueries$EHML011,
      dtqueries$WSML011,
      dtqueries$OML011
    )) + 500
  )
)
lines(dtqueries$PQML011, type = "b", pch = 19, col = "red")
lines(dtqueries$EHML011, type = "b", pch = 19, col = "orange")
lines(dtqueries$WSML011, type = "b", pch = 19, col = "purple")
lines(dtqueries$OML011, type = "b", pch = 19, col = "black")

legend("topright",
  inset = c(-0.3, 0),
  legend = c("PMML", "PQML", "EMML", "WSML", "OML"),
  col = c("blue", "red", "orange", "purple", "black"),
  lty = 1, cex = 1.2, bty = "n"
)
dev.off()

tiff("plots/fig4-cases03-05zoom-in.tif", width = 3840, height = 2160, pointsize = 12, res = 300)
par(mfrow = c(3, 5))
with(dtqueries, {
  plot(PMML003, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "PubMed, Case 03")
  plot(PQML003, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "ProQuest, Case 03")
  plot(EHML003, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "EBSCOhost, Case 03")
  plot(WSML003, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Web of Science, Case 03")
  plot(OML003, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Ovid, Case 03")
  plot(PMML004, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "PubMed, Case 04")
  plot(PQML004, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "ProQuest, Case 04")
  plot(EHML004, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "EBSCOhost, Case 04")
  plot(WSML004, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Web of Science, Case 04")
  plot(OML004, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Ovid, Case 04")
  plot(PMML005, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "PubMed, Case 05")
  plot(PQML005, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "ProQuest, Case 05")
  plot(EHML005, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "EBSCOhost, Case 05")
  plot(WSML005, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Web of Science, Case 05")
  plot(OML005, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Ovid, Case 05")
})
dev.off()

tiff("plots/fig5-cases06-08zoom-in.tif", width = 3840, height = 2160, pointsize = 12, res = 300)
par(mfrow = c(3, 5))
with(dtqueries, {
  plot(PMML006, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "PubMed, Case 06")
  plot(PQML006, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "ProQuest, Case 06")
  plot(EHML006, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "EBSCOhost, Case 06")
  plot(WSML006, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Web of Science, Case 06")
  plot(OML006, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Ovid, Case 06")
  plot(PMML007, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "PubMed, Case 07")
  plot(PQML007, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "ProQuest, Case 07")
  plot(EHML007, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "EBSCOhost, Case 07")
  plot(WSML007, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Web of Science, Case 07")
  plot(OML007, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Ovid, Case 07")
  plot(PMML008, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "PubMed, Case 08")
  plot(PQML008, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "ProQuest, Case 08")
  plot(EHML008, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "EBSCOhost, Case 08")
  plot(WSML008, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Web of Science, Case 08")
  plot(OML008, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Ovid, Case 08")
})
dev.off()

tiff("plots/fig6-cases09-11zoom-in.tif", width = 3840, height = 2160, pointsize = 12, res = 300)
par(mfrow = c(3, 5))
with(dtqueries, {
  plot(PMML009, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "PubMed, Case 09")
  plot(PQML009, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "ProQuest, Case 09")
  plot(EHML009, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "EBSCOhost, Case 09")
  plot(WSML009, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Web of Science, Case 09")
  plot(OML009, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Ovid, Case 09")
  plot(PMML010, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "PubMed, Case 10")
  plot(PQML010, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "ProQuest, Case 10")
  plot(EHML010, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "EBSCOhost, Case 10")
  plot(WSML010, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Web of Science, Case 10")
  plot(OML010, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Ovid, Case 10")
  plot(PMML011, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "PubMed, Case 11")
  plot(PQML011, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "ProQuest, Case 11")
  plot(EHML011, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "EBSCOhost, Case 11")
  plot(WSML011, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Web of Science, Case 11")
  plot(OML011, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Ovid, Case 11")
})
dev.off()
