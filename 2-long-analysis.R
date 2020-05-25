library(tidyr)

queries <- read.csv("data/queries.csv",
                    header = TRUE, row.names = 1, sep = ",")

lqueries<- queries

# Without outliers
# Skip if wanting to include outliers
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
pdtf0 <- table(lqueries$Set[lqueries$PubDate == 0])
pdtf1 <- table(lqueries$Set[lqueries$PubDate == 1])
pdtf0 <- pdtf0 == 0
pdtf1 <- pdtf1 != 0
pdtf <- c(pdtf0, pdtf1)
pdtf <- data.frame(pdtf)
pdtf$Sets <- rownames(pdtf)

# Combine the data frames
lranges <- merge(lranges, pdtf, by.y = "Sets")

# Plot, log2 transformation, with Logical Values
mycols <- c("white", "black")

or.lranges <- lranges[with(lranges, order(pdtf, lranges)), ]

tiff('plots/fig5-plot-ranges.tif', width = 3840, height = 2160, pointsize = 12, res = 300)
#jpeg('plots/fig5-plot-ranges.jpg', width = 3840, height = 2160, pointsize = 12, res = 300)
par(mfrow = c(1, 1))
barplot(log10(or.lranges$lranges + 1), names.arg = or.lranges$Sets,
        axisnames = TRUE, las=2,
        xlab = "Sets", ylab = "Range Per Set (log_10 + 1)",
        main = "Annual Growth of Search Count Results",
        col = mycols[as.factor(or.lranges$pdtf)])
dev.off()

