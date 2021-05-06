delimiter ;
drop procedure if exists add_article;
delimiter //
create procedure add_article(in poster_id int(11),in topic varchar(2000),in content varchar(8000))
begin
    insert into article(poster_id,content,time,topic,agreeNum)
    values(poster_id,content,now(),topic,0);
end //
delimiter ;

test:
call add_article(865366186,'求考研二战研友','我想去清华大学交叉信息学院或浙江大学计算机学院读研究生');


delimiter ;
drop procedure if exists add_review;
delimiter //
create procedure add_review(in art_id int(11),in viewer_id int(11),in content varchar(2000))
begin
    insert into review(art_id,viewer_id,content,likeNum,time,timestamp)
    values(art_id,viewer_id,content,0,now(),unix_timestamp(now()));
end //
delimiter ;

test:
call add_review(5,865366186,'我是深圳大学的郑景深，请问我可以做你的研友吗？');


delimiter ;
drop procedure if exists add_collect;
delimiter //
create procedure add_collect(in art_id int(11),in collecter int(11))
begin
    insert into collect(art_id,collecter)
    values(art_id,collecter);
end //
delimiter ;

test:
call add_collect(2,865366186);


delimiter ;
drop procedure if exists add_follower;
delimiter //
create procedure add_follower(in star int(11),in fans int(11))
begin
    insert into follower(star,fans)
    values(star,fans);
end //
delimiter ;


test:
call add_follower(865366186,864738697)

delimiter ;
drop procedure if exists del_resetSession;
DELIMITER // 
create procedure del_resetSession()
BEGIN
	DELETE FROM resetsession WHERE ctime < unix_timestamp(now())-60;
END//
DELIMITER ;

/*删除会议*/
delimiter ;
drop procedure if exists del_sessionlogs;
DELIMITER // 
create procedure del_sessionlogs()
BEGIN
	DELETE FROM sessionlogs WHERE create_time < unix_timestamp(now())-150;
END//
DELIMITER ;

/*删除会议*/
delimiter ;
drop procedure if exists del_singlechat;
DELIMITER // 
create procedure del_singlechat()
BEGIN
	DELETE FROM singlechat WHERE unix_timestamp(chattime) < unix_timestamp(now())-72000;
END//
DELIMITER ;

/*删除会议*/
delimiter ;
drop procedure if exists del_groupchat;
DELIMITER // 
create procedure del_groupchat()
BEGIN
	DELETE FROM groupchat WHERE unix_timestamp(chattime) < unix_timestamp(now())-86400;
END//
DELIMITER ;

delimiter ;
drop procedure if exists del_groupchat_room;
DELIMITER // 
create procedure del_groupchat_room()
BEGIN
	DELETE FROM groupchat WHERE room_id in (select room_id from group_chat_room where time < unix_timestamp(now())-432000);
    DELETE FROM group_chat_room where time < unix_timestamp(now())-432000;
END//
DELIMITER ;