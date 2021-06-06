# Count the damage per minute for all firearms
[ .items[] | select (.firerate?) | { itemname: .itemname, dpm: ((.damage) * (.firerate)) } ]