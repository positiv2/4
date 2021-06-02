# Show how many days the users are members.
[.users[] | {user_id: .userid, member_for_days: ((((now) - ((.created|fromdate)))/(24*60*60))|floor) }]