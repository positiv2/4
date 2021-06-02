# Get lists of bots and players
{bots: ([.users[] | select(.players[].isbot == true) | .userid] | unique), humans: ([.users[] | select(.players[].isbot == false) | .userid] | unique)}