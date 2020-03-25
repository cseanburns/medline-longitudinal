library(tidyr)

queries <- read.csv("data/longitudinal/queries.csv",
                    header = TRUE, row.names = 1, sep = ",")

lqueries<- queries

# Without outliers
# In the seven sets below, at least one of the databases in each of the sets reported very wild numbers.
# These are excluded in order to plot sets where the counts are more consistent with each other
lqueries <- lqueries[!lqueries$Set == "set8",]
lqueries <- lqueries[!lqueries$Set == "set9",]
lqueries <- lqueries[!lqueries$Set == "set24",]
lqueries <- lqueries[!lqueries$Set == "set25",]
lqueries <- lqueries[!lqueries$Set == "set27",]
lqueries <- lqueries[!lqueries$Set == "set28",]
lqueries <- lqueries[!lqueries$Set == "set29",]

# convert dataframe from wide to long format
db <- rep(c("PMML", "PQML", "EHML", "WSML", "OML"), length(lqueries$Set) / 5)
lqueries$database <- db
rm(db)
lqueries <- gather(lqueries, months, counts, October:September, factor_key = TRUE)

# get the ranges for all sets and sort from low to high;
# so the highest range in the set minus the lowest range in the set regardless of
# the database platform
## all ranges
lranges <- sort(tapply(lqueries$counts, lqueries$Set, max) - tapply(lqueries$counts, lqueries$Set, min))

# Save ranges as data frames
lranges <- data.frame(lranges)
lranges$Sets <- rownames(lranges)

# Create a vector where pubdate is Logical for all of the data
# True = PubDate ; False = No PubDate
pdtf <- table(lqueries$Set[lqueries$PubDate == 1])
pdtf <- pdtf > 0
pdtf <- data.frame(pdtf)
pdtf$Sets <- rownames(pdtf)

# Combine the data frames
lranges <- merge(lranges, pdtf, by.y = "Sets")

# Plot, log2 transformation, with Logical Values
mycols <- c("white", "black")

or.lranges <- lranges[with(lranges, order(pdtf, lranges)), ]

jpeg('plots/fig5-plot-ranges.jpg', width = 3840, height = 2160, pointsize = 12, res = 300)
par(mfrow = c(1, 1))
barplot(log10(or.lranges$lranges + 1), las=2,
        xlab = "Sets", ylab = "Range Per Set (log_10 + 1)",
        main = "Annual Growth of Search Count Results",
        col = mycols[as.factor(or.lranges$pdtf)])
dev.off()

# With outliers
wqueries<- queries

# convert dataframe from wide to long format
db <- rep(c("PMML", "PQML", "EHML", "WSML", "OML"), length(wqueries$Set) / 5)
wqueries$database <- db
rm(db)
wqueries <- gather(wqueries, months, counts, October:September, factor_key = TRUE)

# get the ranges for all sets and sort from low to high;
# so the highest range in the set minus the lowest range in the set regardless of
# the database platform
## all ranges
wranges <- sort(tapply(wqueries$counts, wqueries$Set, max) - tapply(wqueries$counts, wqueries$Set, min))


# Save ranges as data frames
wranges <- data.frame(wranges)
wranges$Sets <- rownames(wranges)

# Create a vector where pubdate is Logical for all of the data
# True = PubDate ; False = No PubDate
wpdtf <- table(wqueries$Set[wqueries$PubDate == 1])
wpdtf <- wpdtf > 0
wpdtf <- data.frame(wpdtf)
wpdtf$Sets <- rownames(wpdtf)

# Combine the data frames
wranges <- merge(wranges, wpdtf, by.y = "Sets")

# Plot, log2 transformation, with Logical Values
mycols <- c("white", "black")

or.wranges <- wranges[with(wranges, order(wpdtf, wranges)), ]

#jpeg('plots/plot-ranges.jpg', width = 3840, height = 2160, pointsize = 12, res = 300)
par(mfrow = c(1, 1))
barplot(log10(or.wranges$wranges + 1), las=2,
        xlab = "Sets", ylab = "Range Per Set (log_10 + 1)",
        main = "Annual Growth of Search Count Results",
        col = mycols[as.factor(or.wranges$wpdtf)])
#dev.off() 