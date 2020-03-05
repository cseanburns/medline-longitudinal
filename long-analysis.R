queries <- read.csv("data/longitudinal/queries.csv",
                    header = TRUE, row.names = 1, sep = ",")

library(tidyr)

# convert dataframe from wide to long format
db <- rep(c("PMML", "PQML", "EHML", "WSML", "OML"), 29)
lqueries<- queries
lqueries$database <- db
rm(db)
lqueries <- gather(lqueries, months, counts, October:September, factor_key = TRUE)

# get the ranges for all sets and sort from low to high
## all ranges
lranges <- sort(tapply(lqueries$counts, lqueries$Set, max) - tapply(lqueries$counts, lqueries$Set, min))

# Save ranges as data frames
l.ranges <- data.frame(lranges)
l.ranges$Sets <- rownames(l.ranges)

# Create a vector where pubdate is Logical for all of the data
# True = PubDate ; False = No PubDate
pdtf <- table(lqueries$Set[lqueries$PubDate == 1])
pdtf <- pdtf > 0
pdtf <- data.frame(pdtf)
pdtf$Sets <- rownames(pdtf)

# Combine the data frames
l.ranges <- merge(l.ranges, pdtf, by.y = "Sets")

# Plot, log_2 transformation
barplot(log(l.ranges$lranges + 1), las=2, xlab = "Sets", ylab = "Range Per Set")

# Plot with Logical Values
mycols <- c("white", "black")
barplot(sort(log(l.ranges$lranges + 1)), las=2,
        xlab = "Sets", ylab = "Range Per Set (log_2 + 1)",
        main = "Annual Growth of Search Count Results",
        col = mycols[as.factor(l.ranges$pdtf)])