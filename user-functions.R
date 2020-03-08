# Function to return specific counts for database and set
# Usage example: retrieveCounts("OML", "set11")
retrieveCounts <- function(db, s) {  
cbind(lqueries$database[lqueries$database == db & lqueries$Set == s],
      lqueries$counts[lqueries$database == db & lqueries$Set == s],
      as.character(lqueries$Set[lqueries$database == db & lqueries$Set == s]))
}