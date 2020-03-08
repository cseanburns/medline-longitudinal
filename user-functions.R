# Function to return specific counts for database and set
# Usage example: retrieveCounts("OML", "set11")
retrieveCounts <- function(db, s) {  
cbind(wqueries$database[wqueries$database == db & wqueries$Set == s],
      wqueries$counts[wqueries$database == db & wqueries$Set == s],
      as.character(wqueries$months[wqueries$database == db & wqueries$Set == s]),
      as.character(wqueries$Set[wqueries$database == db & wqueries$Set == s]))
}

