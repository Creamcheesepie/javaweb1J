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
	
	address			varchar(200) not null,		/* 주소 너무 작아서 입력 안되는 경우 있으니 늘려서 다시 테이블 넣기*/
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

drop table todayAttendMent
create table todayAttendMent(
	idx					int not null auto_increment,
	mIdx		int not null,
	title				varchar(20) not null,
	article			varchar(300) not null,
	wDate				datetime default now(),
	hostIp			varchar(30) not null,
	primary key(idx),
	foreign key(mIdx) references member(idx)
	on update cascade
	on delete restrict
);
desc todayAttendMent;

select *, (select nickName from member where idx=tam.midx)as aNickName, (select mid from member where idx=tam.midx)as aMid from todayAttendMent tam;

select * from todayAttendMent where date_format(wDate,'%Y-%m-%d')="2023-05-22";


create table board(
	idx					int not null auto_increment,
	mIdx				int not null,
	title 			varchar(30) not null,
	article			text not null,
	wDate				datetime not null default now(),
	hostIp			varchar(20) not null,
	category		char(2) not null,
	viewCnt			int default 0,
	recommend 	int default 0,
	primary key(idx),
	foreign key(mIdx) references member(idx)
	on update cascade
	on delete restrict
);
drop table board;
desc board;

insert into board values(default,1,'안녕','테스트야',default,'192.168.0.1','관리',default,default);
select * from board where midx=1 and title='안녕' order by idx desc limit 1;

create table boardRecommend(
	bIdx		int not null,
	mIdx		int not null,
	rDate		datetime not null default now(),
	foreign key(mIdx) references member(idx)
	on update cascade
	on delete restrict,
	foreign key(bIdx) references board(idx)
	on update cascade
	on delete restrict
);
desc boardRecommend;
drop table boardRecommend;

create table b_reple(
	idx				int not null auto_increment primary key,
	bIdx			int not null,
	mIdx			int not null,
	reple			varchar(300) not null,
	wTime datetime not null default now(),
	foreign key(bIdx) references board(idx)
	on update cascade
	on delete restrict,
	foreign key(mIdx) references member(idx)
	on update cascade
	on delete restrict
);
desc b_reple;
drop table b_reple;

create table gethering(
	idx								int not null auto_increment primary key,
	
	mIdx							int not null,
	title							varchar(40) not null,
	content						varchar(1000) not null,
	getheringType			varchar(3) not null,
	location 					varchar(30) not null,
	
	totalGetherMember int not null default 2,
	getherJoinMember	int not null,
	gpxFileName				varchar(100),
	distance					int not null,
	getHeight					int,
	
	detailCourse			text,
	getherTime				datetime not null,
	wDate							datetime not null default now(),
	hostIp						varchar(30),
	
	foreign key(mIdx) references member(idx)
	on update cascade
	on delete restrict
);

insert into gethering values(default,1,'모임기능 테스트','네, 테스트 중입니다.','관리','충청북도 청주시 흥덕구 복대동',100,34,'test.gpx',75,350,'흥덕구-옥산면-봉명동','2023-05-04',default,'192.168.50.88');
desc gethering;
drop table gethering;

create table getherJoinMember(
	idx				int not null auto_increment primary key,
	gIdx			int not null,
	mIdx			int not null,
	jDate			datetime not null default now(),
	foreign key(mIdx) references member(idx)
	on update cascade
	on delete restrict,
	foreign key(gIdx) references gethering(idx)
	on update cascade
	on delete restrict
);
desc getherJoinMember;
drop table getherJoinMember;
