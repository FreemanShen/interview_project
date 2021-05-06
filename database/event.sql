create event del_regSession_event  
on schedule 
EVERY 1 minute  
STARTS '2021-5-4 00:00:00'  
do call del_regSession()

create event del_resetSession_event  
on schedule 
EVERY 1 minute  
STARTS '2021-5-4 00:00:00'  
do call del_resetSession()


create event del_sessionlogs_event  
on schedule 
EVERY 1 minute  
STARTS '2021-5-5 00:00:00'  
do call del_sessionlogs()

create event del_singlechat_event  
on schedule 
EVERY 1 minute  
STARTS '2021-5-6 00:00:00'  
do call del_singlechat()

create event del_groupchat_event  
on schedule 
EVERY 1 hour  
STARTS '2021-5-6 00:00:00'  
do call del_groupchat()

create event del_groupchat_room_event  
on schedule 
EVERY 1 day  
STARTS '2021-5-6 00:00:00'  
do call del_groupchat_room()