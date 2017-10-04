--임의  폴더를 만든다. 필자는 D 드리버의 oracleDB 폴더를 생성했다.

-- 콘솔창을 연다

-- C:> cmd

-- DBA 접속

-- C:> sqlplus / as sysdba


-- 테이블 스페이스 생성

create tablespace macaronics
datafile 'D:\oracleDB/macaronics.dbf'
size 50m 
autoextend on
next 10m
maxsize unlimited;


-- 계정 생성

create user macaronics identified by 1111 default tablespace macaronics;


-- 권한 설정
grant connect, resource, create view to macaronics;









-- 관리자 테이블 생성
create table tbl_admin(
	
	id varchar2(20) PRIMARY KEY ,  -- 아이디
	pwd VARCHAR2(20),				-- 비밀번호
	name varchar2(40),				-- 이름
	phone varchar2(20)				-- 전화번호

) TABLESPACE macaronics ;  


-- 주소 테이블 생성
create table tbl_address(

	zip_num VARCHAR2(10),    -- 우편번호
	address1 VARCHAR2(100),  -- 주소
	address2 VARCHAR2(100)   -- 상세주소

);

-- 회원 테이블 생성
create table tbl_member (

  id varchar2(20) PRIMARY KEY , -- 회원아이디
  pwd VARCHAR2(20) ,			-- 회원암호
  name VARCHAR2(40),			-- 회원이름
  email VARCHAR2(40),			-- 회원 이메일
  zip_num VARCHAR2(10),			-- 우편번호
  address VARCHAR2(200),		-- 주소
  phone VARCHAR2(20),			-- 전화번호
  useyn char(1) default 'y',				-- 탈퇴여부 회원의 탈퇴 여부 체크, y:사용가능, n:탈퇴
  ip varchar(100),				-- 가입시 아이피 주소
  indate date default sysdate	-- 가입일
  
)TABLESPACE macaronics ;  
  

-- 상품 테이블

create table tbl_product (

	pseq number PRIMARY KEY , -- product_seq 시퀀스 객체로 자동 일련번호 부여
	name VARCHAR2(100) DEFAULT 0,			-- 상품명 
	kind char(1),		-- 상품 종류 
	price1 number DEFAULT 0,			-- 원가
	price2 number default 0,			-- 판매가
	price3 number DEFAULT 0,			-- 판매가-원가
	content VARCHAR2(3000) null,		-- 상품 내용
	image VARCHAR2(150) DEFAULT 'default.jpg',	
	useyn char(1) DEFAULT 'y', 			-- 상품 사용유무 체크 y: 사용가능 n: 사용불가능
	bestyn char(1) DEFAULT 'n',			-- 베스트상품인지 여부 체크 y:베스트 상품 n:베스트 상품 아님
	indate date default sysdate			-- 등록일
	

) TABLESPACE macaronics ;  

-- 상품 테이블 시퀀스 생성
create SEQUENCE product_seq 
 START WITH 1 
 INCREMENT BY 1
 NOMAXVALUE 
 NOCYCLE ; 


-- 장바구니 테이블

create table  tbl_cart(
	cseq number PRIMARY KEY,  -- 장바구니 번호 - cart_seq 시퀀스로 객체로 자동 일련번호 부여
	id VARCHAR2(20),		--  FK 회원아이디 tbl_number 테이블의 기본키인 id 컬럼	
	pseq number,			-- FK 상품번호  tbl_product 테이블의 기본키인 pseq
	quantity number  DEFAULT 1, -- 수량
	result char(1)   default '1', -- 처리완료여부 1 미처리 2처리
	indate date DEFAULT sysdate	 -- 등록일

)TABLESPACE macaronics ;  

-- 장바구니 테이블 시퀀스 생성

create sequence cart_seq
 START WITH 1
 INCREMENT BY 1
 NOMAXVALUE 
 NOCYCLE ;
 


-- tbl_cart  id 외래키 제약조건 추가
alter table tbl_cart
add constraint tbl_cart_id_fk foreign key(id)
references tbl_member(id) on delete cascade;


-- tbl_cart  pseq 외래키 제약조건 추가
alter table tbl_cart
add CONSTRAINT tbl_cart_pseq_fk FOREIGN KEY (pseq)
REFERENCES tbl_product(pseq) on delete CASCADE ;




-- 주문 테이블 명 tbl_orders

create table tbl_orders(

   oseq number PRIMARY KEY,		 -- 주문번호
   id varchar2(20) 	, 			-- 주문자 아이디 , tbl_member 테이블의 기본키의 id컬럼
   indate date default sysdate		-- 주문일			  
)TABLESPACE macaronics ;  

-- tbl_orders 시퀀스 생성
create SEQUENCE orders_seq 
 START WITH 1
 INCREMENT BY 1
 NOMAXVALUE 
 NOCYCLE ; 
 


 
-- tbl_orders 외래키 제약 조건 추가 
alter table TBL_ORDERS 
add CONSTRAINT TBL_ORDERS_id_fk FOREIGN KEY (id)
REFERENCES tbl_member(id) on DELETE CASCADE ;



-- 주문 상세 테이블 생성
create table tbl_order_detail(
	
	odseq number PRIMARY KEY , -- 주문 상세번호  order_detail_seq 시퀀스 객체로 자동 일련 번호 부여
	oseq number ,			--  FK 주문번호 tbl_orders 테이블의 기본 키인 oseq 컬럼
	pseq number ,			--  FK 상품번호 tbl_product 테이블릐 기본 키인 pseq 컬럼
	quantity number,		-- 주문수량
	result char(1) 	DEFAULT  1  -- 처립여부 1: 미처리 2 : 처리
)TABLESPACE macaronics ;  


-- 주문 상세 테이블 시퀀스 생성
create SEQUENCE order_detail_seq
START WITH 1
INCREMENT by 1
NOMAXVALUE 
NOCACHE 
NOCYCLE;


-- TBL_ORDER_DETAIL oseq 외래키 제약 조건 추가 
alter table TBL_ORDER_DETAIL
add CONSTRAINT tbl_order_detail_oseq_FK FOREIGN key(oseq)
REFERENCES tbl_orders(oseq) on DELETE CASCADE ;


-- TBL_ORDER_DETAIL pseq 외래키 제약 조건 추가 
alter table TBL_ORDER_DETAIL
add CONSTRAINT tbl_order_detail_pseq_FK FOREIGN key(pseq)
REFERENCES tbl_product  (pseq) on DELETE CASCADE ;


-- 테이블 명 tbl_qna 생성
create table tbl_qna(
	
	qseq number PRIMARY KEY , -- 글번호  qna_seq 시퀀스 객체로 자동 일려번호 부여
	subject VARCHAR2(30) ,	-- 제목 
	content VARCHAR2(3000), -- 문의 내용
	reply VARCHAR2(3000),	-- 답변 내용
	id VARCHAR2(20),		-- 작성자 아이디 member 테이블의 기본키인 id 컬럼
	rep char(1) ,			-- 답변 유무  1:답변 무 2:답변 유
	indate date default sysdate

)TABLESPACE macaronics ;  

-- 테이블 명 tbl_qna 시퀀스 생성
CREATE SEQUENCE qna_seq
START WITH 1 
INCREMENT by 1
NOMAXVALUE 
NOCYCLE 
NOCACHE ;


-- tbl_qna id 외래키 제약조건 추가
alter TABLE TBL_QNA
add CONSTRAINT tbl_qna_id_FK FOREIGN KEY (id)
REFERENCES tbl_member (id) on delete CASCADE ;






-- 카트 뷰 생성 
create or replace view cart_view
as
select o.cseq, o.id, o.pseq, m.name mname, p.name pname, 
o.quantity, o.indate, p.price2, o.result 
from tbl_cart o, tbl_member m, tbl_product p 
where o.id = m.id and o.pseq = p.pseq
and result='1';


-- 주문 뷰 생성  ( 주문, 주문상세 회원, 상품  조인 ) 
create or replace view order_view
as
select d.odseq, o.oseq, o.id, o.indate, d.pseq,d.quantity, m.name mname,
m.zip_num, m.address, m.phone, p.name pname, p.price2, d.result   
from tbl_orders o, tbl_order_detail d, tbl_member m, tbl_product p 
where o.oseq=d.oseq and o.id = m.id and d.pseq = p.pseq;
 

 
           
-- 베스트 상품 뷰 생성  (상품 테이블에서 베스트인경우만 추출 )
create or replace view best_pro_view
as
select pseq, name, price2, image 
from( select rownum, pseq, name, price2, image 
      from tbl_product  
      where bestyn='y' 
      order by indate desc)
where  rownum <=12;



-- 신상품 상품 뷰 생성 (상품 테이블에서 신상품 경우만 추출 )
create or replace view new_pro_view
as
select pseq, name, price2, image 
from( select rownum, pseq, name, price2, image 
      from tbl_product  
      where useyn='y' 
      order by indate desc)
where  rownum <=12;







