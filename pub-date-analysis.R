queries <- read.csv("data/longitudinal/queries.csv",
                    header = TRUE, row.names = 1, sep = ",")

# Subset queries that were limited by pub dates
dqueries <- subset(queries, PubDate == 1)

# Subset queries to include only count data 
dtqueries <- subset(dqueries, select = c(October:September))

# Transpose dataframe
dtqueries <- t(dtqueries)
dtqueries <- as.data.frame(dtqueries)
dtqueries$months <- rownames(dtqueries)

# Which sets stayed stable throughout data collection
changes <- dqueries$September - dqueries$October
# get a count of queries with no changes
table(changes)
# add this to the dataframe
dqueries$changes <- changes
rm(changes)

jpeg('plots/plot004-005zoom-in.jpg', width = 3840, height = 2160, pointsize = 12, res = 300)
par(mfrow = c(2, 5))
with(dtqueries, {
        plot(PMML004, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "PubMed, Query 004")
        plot(PQML004, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "ProQuest, Query 004")
        plot(EHML004, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "EBSCOhost, Query 004")
        plot(WSML004, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Web of Science, Query 004")
        plot(OML004,  type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Ovid, Query 004")
        plot(PMML005, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "PubMed, Query 005")
        plot(PQML005, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "ProQuest, Query 005")
        plot(EHML005, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "EBSCOhost, Query 005")
        plot(WSML005, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Web of Science, Query 005")
        plot(OML005,  type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Ovid, Query 005")
})
dev.off()

jpeg('plots/plot006-008zoom-in.jpg', width = 3840, height = 2160, pointsize = 12, res = 300)
par(mfrow = c(3, 5))
with(dtqueries, {
        plot(PMML006, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "PubMed, Query 006")
        plot(PQML006, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "ProQuest, Query 006")
        plot(EHML006, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "EBSCOhost, Query 006")
        plot(WSML006, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Web of Science, Query 006")
        plot(OML006,  type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Ovid, Query 006")
        plot(PMML007, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "PubMed, Query 007")
        plot(PQML007, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "ProQuest, Query 007")
        plot(EHML007, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "EBSCOhost, Query 007")
        plot(WSML007, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Web of Science, Query 007")
        plot(OML007,  type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Ovid, Query 007")
        plot(PMML008, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "PubMed, Query 008")
        plot(PQML008, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "ProQuest, Query 008")
        plot(EHML008, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "EBSCOhost, Query 008")
        plot(WSML008, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Web of Science, Query 008")
        plot(OML008,  type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Ovid, Query 008")
})
dev.off()

jpeg('plots/plot009-011zoom-in.jpg', width = 3840, height = 2160, pointsize = 12, res = 300)
par(mfrow = c(3, 5))
with(dtqueries, {
        plot(PMML009, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "PubMed, Query 009")
        plot(PQML009, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "ProQuest, Query 009")
        plot(EHML009, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "EBSCOhost, Query 009")
        plot(WSML009, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Web of Science, Query 009")
        plot(OML009,  type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Ovid, Query 009")
        plot(PMML010, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "PubMed, Query 010")
        plot(PQML010, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "ProQuest, Query 010")
        plot(EHML010, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "EBSCOhost, Query 010")
        plot(WSML010, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Web of Science, Query 010")
        plot(OML010,  type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Ovid, Query 010")
        plot(PMML011, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "PubMed, Query 011")
        plot(PQML011, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "ProQuest, Query 011")
        plot(EHML011, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "EBSCOhost, Query 011")
        plot(WSML011, type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Web of Science, Query 011")
        plot(OML011,  type = "b", frame = FALSE, xlab = "Months", ylab = "Search Hits", main = "Ovid, Query 011")
})
dev.off()

## Zooming out
jpeg('plots/plot004-011zoom-out.jpg', width = 3840, height = 2160, pointsize = 12, res = 300)
par(mfrow = c(3,3))
plot(dtqueries$PMML004, type = "b",
     frame = FALSE, pch = 19,
     col = "blue",
     xlab = "Months",
     ylab = "Search Hits",
     main = "Query Set 004",
     xlim=c(0,13),
     ylim=c(min(c(dtqueries$PMML004,
                  dtqueries$PQML004,
                  dtqueries$EHML004,
                  dtqueries$WSML004,
                  dtqueries$OML004)) - 500,
            max(c(dtqueries$PMML004,
                  dtqueries$PQML004,
                  dtqueries$EHML004,
                  dtqueries$WSML004,
                  dtqueries$OML004)) + 500))
lines(dtqueries$PQML004, type = "b", pch = 19, col = "red")
lines(dtqueries$EHML004, type = "b", pch = 19, col = "orange")
lines(dtqueries$WSML004, type = "b", pch = 19, col = "purple")
lines(dtqueries$OML004, type = "b", pch = 19, col = "black")

plot(dtqueries$PMML005, type = "b",
     frame = FALSE, pch = 19,
     col = "blue",
     xlab = "Months",
     ylab = "Search Hits",
     main = "Query Set 005",
     xlim=c(0,13),
     ylim=c(min(c(dtqueries$PMML005,
                  dtqueries$PQML005,
                  dtqueries$EHML005,
                  dtqueries$WSML005,
                  dtqueries$OML005)) - 500,
            max(c(dtqueries$PMML005,
                  dtqueries$PQML005,
                  dtqueries$EHML005,
                  dtqueries$WSML005,
                  dtqueries$OML005)) + 500))
lines(dtqueries$PQML005, type = "b", pch = 19, col = "red")
lines(dtqueries$EHML005, type = "b", pch = 19, col = "orange")
lines(dtqueries$WSML005, type = "b", pch = 19, col = "purple")
lines(dtqueries$OML005, type = "b", pch = 19, col = "black")

plot(dtqueries$PMML006, type = "b",
     frame = FALSE, pch = 19,
     col = "blue",
     xlab = "Months",
     ylab = "Search Hits",
     main = "Query Set 006",
     xlim=c(0,13),
     ylim=c(min(c(dtqueries$PMML006,
                  dtqueries$PQML006,
                  dtqueries$EHML006,
                  dtqueries$WSML006,
                  dtqueries$OML006)) - 500,
            max(c(dtqueries$PMML006,
                  dtqueries$PQML006,
                  dtqueries$EHML006,
                  dtqueries$WSML006,
                  dtqueries$OML006)) + 500))
lines(dtqueries$PQML006, type = "b", pch = 19, col = "red")
lines(dtqueries$EHML006, type = "b", pch = 19, col = "orange")
lines(dtqueries$WSML006, type = "b", pch = 19, col = "purple")
lines(dtqueries$OML006, type = "b", pch = 19, col = "black")

plot(dtqueries$PMML007, type = "b",
     frame = FALSE, pch = 19,
     col = "blue",
     xlab = "Months",
     ylab = "Search Hits",
     main = "Query Set 007",
     xlim=c(0,13),
     ylim=c(min(c(dtqueries$PMML007,
                  dtqueries$PQML007,
                  dtqueries$EHML007,
                  dtqueries$WSML007,
                  dtqueries$OML007)) - 500,
            max(c(dtqueries$PMML007,
                  dtqueries$PQML007,
                  dtqueries$EHML007,
                  dtqueries$WSML007,
                  dtqueries$OML007)) + 500))
lines(dtqueries$PQML007, type = "b", pch = 19, col = "red")
lines(dtqueries$EHML007, type = "b", pch = 19, col = "orange")
lines(dtqueries$WSML007, type = "b", pch = 19, col = "purple")
lines(dtqueries$OML007, type = "b", pch = 19, col = "black")

plot(dtqueries$PMML008, type = "b",
     frame = FALSE, pch = 19,
     col = "blue",
     xlab = "Months",
     ylab = "Search Hits",
     main = "Query Set 008",
     xlim=c(0,13),
     ylim=c(min(c(dtqueries$PMML008,
                  dtqueries$PQML008,
                  dtqueries$EHML008,
                  dtqueries$WSML008,
                  dtqueries$OML008)) - 500,
            max(c(dtqueries$PMML008,
                  dtqueries$PQML008,
                  dtqueries$EHML008,
                  dtqueries$WSML008,
                  dtqueries$OML008)) + 500))
lines(dtqueries$PQML008, type = "b", pch = 19, col = "red")
lines(dtqueries$EHML008, type = "b", pch = 19, col = "orange")
lines(dtqueries$WSML008, type = "b", pch = 19, col = "purple")
lines(dtqueries$OML008, type = "b", pch = 19, col = "black")

plot(dtqueries$PMML009, type = "b",
     frame = FALSE, pch = 19,
     col = "blue",
     xlab = "Months",
     ylab = "Search Hits",
     main = "Query Set 009",
     xlim=c(0,13),
     ylim=c(min(c(dtqueries$PMML009,
                  dtqueries$PQML009,
                  dtqueries$EHML009,
                  dtqueries$WSML009,
                  dtqueries$OML009)) - 500,
            max(c(dtqueries$PMML009,
                  dtqueries$PQML009,
                  dtqueries$EHML009,
                  dtqueries$WSML009,
                  dtqueries$OML009)) + 500))
lines(dtqueries$PQML009, type = "b", pch = 19, col = "red")
lines(dtqueries$EHML009, type = "b", pch = 19, col = "orange")
lines(dtqueries$WSML009, type = "b", pch = 19, col = "purple")
lines(dtqueries$OML009, type = "b", pch = 19, col = "black")

plot(dtqueries$PMML010, type = "b",
     frame = FALSE, pch = 19,
     col = "blue",
     xlab = "Months",
     ylab = "Search Hits",
     main = "Query Set 010",
     xlim=c(0,13),
     ylim=c(min(c(dtqueries$PMML010,
                  dtqueries$PQML010,
                  dtqueries$EHML010,
                  dtqueries$WSML010,
                  dtqueries$OML010)) - 500,
            max(c(dtqueries$PMML010,
                  dtqueries$PQML010,
                  dtqueries$EHML010,
                  dtqueries$WSML010,
                  dtqueries$OML010)) + 500))
lines(dtqueries$PQML010, type = "b", pch = 19, col = "red")
lines(dtqueries$EHML010, type = "b", pch = 19, col = "orange")
lines(dtqueries$WSML010, type = "b", pch = 19, col = "purple")
lines(dtqueries$OML010, type = "b", pch = 19, col = "black")

plot(dtqueries$PMML011, type = "b",
     frame = FALSE, pch = 19,
     col = "blue",
     xlab = "Months",
     ylab = "Search Hits",
     main = "Query Set 011",
     xlim=c(0,13),
     ylim=c(min(c(dtqueries$PMML011,
                  dtqueries$PQML011,
                  dtqueries$EHML011,
                  dtqueries$WSML011,
                  dtqueries$OML011)) - 500,
            max(c(dtqueries$PMML011,
                  dtqueries$PQML011,
                  dtqueries$EHML011,
                  dtqueries$WSML011,
                  dtqueries$OML011)) + 500))
lines(dtqueries$PQML011, type = "b", pch = 19, col = "red")
lines(dtqueries$EHML011, type = "b", pch = 19, col = "orange")
lines(dtqueries$WSML011, type = "b", pch = 19, col = "purple")
lines(dtqueries$OML011, type = "b", pch = 19, col = "black")

legend("top", legend=c("PMML", "PQML", "EMML",
                            "WSML", "OML"),
       col = c("blue", "red", "orange", "purple", "black"),
       lty=1:5, cex=0.8, ncol = 5)
dev.off()
