MATCH (c:Character)<-[:INCLUDES_CHARACTER]-(:Session)-[:PLAYED_ON]->(:PlayingArea {mapId: "de_nuke"})
RETURN AVG(CASE WHEN c.isBot THEN 1 ELSE 0 END)

// Finds the leave rate on Nuke (when a player leaves, they are replaced by a bot)