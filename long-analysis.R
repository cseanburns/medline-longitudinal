queries <- read.csv("data/longitudinal/queries.csv",
                    header = TRUE, row.names = 1, sep = ",")

library(tidyr)

# convert dataframe from wide to long format
db <- rep(c("PMML", "PQML", "EHML", "WSML", "OML"), 29)
lqueries<- queries
lqueries$database <- db
rm(db)
lqueries <- gather(lqueries, months, counts, October:September, factor_key = TRUE)
# those with pubdate 
ldqueries <- lqueries[lqueries$PubDate == 1,]
# those without pubdate
lnqueries <- lqueries[lqueries$PubDate == 0,]

# get the ranges for all sets and sort from low to high
## all ranges
lranges <- sort(tapply(lqueries$counts, lqueries$Set, max) - tapply(lqueries$counts, lqueries$Set, min))

# ranges for queries with publication dates
ldranges <- sort(tapply(ldqueries$counts, ldqueries$Set, max) - tapply(ldqueries$counts, ldqueries$Set, min))
# ranges for queries with no publication dates
lnranges <- sort(tapply(lnqueries$counts, lnqueries$Set, max) - tapply(lnqueries$counts, lnqueries$Set, min))

# Save ranges as data frames
l.ranges <- data.frame(lranges)
l.ranges$Sets <- rownames(l.ranges)

ld.ranges <- data.frame(ldranges)
ld.ranges$Sets <- rownames(ld.ranges)

ln.ranges <- data.frame(lnranges)
ln.ranges$Sets <- rownames(ln.ranges)

# Create a vector where pubdate is Logical for all of the data
pdtf <- table(lqueries$Set[lqueries$PubDate == 1])
pdtf <- pdtf > 0
pdtf <- data.frame(pdtf)
pdtf$Sets <- rownames(pdtf)

# Combine the data frames
l.ranges <- merge(l.ranges, pdtf, by.y = "Sets")

# Plot
barplot(log(l.ranges$lranges + 1), las=2, xlab = "Sets", ylab = "Range Per Set")
barplot(log(ld.ranges$ldranges + 1), las=2, xlab = "Sets", ylab = "Range Per Set")
barplot(log(ln.ranges$lnranges + 1), las=2, xlab = "Sets", ylab = "Range Per Set")

# Plot with Logical Values
mycols <- c("white", "black")
barplot(log(l.ranges$lranges + 1), las=2,
        xlab = "Sets", ylab = "Range Per Set (log_2 + 1)",
        col = mycols[as.factor(l.ranges$pdtf)])