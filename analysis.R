queries <- read.csv("data/longitudinal/queries.csv",
                    header = TRUE, row.names = 1, sep = ",")

        # Transpose dataframe
tqueries <- t(queries)
tqueries <- as.data.frame(tqueries)

queries$searches <- rownames(queries)
tqueries$months <- rownames(tqueries)

# How many searches did not change in search result counts, based on a subtraction of first month and last month:

nochange <- queries$October - queries$September
nochange <- cbind(queries$October, queries$September, nochange == 0, queries$searches)
table(nochange[,3])
rm(nochange)


# Search 001
# Side by side analysis
png('plots/s001multiplotzoomin.png', width = 1920, height = 1080, pointsize = 24)
layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML001, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 001")
plot(tqueries$PQML001, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 001")
plot(tqueries$EHML001, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 001")
plot(tqueries$WSML001, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 001")
plot(tqueries$OML001, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 001")
dev.off()

# Stacked analysis
png('plots/s001multiplotzoomout.png', width = 1920, height = 1080, pointsize = 24)
plot(tqueries$PMML001, type = "b",
     frame = FALSE, pch = 19,
     col = "blue",
     xlab = "Months",
     ylab = "Search Hits")
lines(tqueries$PQML001, type = "b", pch = 21, col = "red")
lines(tqueries$EHML001, type = "b", pch = 22, col = "orange")
lines(tqueries$WSML001, type = "b", pch = 23, col = "purple")
lines(tqueries$OML001, type = "b", pch = 24, col = "black")
legend("bottomright", legend=c("PMML", "PQML", "EMML",
                            "WSML", "OML"),
       col = c("blue", "red", "orange", "purple", "black"),
       lty=1:5, cex=1.5)
dev.off()

# Search 003
# Side by side analysis
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

# Stacked analysis
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

# Search 004
# Side by side analysis
png('plots/s004multiplotzoomin.png', width = 1920, height = 1080, pointsize = 24)
layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML004, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 004")
plot(tqueries$PQML004, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 004")
plot(tqueries$EHML004, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 004")
plot(tqueries$WSML004, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 004")
plot(tqueries$OML004, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 004")
dev.off()

# Stacked analysis
png('plots/s004multiplotzoomout.png', width = 1920, height = 1080, pointsize = 24)
plot(tqueries$PMML004, type = "b",
     frame = FALSE, pch = 19,
     col = "blue",
     xlab = "Months",
     ylab = "Search Hits",
     xlim=c(0,15),
     ylim=c(347000, 350000))
lines(tqueries$PQML004, type = "b", pch = 21, col = "red")
lines(tqueries$EHML004, type = "b", pch = 22, col = "orange")
lines(tqueries$WSML004, type = "b", pch = 23, col = "purple")
lines(tqueries$OML004, type = "b", pch = 24, col = "black")
legend("topright", legend=c("PMML", "PQML", "EMML",
                            "WSML", "OML"),
       col = c("blue", "red", "orange", "purple", "black"),
       lty=1:5, cex=1.5)
dev.off()
