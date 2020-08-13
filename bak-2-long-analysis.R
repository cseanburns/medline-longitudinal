# Note: This script is no longer used in the analysis and has been replaced with
# a script that generates and plots modified z-scores for all cases. 
# 
# The script generated a plot that compared overall growth in search records
# between cases with pub date limiters in their queries and cases without pub
# date limiters in their queries.

library(tidyr)

queries <- read.csv("data/queries.csv",
                    header = TRUE, row.names = 1, sep = ",")

lqueries<- queries

# Without outliers
# Skip if wanting to include outliers
# In the seven sets below, at least one of the databases in each of the sets reported very wild numbers.
# These are excluded in order to plot sets where the counts are more consistent with each other
lqueries <- lqueries[!lqueries$Cases == "case-08",]
lqueries <- lqueries[!lqueries$Cases == "case-09",]
lqueries <- lqueries[!lqueries$Cases == "case-24",]
lqueries <- lqueries[!lqueries$Cases == "case-25",]
lqueries <- lqueries[!lqueries$Cases == "case-27",]
lqueries <- lqueries[!lqueries$Cases == "case-28",]
lqueries <- lqueries[!lqueries$Cases == "case-29",]

# convert dataframe from wide to long format
db <- rep(c("PMML", "PQML", "EHML", "WSML", "OML"), length(lqueries$Cases) / 5)
lqueries$database <- db
rm(db)
lqueries <- gather(lqueries, months, counts, October:September, factor_key = TRUE)

# get the ranges for all cases and sort from low to high;
# the highest range in the Cases minus the lowest range in the Cases regardless of
# the database platform
## all ranges
lranges <- sort(tapply(lqueries$counts, lqueries$Cases, max) - tapply(lqueries$counts, lqueries$Cases, min))

# Save ranges as data frames
lranges <- data.frame(lranges)
lranges$Cases <- rownames(lranges)

# Create a vector where pubdate is Logical for all of the data
# True = PubDate ; False = No PubDate
pdtf0 <- table(lqueries$Cases[lqueries$PubDate == 0])
pdtf1 <- table(lqueries$Cases[lqueries$PubDate == 1])
pdtf0 <- pdtf0 == 0
pdtf1 <- pdtf1 != 0
pdtf <- c(pdtf0, pdtf1)
pdtf <- data.frame(pdtf)
pdtf$Cases <- rownames(pdtf)

# Combine the data frames
lranges <- merge(lranges, pdtf, by.y = "Cases")

# Plot, log2 transformation, with Logical Values
mycols <- c("white", "black")

or.lranges <- lranges[with(lranges, order(pdtf, lranges)), ]

tiff('plots/fig5-plot-ranges.tif', width = 3840, height = 2160, pointsize = 12, res = 300)
par(mfrow = c(1, 1))
barplot(log10(or.lranges$lranges + 1), names.arg = or.lranges$Cases,
        axisnames = TRUE, las=2,
        xlab = "Cases", ylab = "Range Per Case (log_10 + 1)",
        main = "Annual Difference of Search Count Results",
        col = mycols[as.factor(or.lranges$pdtf)])
dev.off()

