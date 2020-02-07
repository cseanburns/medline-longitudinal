queries <- read.csv("data/longitudinal/queries.csv",
                    header = TRUE, row.names = 1, sep = ",")

# Transpose dataframe
tqueries <- subset(queries, select = c(October:September))
tqueries <- t(tqueries)
tqueries <- as.data.frame(tqueries)

queries$searches <- rownames(queries)
tqueries$months <- rownames(tqueries)

# Subset out queries that were limited by pub dates
dqueries <- subset(queries, PubDate == 1)
nochange <- dqueries$October - dqueries$September
# get a count of queries with no changes
table(nochange)
# add this to the dataframe
dqueries$nochange <- nochange

png('plots/s003multiplotzoomin.png', width = 1920, height = 1080, pointsize = 24)
layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML003, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 003")
plot(tqueries$PQML003, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 003")
plot(tqueries$EHML003, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 003")
plot(tqueries$WSML003, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 003")
plot(tqueries$OML003, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 003")
dev.off()

png('plots/s003multiplotzoomout.png', width = 1920, height = 1080, pointsize = 24)
plot(tqueries$PMML003, type = "b",
     frame = FALSE, pch = 19,
     col = "blue",
     xlab = "Months",
     ylab = "Search Hits",
     xlim=c(0,15),
     ylim=c(2232480, 2251213))
lines(tqueries$PQML003, type = "b", pch = 21, col = "red")
lines(tqueries$EHML003, type = "b", pch = 22, col = "orange")
lines(tqueries$WSML003, type = "b", pch = 23, col = "purple")
lines(tqueries$OML003, type = "b", pch = 24, col = "black")
legend("topright", legend=c("PMML", "PQML", "EMML",
                            "WSML", "OML"),
       col = c("blue", "red", "orange", "purple", "black"),
       lty=1:5, cex=1.5)
dev.off()
