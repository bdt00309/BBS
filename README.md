- JSP와 OracleDeveloper를 이용하여 인강을 학습하는 과정에서 만든 게시판입니다
- 테이블 생성 쿼리문


create table member(
userId varchar(20),
userPasswd varchar(20),
userName varchar(20),
userGender varchar(20),
userEmail varchar(50),
primary key(userId)
);


create table bbs(
bbsId number,
bbsTitle varchar(50),
userId varchar(20),
bbsDate date not null,
bbsContent varchar(2048),
bbsAvailable number,  --글 삭제여부 확인 목적
primary key(bbsId)
);
