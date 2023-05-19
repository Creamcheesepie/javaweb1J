show tables;

create table member(
	idx 				int not null auto_increment primary key, /* 회원 고유번호 */
	
	mid					varchar(20) not null,		/* 아이디 */
	salt 				char(8) not null,				/* 암호화salt */	
	pwd 				varchar(100) not null,	/* 비밀번호 */
	name 				varchar(20) not null,		/* 이름 */
	nickName 				varchar(20) not null,		/* 닉네임 */
	email 			varchar(80) not null,		/* 이메일 */
	
	tel 				varchar(16) not null,		/* 전화번호 */
	birthday		datetime,								/* 생일 */
	age 				int not null,						/* 나이 */
	gender 			varchar(10) not null,		/* 성별 */
	address			varchar(30) not null,		/* 주소 */
	
	rideInfo 		varchar(50) not null,		/* 라이딩 정보, 각 정보를 /로 구분하여 입력 */
	inst 				text not null,					/* 자기소개 */
	photo				varchar(20),						/* 프로필 사진 */
	level 			int not null default 0,	/* 등급	 0준회원>1일반회원>2중급회원>3모임장>4운영자>5관리자 */
	totCnt 			int default 0,					/* 총 방문횟수(1일 1회카운트) */
	
	todayCnt 		int not null default 0,	/* 오늘 방문여부 */
	signInDate	datetime default now(),	/* 가입날짜 */
	lastVisit 	datetime default now(),	/* 마지막 방문일자 */
	memberDel		char(2) default 'no'		/* 회원 삭제여부 */
)
desc member;
drop table member;
