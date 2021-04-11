delimiter ;
drop procedure if exists add_article;
delimiter //
create procedure add_article(in poster_id int(11),in content varchar(8000),in topic varchar(200))
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