create table tbl_reply(
    rno number(10,0),
    bno number(10,0) not null,
    reply varchar2(1000) not null,
    replyer varchar2(50) not null,
    replyDate date default sysdate,
    updateDate date default sysdate);
    
create sequence seq_reply;

alter table tbl_reply add CONSTRAINT pk_reply primary key(rno);

alter table tbl_reply add CONSTRAINT fk_reply_board FOREIGN key(bno) REFERENCES tbl_board(bno);

create index idx_reply on tbl_reply(bno desc, rno asc);

--p480
alter table tbl_board add (replycnt number default 0);
update tbl_board set replycnt = (select count(rno) from tbl_reply where tbl_reply.bno = tbl_board.bno);