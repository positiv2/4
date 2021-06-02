MATCH (albert:Player {accountName: "a1b2c3"}),
      (gaben:Player {accountName: "GabeN"}),
      p = shortestPath((albert)-[*..100]-(gaben))
RETURN COUNT(p) > 0 as p

// Finds whether Albert played with Gabe Newell, a player who played with him, and so on