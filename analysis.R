queries <- read.csv("data/longitudinal/queries.csv",
                    header = TRUE, row.names = 1, sep = ",")

# Transpose dataframe
tqueries <- subset(queries, select = c(October:September))
tqueries <- t(tqueries)
tqueries <- as.data.frame(tqueries)

queries$searches <- rownames(queries)
tqueries$months <- rownames(tqueries)

# Subset queries that were limited by pub dates
dqueries <- subset(queries, PubDate == 1)
nochange <- dqueries$September - dqueries$October
# get a count of queries with no changes
table(nochange)
# add this to the dataframe
dqueries$nochange <- nochange

# Subset queries with one MeSH term
mqueries <- subset(queries, MeSH == 1)
nochange <- mqueries$September - mqueries$October
# get a count of queries with no changes
table(nochange)
# add this to the dataframe
mqueries$nochange <- nochange

#png('plots/s001multiplotzoomin.png', width = 1920, height = 1080, pointsize = 24)
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
#dev.off()

layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML002, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 002")
plot(tqueries$PQML002, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 002")
plot(tqueries$EHML002, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 002")
plot(tqueries$WSML002, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 002")
plot(tqueries$OML002, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 002")

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

layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML005, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 005")
plot(tqueries$PQML005, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 005")
plot(tqueries$EHML005, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 005")
plot(tqueries$WSML005, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 005")
plot(tqueries$OML005, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 005")

layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML006, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 006")
plot(tqueries$PQML006, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 006")
plot(tqueries$EHML006, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 006")
plot(tqueries$WSML006, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 006")
plot(tqueries$OML006, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 006")

layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML007, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 007")
plot(tqueries$PQML007, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 007")
plot(tqueries$EHML007, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 007")
plot(tqueries$WSML007, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 007")
plot(tqueries$OML007, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 007")

layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML008, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 008")
plot(tqueries$PQML008, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 008")
plot(tqueries$EHML008, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 008")
plot(tqueries$WSML008, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 008")
plot(tqueries$OML008, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 008")

layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML009, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 009")
plot(tqueries$PQML009, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 009")
plot(tqueries$EHML009, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 009")
plot(tqueries$WSML009, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 009")
plot(tqueries$OML009, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 009")

layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML010, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 010")
plot(tqueries$PQML010, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 010")
plot(tqueries$EHML010, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 010")
plot(tqueries$WSML010, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 010")
plot(tqueries$OML010, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 010")

layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML011, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 011")
plot(tqueries$PQML011, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 011")
plot(tqueries$EHML011, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 011")
plot(tqueries$WSML011, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 011")
plot(tqueries$OML011, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 011")

layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML012, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 012")
plot(tqueries$PQML012, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 012")
plot(tqueries$EHML012, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 012")
plot(tqueries$WSML012, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 012")
plot(tqueries$OML012, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 012")

layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML013, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 013")
plot(tqueries$PQML013, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 013")
plot(tqueries$EHML013, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 013")
plot(tqueries$WSML013, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 013")
plot(tqueries$OML013, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 013")

layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML014, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 014")
plot(tqueries$PQML014, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 014")
plot(tqueries$EHML014, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 014")
plot(tqueries$WSML014, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 014")
plot(tqueries$OML014, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 014")

layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML015, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 015")
plot(tqueries$PQML015, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 015")
plot(tqueries$EHML015, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 015")
plot(tqueries$WSML015, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 015")
plot(tqueries$OML015, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 015")

layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML015, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 015")
plot(tqueries$PQML015, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 015")
plot(tqueries$EHML015, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 015")
plot(tqueries$WSML015, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 015")
plot(tqueries$OML015, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 015")

layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML016, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 016")
plot(tqueries$PQML016, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 016")
plot(tqueries$EHML016, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 016")
plot(tqueries$WSML016, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 016")
plot(tqueries$OML016, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 016")

layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML017, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 017")
plot(tqueries$PQML017, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 017")
plot(tqueries$EHML017, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 017")
plot(tqueries$WSML017, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 017")
plot(tqueries$OML017, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 017")

layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML018, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 018")
plot(tqueries$PQML018, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 018")
plot(tqueries$EHML018, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 018")
plot(tqueries$WSML018, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 018")
plot(tqueries$OML018, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 018")

layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML019, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 019")
plot(tqueries$PQML019, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 019")
plot(tqueries$EHML019, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 019")
plot(tqueries$WSML019, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 019")
plot(tqueries$OML019, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 019")

layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML020, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 020")
plot(tqueries$PQML020, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 020")
plot(tqueries$EHML020, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 020")
plot(tqueries$WSML020, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 020")
plot(tqueries$OML020, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 020")

layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML021, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 021")
plot(tqueries$PQML021, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 021")
plot(tqueries$EHML021, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 021")
plot(tqueries$WSML021, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 021")
plot(tqueries$OML021, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 021")

layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML022, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 022")
plot(tqueries$PQML022, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 022")
plot(tqueries$EHML022, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 022")
plot(tqueries$WSML022, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 022")
plot(tqueries$OML022, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 022")

layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML023, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 023")
plot(tqueries$PQML023, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 023")
plot(tqueries$EHML023, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 023")
plot(tqueries$WSML023, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 023")
plot(tqueries$OML023, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 023")

layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML024, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 024")
plot(tqueries$PQML024, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 024")
plot(tqueries$EHML024, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 024")
plot(tqueries$WSML024, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 024")
plot(tqueries$OML024, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 024")

layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML025, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 025")
plot(tqueries$PQML025, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 025")
plot(tqueries$EHML025, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 025")
plot(tqueries$WSML025, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 025")
plot(tqueries$OML025, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 025")

layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML026, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 026")
plot(tqueries$PQML026, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 026")
plot(tqueries$EHML026, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 026")
plot(tqueries$WSML026, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 026")
plot(tqueries$OML026, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 026")

layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML027, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 027")
plot(tqueries$PQML027, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 027")
plot(tqueries$EHML027, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 027")
plot(tqueries$WSML027, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 027")
plot(tqueries$OML027, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 027")

layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML028, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 028")
plot(tqueries$PQML028, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 028")
plot(tqueries$EHML028, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 028")
plot(tqueries$WSML028, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 028")
plot(tqueries$OML028, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 028")

layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML029, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "PubMed, Query 029")
plot(tqueries$PQML029, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "ProQuest, Query 029")
plot(tqueries$EHML029, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "EBSCOhost, Query 029")
plot(tqueries$WSML029, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Web of Science, Query 029")
plot(tqueries$OML029, type = "b", frame = FALSE,
     xlab = "Months",
     ylab = "Search Hits",
     main = "Ovid, Query 029")

## Zooming out
#png('plots/s003multiplotzoomout.png', width = 1920, height = 1080, pointsize = 24)
layout(rbind(c(1, 2, 3), c(4, 5, 0)))
plot(tqueries$PMML001, type = "b",
     frame = FALSE, pch = 19,
     col = "blue",
     xlab = "Months",
     ylab = "Search Hits",
     xlim=c(0,15),
     ylim=c(2450000, 2600000))
lines(tqueries$PQML001, type = "b", pch = 21, col = "red")
lines(tqueries$EHML001, type = "b", pch = 22, col = "orange")
lines(tqueries$WSML001, type = "b", pch = 23, col = "purple")
lines(tqueries$OML001, type = "b", pch = 24, col = "black")

plot(tqueries$PMML002, type = "b",
     frame = FALSE, pch = 19,
     col = "blue",
     xlab = "Months",
     ylab = "Search Hits",
     xlim=c(0,15),
     ylim=c(385000, 420000))
lines(tqueries$PQML002, type = "b", pch = 21, col = "red")
lines(tqueries$EHML002, type = "b", pch = 22, col = "orange")
lines(tqueries$WSML002, type = "b", pch = 23, col = "purple")
lines(tqueries$OML002, type = "b", pch = 24, col = "black")

plot(tqueries$PMML003, type = "b",
     frame = FALSE, pch = 19,
     col = "blue",
     xlab = "Months",
     ylab = "Search Hits",
     xlim=c(0,15),
     ylim=c(2230000, 2260000))
lines(tqueries$PQML003, type = "b", pch = 21, col = "red")
lines(tqueries$EHML003, type = "b", pch = 22, col = "orange")
lines(tqueries$WSML003, type = "b", pch = 23, col = "purple")
lines(tqueries$OML003, type = "b", pch = 24, col = "black")

plot(tqueries$PMML004, type = "b",
     frame = FALSE, pch = 19,
     col = "blue",
     xlab = "Months",
     ylab = "Search Hits",
     xlim=c(0,15),
     ylim=c(345000, 350000))
lines(tqueries$PQML004, type = "b", pch = 21, col = "red")
lines(tqueries$EHML004, type = "b", pch = 22, col = "orange")
lines(tqueries$WSML004, type = "b", pch = 23, col = "purple")
lines(tqueries$OML004, type = "b", pch = 24, col = "black")

plot(tqueries$PMML005, type = "b",
     frame = FALSE, pch = 19,
     col = "blue",
     xlab = "Months",
     ylab = "Search Hits",
     xlim=c(0,15),
     ylim=c(13000, 16000))
lines(tqueries$PQML005, type = "b", pch = 21, col = "red")
lines(tqueries$EHML005, type = "b", pch = 22, col = "orange")
lines(tqueries$WSML005, type = "b", pch = 23, col = "purple")
lines(tqueries$OML005, type = "b", pch = 24, col = "black")

legend("bottomright", legend=c("PMML", "PQML", "EMML",
                            "WSML", "OML"),
       col = c("blue", "red", "orange", "purple", "black"),
       lty=1:5, cex=1.5)
#dev.off()
