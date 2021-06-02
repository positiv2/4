CREATE (knife:Knife { label: "Knife", damage: 50, cost: 0 })
CREATE (glock18:Firearm { damage: 30, cost: 200, firerate: 1200, label: "Glock 18", primary: false })
CREATE (gloves:Utility { cost: 0, label: "Gloves", utilityType: "Gloves" })
CREATE (flashbang:Throwable { cost: 200, aoe: 15, damage: 0, label: "Flashbang", count: 2 })
CREATE (bomb:Bomb { cost: 0, aoe: 40, label: "Bomb", damage: 300 })

CREATE (p1:Player { accountName: "jimmy", nickname: "FaZe Jimmy", email: "jimmer@tfwno.gf", created: date("2020-04-20") })
CREATE (p1)-[:IS_PLAYER_IN_SESSION]->(m1:Session { label: "Match #123456", startTime: datetime("2020-05-02T15:55:55") })
CREATE (p1)-[:OWNS_CHARACTER]->(c1:Character { nickname: "FaZe Jimmy", isBot: false, kd: 0.3 })
CREATE (m1)-[:INCLUDES_CHARACTER { as_team: "T" }]->(c1)

CREATE (p2:Player { accountName: "a1b2c3", nickname: "Albert", email: "cheese@gmail.com", created: date("2020-4-21") })
CREATE (p2)-[:IS_PLAYER_IN_SESSION]->(m1)
CREATE (p2)-[:OWNS_CHARACTER]->(c2:Character { nickname: "Albert", isBot: false, kd: 1.67 })
CREATE (m1)-[:INCLUDES_CHARACTER { as_team: "CT" }]->(c2)

CREATE (p2)-[:IS_PLAYER_IN_SESSION]->(m2:Session { label: "Match #234567", startTime: datetime("2021-04-11T14:44:44") })
CREATE (p2)-[:OWNS_CHARACTER]->(c3:Character { nickname: "Albert", isBot: false, kd: 1.33 })
CREATE (m2)-[:INCLUDES_CHARACTER { as_team: "T" }]->(c3)

CREATE (m3:Session { label: "Match #111111", startTime: datetime("2019-12-30T22:22:22") })

CREATE (p3:Player { accountName: "GabeN", nickname: "GabeN", email: "gaben@valvesoftware.com", created: date("2003-11-12") })
CREATE (p3)-[:OWNS_SKIN]->(s1:Skin { condition: 0.9, label: "Fade" })
CREATE (s1)-[:SKIN_FOR]->(knife)
CREATE (p3)-[:OWNS_SKIN]->(s2:Skin { condition: 0.74, label: "Glock-18 | Neo-Noir" })
CREATE (s2)-[:SKIN_FOR]->(glock18)
CREATE (p3)-[:OWNS_SKIN]->(s3:SKin { condition: 0.16, label: "Driver Gloves | Snow Leopard" })
CREATE (s3)-[:SKIN_FOR]->(gloves)

CREATE (spawnBoxT:BoxArea { corner1: point({ x: 124, y: 125, z: 10}), corner2: point({ x: 134, y: 115, z: 20 }) })
CREATE (spawnBoxCT:BoxArea { corner1: point({ x: 302, y: 10, z: 15}), corner2: point({ x: 312, y: 25, z: 25 }) })
CREATE (plantBoxA:BoxArea { corner1: point({ x: 60, y: 120, z: 10}), corner2: point({ x: 66, y: 126, z: 10 }) })
CREATE (plantBoxB:BoxArea { corner1: point({ x: 300, y: 100, z: 10}), corner2: point({ x: 310, y: 94, z: 10 }) })

CREATE (de_dust:PlayingArea { mapName: "Dust", mapId: "de_dust" })-[:SPAWN_LOCATION { team: "T" }]->(spawnBoxT)
CREATE (de_dust)-[:SPAWN_LOCATION { team: "CT" }]->(spawnBoxCT)
CREATE (plantBoxA)<-[:PLANT_AREA]-(de_dust)-[:PLANT_AREA]->(plantBoxB)

CREATE (de_inferno:PlayingArea { mapName: "Inferno", mapId: "de_inferno" })-[:SPAWN_LOCATION { team: "T" }]->(spawnBoxT)
CREATE (de_inferno)-[:SPAWN_LOCATION { team: "CT" }]->(spawnBoxCT)
CREATE (plantBoxA)<-[:PLANT_AREA]-(de_inferno)-[:PLANT_AREA]->(plantBoxB)

CREATE (de_nuke:PlayingArea { mapName: "Nuke", mapId: "de_nuke" })-[:SPAWN_LOCATION { team: "T" }]->(spawnBoxT)
CREATE (de_nuke)-[:SPAWN_LOCATION { team: "CT" }]->(spawnBoxCT)
CREATE (plantBoxA)<-[:PLANT_AREA]-(de_nuke)-[:PLANT_AREA]->(plantBoxB)

CREATE (m1)-[:PLAYED_ON]->(de_inferno)
CREATE (m2)-[:PLAYED_ON]->(de_nuke)
CREATE (m3)-[:PLAYED_ON]->(de_dust)