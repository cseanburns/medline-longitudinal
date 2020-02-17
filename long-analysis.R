queries <- read.csv("data/longitudinal/queries.csv",
                    header = TRUE, row.names = 1, sep = ",")

library(tidyr)

# convert dataframe from wide to long format
db <- rep(c("PMML", "PQML", "EHML", "WSML", "OML"), 29)
lqueries<- queries
lqueries$database <- db
lqueries <- gather(lqueries, months, counts, October:September, factor_key = TRUE)
