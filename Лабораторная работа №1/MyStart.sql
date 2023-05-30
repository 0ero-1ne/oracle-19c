-- 10 task
create table VDA_t
(
    record_id number(3) PRIMARY KEY,
    record_name varchar2(50)
);

-- 16 task
create table VDA_t_child
(
    record_id number(3) PRIMARY KEY,
    name_id number(3),
    record_surname varchar2(50),
    constraint FK_child_name foreign key (name_id) references VDA_t(record_id)
);

-- 11 task
insert all
    into VDA_t (record_id, record_name) values (1, 'Dmitry')
    into VDA_t (record_id, record_name) values (2, 'Ivan');
    
select * from VDA_t;

commit;
select * from VDA_t;

-- 12 task
update VDA_t set record_name = 'Oleg' where record_id = 2;
update VDA_t set record_name = 'Stanislav' where record_id = 3;

commit;
select * from VDA_t;

-- 13 task
delete from VDA_t where record_id = 3;
select * from VDA_t;
rollback;

-- 15 task
select count(*) from VDA_t;
select * from VDA_t where record_name like 'D%';

-- 17 task
insert into VDA_t_child values (1, 1, 'Volikov');
insert into VDA_t_child values (2, 1, 'Droper');
insert into VDA_t_child values (3, 2, 'Bimon');
insert into VDA_t_child values (4, 2, 'Flex');
insert into VDA_t_child values (5, 2, 'Dry');

select t1.record_name, t2.record_surname
from VDA_t t1
join VDA_t_child t2
on t1.record_id = t2.name_id;

select t1.record_name, t2.record_surname
from VDA_t t1
left join VDA_t_child t2
on t1.record_id = t2.name_id;

alter table VDA_t_child drop constraint FK_child_name;
drop table VDA_t_child;
drop table VDA_t;