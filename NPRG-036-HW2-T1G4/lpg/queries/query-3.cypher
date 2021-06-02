MATCH (shortName:Player)-[:OWNS_CHARACTER]->(sc:Character),
      (longName:Player)-[:OWNS_CHARACTER]->(lc:Character)
WHERE size(shortName.nickname) < 10 AND size(longName.nickname) >= 10
RETURN AVG(lc.kd) > AVG(sc.kd)

// Finds whether players with longer usernames do better or worse than players with shorter ones