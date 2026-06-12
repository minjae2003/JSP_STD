drop table freeboard;

create table freeboard(
     num int not null primary key auto_increment,
     writer varchar(20) not null,     
     subject varchar(50) not null,
     reg_date datetime not null,
     readcount int default 0,
     content text not null,
     FOREIGN KEY(writer) REFERENCES member(id)
);

insert into freeboard(writer, subject, reg_date, content)
values ('aaa', 'subject test1', now(), 'content test1');

insert into freeboard(writer, subject, reg_date, content)
values ('aaa', 'subject test2', now(), 'content test2');

insert into freeboard(writer, subject, reg_date, content)
values ('bbb', 'subject test3', now(), 'content test3');

insert into freeboard(writer, subject, reg_date, content)
values ('ccc', 'subject test4', now(), 'content test4');

insert into freeboard(writer, subject, reg_date, content)
values ('ddd', 'subject test5', now(), 'content test5');

insert into freeboard(writer, subject, reg_date, content)
values ('eee', 'subject test6', now(), 'content test6');

insert into freeboard(writer, subject, reg_date, content)
values ('fff', 'subject test7', now(), 'content test7');

insert into freeboard(writer, subject, reg_date, content)
values ('ggg', 'subject test8', now(), 'content test8');

insert into freeboard(writer, subject, reg_date, content)
values ('hhh', 'subject test9', now(), 'content test9');

insert into freeboard(writer, subject, reg_date, content)
values ('iii', 'subject test10', now(), 'content test10');

select * from freeboard order by num desc;

delete from freeboard where num=5;

select * 
from freeboard 
order by num desc
limit 0,10; --시작번호, 검색할 레코드 수 // mysql은 0부터 시작