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
