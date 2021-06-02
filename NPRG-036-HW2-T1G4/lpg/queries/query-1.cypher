MATCH (match:Session)-[:PLAYED_ON]->(PlayingArea { mapId: "de_nuke" })
RETURN match.label
ORDER BY match.startTime
LIMIT 1

// Returns the latest match played on de_nuke