delimiter ;
drop trigger if exists update_likes_trigger;
delimiter //
create trigger update_likes_trigger
after insert on likes for each row
begin
  declare num int(11) default 0;
  select count(*) into num from likes where review_id = new.review_id;
  update review
  set likeNum = num
  where review_id = new.review_id;
end //
delimiter ;

delimiter ;
drop trigger if exists update_good_trigger;
delimiter //
create trigger update_good_trigger
after insert on good for each row
begin
  declare num int(11) default 0;
  select count(*) into num from good where art_id = new.art_id;
  update article
  set agreeNum = num
  where art_id = new.art_id;
end //
delimiter ;

