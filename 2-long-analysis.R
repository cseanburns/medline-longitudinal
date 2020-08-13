# DESCRIPTION:
# This script calculates and plots the modified z-score based on the differences
# between the results returned for each database and for each case from October
# 2018 to September 2019.
# 
# Process:

# First the range (min and max) is taken for the searches for each database over
# the course of the year of data collection.
# 
# Second the modified z-scores are calculated on the five *ranges* in each case.
# PubMed is the center (rather than the median), which means that the ranges for
# the four other database searches in the each case vary around the range for
# PubMed in each case.
#
# This script generates Figures 7 and 8.

source("0-libraries.R")
rm(list = ls())
queries <- read.csv("data/queries.csv", header = TRUE, row.names = 1, sep = ",")

query_ranges <- subset(queries, select = October:September)
query_searches <- row.names(queries)
query_ranges <- cbind(rowRanges(as.matrix(query_ranges)), queries$Cases, query_searches)
query_ranges <- as.data.frame(query_ranges)
query_ranges <- rename(query_ranges, min = V1, max = V2, Cases = V3)
query_ranges$min <- as.numeric(query_ranges$min)
query_ranges$max <- as.numeric(query_ranges$max)
query_ranges$diff <- query_ranges$max - query_ranges$min
query_ranges$Database <- rep(c("PubMed", "ProQuest", "EBSCOhost", "WoS", "Ovid"), 29)

rm(query_searches)

query_wide <- pivot_wider(query_ranges, id_cols = Cases, names_from = Database, values_from = diff)

modz <- function(query_wide, x) {
  s <- as.numeric(query_wide[x, 2:6])
  sabs <- abs(s - s[1])
  smad <- median(sabs)
  smodz <- (0.6745 * (s - s[1])) / smad
  return(smodz)
}

magic_for(print, silent = TRUE)

for (i in 1:29) {
  print(modz(query_wide, i))
}

modz <- magic_result_as_vector()
modz <- as.data.frame(matrix(modz, ncol = 5, byrow = T))

# Name columns/variables
colnames(modz) <- c("PubMed", "ProQuest", "EBSCOhost", "WoS", "Ovid")

# Replace NaNs and Infs with 0 to show perfect correlation since they are
# perfectly or nearly perfectly correlated
modz$PubMed[which(!is.finite(modz$PubMed))] <- 0
modz$ProQuest[which(!is.finite(modz$ProQuest))] <- 0
modz$EBSCOhost[which(!is.finite(modz$EBSCOhost))] <- 0
modz$WoS[which(!is.finite(modz$WoS))] <- 0
modz$Ovid[which(!is.finite(modz$Ovid))] <- 0

# Create column for Cases
modz$Cases <- unique(query_ranges$Cases)
# Create columns for Cases with PubDates
modz$PubDate <- c(FALSE, FALSE, rep(TRUE, 9), rep(FALSE, 18))

scale_fill_discrete(name="Experimental\nCondition",
                    breaks=c("ctrl", "trt1", "trt2"),
                    labels=c("Control", "Treatment 1", "Treatment 2"))

tiff("plots/fig7-modz-scores.tif", width = 3840, height = 2160, pointsize = 12, res = 300)
modz1 <- subset(modz, ProQuest <= 3.5 & ProQuest >= -3.5)
mz1 <- ggplot(modz1, aes(Cases, ProQuest, fill = PubDate)) +
  geom_col() +
  geom_text(aes(label = round(ProQuest, 2))) +
  labs(x = "Cases", y = "ProQuest") +
  theme_minimal() +
  coord_flip() +
  guides(fill=guide_legend(title=NULL)) +
  scale_fill_ucscgb(breaks = c(FALSE, TRUE),
                    labels = c("w/o Pub Date", "w/ Pub Date")) +
  theme(axis.text.x = element_text(
    angle = 45,
    hjust = 1,
    colour = "black"
  ))

modz2 <- subset(modz, EBSCOhost <= 3.5 & EBSCOhost >= -3.5)
mz2 <- ggplot(modz2, aes(Cases, EBSCOhost, fill = PubDate)) +
  geom_col() +
  geom_text(aes(label = round(EBSCOhost, 2))) +
  labs(x = "Cases", y = "EBSCOhost") +
  theme_minimal() +
  coord_flip() +
  guides(fill=guide_legend(title=NULL)) +
  scale_fill_ucscgb(breaks = c(FALSE, TRUE),
                    labels = c("w/o Pub Date", "w/ Pub Date")) +
  theme(axis.text.x = element_text(
    angle = 45,
    hjust = 1,
    colour = "black"
  ))

modz3 <- subset(modz, WoS <= 3.5 & WoS >= -3.5)
mz3 <- ggplot(modz3, aes(Cases, WoS, fill = PubDate)) +
  geom_col() +
  geom_text(aes(label = round(WoS, 2))) +
  labs(x = "Cases", y = "Web of Science") +
  theme_minimal() +
  coord_flip() +
  guides(fill=guide_legend(title=NULL)) +
  scale_fill_ucscgb(breaks = c(FALSE, TRUE),
                    labels = c("w/o Pub Date", "w/ Pub Date")) +
  theme(axis.text.x = element_text(
    angle = 45,
    hjust = 1,
    colour = "black"
  ))

modz4 <- subset(modz, Ovid <= 3.5 & Ovid >= -3.5)
mz4 <- ggplot(modz4, aes(Cases, Ovid, fill = PubDate)) +
  geom_col() +
  geom_text(aes(label = round(Ovid, 2))) +
  labs(x = "Cases", y = "Ovid") +
  theme_minimal() +
  coord_flip() +
  guides(fill=guide_legend(title=NULL)) +
  scale_fill_ucscgb(breaks = c(FALSE, TRUE),
                    labels = c("w/o Pub Date", "w/ Pub Date")) +
  theme(axis.text.x = element_text(
    angle = 45,
    hjust = 1,
    colour = "black"
  ))

fig7 <- grid.arrange(mz1, mz2, mz3, mz4, ncol = 2, nrow = 2)
dev.off()

tiff("plots/fig8-modz-scores-outliers.tif", width = 3840, height = 2160, pointsize = 12, res = 300)
modz5 <- subset(modz, ProQuest <= -3.5 | ProQuest >= 3.5)
mz5 <- ggplot(modz5, aes(Cases, ProQuest, fill = PubDate)) +
  geom_col() +
  geom_text(aes(label = round(ProQuest, 2))) +
  labs(x = "Cases", y = "ProQuest") +
  theme_minimal() +
  coord_flip() +
  guides(fill=guide_legend(title=NULL)) +
  scale_fill_ucscgb(breaks = c(FALSE, TRUE),
                    labels = c("w/o Pub Date", "w/ Pub Date")) +
  theme(axis.text.x = element_text(
    angle = 45,
    hjust = 1,
    colour = "black"
  ))

modz6 <- subset(modz, EBSCOhost <= -3.5 | EBSCOhost >= 3.5)
mz6 <- ggplot(modz6, aes(Cases, EBSCOhost, fill = PubDate)) +
  geom_col() +
  geom_text(aes(label = round(EBSCOhost, 2))) +
  labs(x = "Cases", y = "EBSCOhost") +
  theme_minimal() +
  coord_flip() +
  guides(fill=guide_legend(title=NULL)) +
  scale_fill_ucscgb(breaks = c(FALSE, TRUE),
                    labels = c("w/o Pub Date", "w/ Pub Date")) +
  theme(axis.text.x = element_text(
    angle = 45,
    hjust = 1,
    colour = "black"
  ))

modz7 <- subset(modz, WoS <= -3.5 | WoS >= 3.5)
mz7 <- ggplot(modz7, aes(Cases, WoS, fill = PubDate)) +
  geom_col() +
  geom_text(aes(label = round(WoS, 2))) +
  labs(x = "Cases", y = "Web of Science") +
  theme_minimal() +
  coord_flip() +
  guides(fill=guide_legend(title=NULL)) +
  scale_fill_ucscgb(breaks = c(FALSE, TRUE),
                    labels = c("w/o Pub Date", "w/ Pub Date")) +
  theme(axis.text.x = element_text(
    angle = 45,
    hjust = 1,
    colour = "black"
  ))

modz8 <- subset(modz, Ovid <= -3.5 | Ovid >= 3.5)
mz8 <- ggplot(modz8, aes(Cases, Ovid, fill = PubDate)) +
  geom_col() +
  geom_text(aes(label = round(Ovid, 2))) +
  labs(x = "Cases", y = "Ovid") +
  theme_minimal() +
  coord_flip() +
  guides(fill=guide_legend(title=NULL)) +
  scale_fill_ucscgb(breaks = c(FALSE, TRUE),
                    labels = c("w/o Pub Date", "w/ Pub Date")) +
  theme(axis.text.x = element_text(
    angle = 45,
    hjust = 1,
    colour = "black"
  ))

fig8 <- grid.arrange(mz5, mz6, mz7, mz8, ncol = 2, nrow = 2)
dev.off()
