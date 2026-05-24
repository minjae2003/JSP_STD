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

select * from freeboard order by num desc;

delete from freeboard where num=5;

select * 
from freeboard 
order by num desc
limit 0,10; --시작번호, 검색할 레코드 수 // mysql은 0부터 시작