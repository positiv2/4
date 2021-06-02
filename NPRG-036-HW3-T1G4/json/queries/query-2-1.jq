# Count the damage per minute for all firearms
[ .items.firearms[] | { itemname: .itemname, dpm: ((.damage) * (.firerate)) } ]