# Counts volumes for plant locations
[ .maps[] | { mapid: .mapid, plant_loc_volumes: [ .plantlocations[] | (((.x1 - .x2) | fabs) * ((."y1" - ."y2") | fabs) * ((."z1" - ."z2") | fabs)) ] }]