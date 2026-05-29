drop table replyfreeboard;

create table replyfreeboard(
     rnum int not null primary key auto_increment,
     rwriter varchar(20) not null,     
     reply varchar(500) not null,
     rreg_date datetime not null,
     ref int not null,
     FOREIGN KEY(rwriter) REFERENCES member(id),
     FOREIGN KEY(ref) REFERENCES freeboard(num)
);


insert into replyfreeboard(rwriter, reply, rreg_date, ref)
values ('aaa', 'hello~', now(), 1);

insert into replyfreeboard(rwriter, reply, rreg_date, ref)
values ('bbb', 'hi~', now(), 1);

select * from replyfreeboard order by ref;

