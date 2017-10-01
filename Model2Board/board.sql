CREATE SEQUENCE BOARD_SEQ START WITH 1
                          INCREMENT BY 1
                          MAXVALUE 9999999999999999999999
                          NOMINVALUE
                          NOORDER
                          NOCYCLE
                          NOCACHE;
                          
                          
-- 또다른 maxvalue 무한설정

CREATE SEQUENCE  BOARD_SEQ
			START WITH 1
			INCREMENT by 1
			NOMAXVALUE
			nocache;

			
drop table board;
create table board(

	num number primary key,
	writer varchar2 (20),
    email varchar2(50),
    subject varchar2(50),
    password varchar2(10),
    reg_date  Date,
	ref number,
    re_step number,
    re_level  number,
	readcount number,
    content  varchar2(3000)
	
);	
		