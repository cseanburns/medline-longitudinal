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

ld.ranges <- data.frame(ldranges)
ld.ranges$Sets <- rownames(ld.ranges)
plot(ld.ranges$ldranges, ld.ranges$Sets, xlab = "Sets", ylab = "Range per Set")


plot(log(ldranges + 1), xlab = "Sets", ylab = "Range Per Set")
plot(log(lnranges + 1), xlab = "Sets", ylab = "Range Per Set")

