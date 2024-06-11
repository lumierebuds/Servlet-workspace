CREATE USER C##MYBATIS IDENTIFIED BY MYBATIS;

GRANT RESOURCE, CONNECT, UNLIMITED TABLESPACE TO C##MYBATIS;

create table student(
    no number,
    name varchar2(100) not null,
    tel char(11) not null,
    reg_date date default sysdate,
    constraint pk_student_no primary key(no)
);

create sequence seq_student_no;