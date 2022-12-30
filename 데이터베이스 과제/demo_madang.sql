/* 이름: demo_madang.sql */
/* 설명 */
 
/* root 계정으로 접속, madang 데이터베이스 생성, madang 계정 생성 */
/* MySQL Workbench에서 초기화면에서 +를 눌러 root connection을 만들어 접속한다. */
DROP DATABASE IF EXISTS  madang;
DROP USER IF EXISTS  madang@localhost;
create user madang@localhost identified WITH mysql_native_password  by 'madang';
create database madang;
grant all privileges on madang.* to madang@localhost with grant option;
commit;

/* madang DB 자료 생성 */
/* 이후 실습은 MySQL Workbench에서 초기화면에서 +를 눌러 madang connection을 만들어 접속하여 사용한다. */
 
USE madang;

/*  외래키 설정하기 */
/* 예매정보에 티켓정보 추가하기 */
/*  */

/* 영화 */
CREATE TABLE Movie (
  movieid	INTEGER PRIMARY KEY,	/* 영화번호 */
  moviename	VARCHAR(40),			/* 영화명	*/
  runtime   FLOAT,					/* 상영시간*/
  grade		VARCHAR(40),			/* 상영등급*/
  director	VARCHAR(40),			/* 감독명 */
  actor		VARCHAR(40),			/* 배우명 */
  genre		VARCHAR(40),			/* 장르 */
  intro		VARCHAR(40),			/* 영화소개 */
  opendate	VARCHAR(40)					/* 개봉일 */
);

/* 상영관 */
CREATE TABLE Screen (
  screenid	INTEGER PRIMARY KEY,	/* 상영관번호	*/
  seatnum	INTEGER,				/* 좌석수	*/
  isscreenuse   BOOL				/* 상영관사용여부 */
);

/* 회원고객 */
CREATE TABLE _Member(
  memberid	INTEGER PRIMARY KEY,	/* 회원아이디	*/
  membername	VARCHAR(40),		/* 고객명 */
  phonenum  VARCHAR(40),			/* 휴대폰번호 */
  email	VARCHAR(40)					/* 전자메일주소 */
);

/* TABLE 이름 변경 */
/* 상영일정 */
CREATE TABLE _Schedule(
  scheduleid	INTEGER PRIMARY KEY,	/* 상영일정번호	*/
  movieid	INTEGER,					/* 영화번호 */
  screenid  INTEGER,					/* 상영관번호*/
  sopendate	VARCHAR(40),						/* 상영시작일*/
  sopenday	VARCHAR(40),				/* 상영요일*/
  screencount INTEGER,					/* 상영회차*/
  sopentime	VARCHAR(40),						/* 상영시작시간*/
  FOREIGN KEY (movieid) REFERENCES Movie(movieid),
  FOREIGN KEY (screenid) REFERENCES Screen(screenid)
);

/* 좌석 */
CREATE TABLE Seat(
  seatid	INTEGER PRIMARY KEY,	/* 좌석번호	*/
  screenid	INTEGER,				/* 상영관번호 */
  isseat  BOOL,						/* 좌석사용여부 */
  FOREIGN KEY (screenid) REFERENCES Screen(screenid) /* 상영관번호 외래키 */
);

/* 예매정보 */
CREATE TABLE Reservation(
  reservationid	INTEGER PRIMARY KEY,	/* 예매번호 */
  paymentmethod	VARCHAR(40),			/* 결제방법 */
  paymentstate  BOOL,					/* 결제상태 */
  paymentprice	INTEGER,				/* 결제금액 */
  memberid	INTEGER,					/* 회원아이디 */
  paymentdate VARCHAR(40),						/* 결제일자 */
  /*ticketnum	INTEGER,				/* 티켓번호 */
  FOREIGN KEY (memberid) REFERENCES _Member(memberid) /* 멤버번호 외래키 */
);

/* 티켓 */
CREATE TABLE Ticket(
  ticketid	INTEGER PRIMARY KEY,	/* 티켓번호	*/
  scheduleid	INTEGER,			/* 상영일정번호 */
  screenid  INTEGER,				/* 상영관번호 */
  seatid	INTEGER,				/* 좌석번호 */
  reservationid	INTEGER,			/* 예매번호 */
  isticketing BOOL,					/* 발권여부 */
  standardprice	INTEGER,			/* 표준가격 */
  saleprice INTEGER,				/* 판매가격 */
  FOREIGN KEY (scheduleid) REFERENCES _Schedule(scheduleid),		/*상영일정번호 외래키*/
  FOREIGN KEY (screenid) REFERENCES Screen(screenid),				/*상영관번호 외래키*/
  FOREIGN KEY (seatid) REFERENCES Seat(seatid),						/*좌석번호 외래키*/
  FOREIGN KEY (reservationid) REFERENCES Reservation(reservationid)	/*예매번호 외래키*/
);


/*회원번호 데이터 입력 최소 10개*/
INSERT INTO _Member VALUES(18010847,"박상욱","010-5187-5312","dkxkqkrtkddn@naver.com");
INSERT INTO _Member VALUES(21011761,"손재호","010-1111-2222","sonjaeho@naver.com");
INSERT INTO _Member VALUES(19010706,"동기창","010-1111-3333","dongi@naver.com");
INSERT INTO _Member VALUES(20003119,"김도형","010-0112-5555","dohyeong@naver.com");
INSERT INTO _Member VALUES(20012305,"이승언","010-2232-1112","aaa@naver.com");
INSERT INTO _Member VALUES(19850231,"이규리","010-1232-5312","bbb@naver.com");
INSERT INTO _Member VALUES(19203021,"임영빈","010-5551-8086","imyoung@naver.com");
INSERT INTO _Member VALUES(21858302,"박규태","010-1235-2825","gyutae@naver.com");
INSERT INTO _Member VALUES(16020362,"주이식","010-2959-1293","hello2sic@naver.com");
INSERT INTO _Member VALUES(20238156,"강은우","010-1232-9693","kangenuo@gmail.com");

/*상영관 데이터 입력 최소 10개*/
INSERT INTO Screen VALUES(0301,5,TRUE);
INSERT INTO Screen VALUES(0302,5,TRUE);
INSERT INTO Screen VALUES(0303,5,TRUE);
INSERT INTO Screen VALUES(0304,5,TRUE);
INSERT INTO Screen VALUES(0305,5,TRUE);
INSERT INTO Screen VALUES(0306,5,TRUE);
INSERT INTO Screen VALUES(0307,5,TRUE);
INSERT INTO Screen VALUES(0308,5,TRUE);
INSERT INTO Screen VALUES(0309,5,TRUE);
INSERT INTO Screen VALUES(0310,5,TRUE);

/*예매정보 데이터 입력 최소 10개*/
INSERT INTO Reservation VALUES(0701,"온라인결제",TRUE,15000,18010847,20220530);
INSERT INTO Reservation VALUES(0702,"온라인결제",TRUE,15000,18010847,20220530);
INSERT INTO Reservation VALUES(0703,"온라인결제",FALSE,15000,18010847,20220530);
INSERT INTO Reservation VALUES(0704,"온라인결제",FALSE,15000,18010847,20220530);
INSERT INTO Reservation VALUES(0705,"온라인결제",FALSE,15000,18010847,20220530);
INSERT INTO Reservation VALUES(0706,"현장결제",TRUE,15000,18010847,20220530);
INSERT INTO Reservation VALUES(0707,"현장결제",TRUE,15000,18010847,20220530);
INSERT INTO Reservation VALUES(0708,"현장결제",FALSE,15000,18010847,20220530);
INSERT INTO Reservation VALUES(0709,"현장결제",FALSE,15000,18010847,20220530);
INSERT INTO Reservation VALUES(0710,"현장결제",FALSE,15000,18010847,20220530);

/*영화 데이터 입력 최소 10개*/
INSERT INTO Movie VALUES(0101,"해운대",2,"19","강동민","하지원","재난","쓰나미를 피하라",20210130);
INSERT INTO Movie VALUES(0102,"인셉션",3,"15","이동엽","레오나르도 디카프리오","추리","꿈속의 꿈",20210209);
INSERT INTO Movie VALUES(0103,"범죄도시",2,"19","이경은","마동석","액션","마동석의 액션쾌감",20210307);
INSERT INTO Movie VALUES(0104,"범죄도시2",2,"15","김하늬","마동석","액션","액션쾌감의 마동석",20210430);
INSERT INTO Movie VALUES(0105,"마스터",2,"15","엄준식","현빈","추리","속고 속이는 마스터",20210509);
INSERT INTO Movie VALUES(0106,"공공의적",2,"15","장지환","설경구","액션","모두가 모두의 적이다",20210613);
INSERT INTO Movie VALUES(0107,"2012",3,"12","김찬호","우디 해럴슨","재난","몰려오는 재난을 피해라",20210731);
INSERT INTO Movie VALUES(0108,"쥬라기월드",3,"12","박보영","크리스 프랫","액션","공룡이 되살아났다",20210814);
INSERT INTO Movie VALUES(0109,"컨져링",2,"19","이지은","류국봉","공포","상상 그 이상으로 무서움",20210927);
INSERT INTO Movie VALUES(0110,"곡성",2,"15","임수빈","윤찬영","공포","뭣이 중한디!",20211019);

/*상영일정 데이터 입력 최소 10개*/
INSERT INTO _Schedule VALUES(0201,0101,0301,20210130,"일요일",1,20210130001500);	/*상영회차는 sql count로 계산한 다음에 넣어줘야 할듯*/
INSERT INTO _Schedule VALUES(0202,0102,0302,20210209,"월요일",1,20210209001500);
INSERT INTO _Schedule VALUES(0203,0103,0303,20210307,"화요일",1,20210307001500);
INSERT INTO _Schedule VALUES(0204,0104,0304,20210430,"수요일",1,20210430001500);
INSERT INTO _Schedule VALUES(0205,0105,0305,20210509,"목요일",1,20210509001500);
INSERT INTO _Schedule VALUES(0206,0106,0306,20210613,"금요일",1,20210613001500);
INSERT INTO _Schedule VALUES(0207,0107,0307,20210731,"토요일",1,20210731001500);
INSERT INTO _Schedule VALUES(0208,0108,0308,20210814,"일요일",1,20210814001500);
INSERT INTO _Schedule VALUES(0209,0109,0309,20210927,"월요일",1,20210927001500);
INSERT INTO _Schedule VALUES(0210,0110,0310,20211019,"화요일",1,20211019001500);

/* 좌석 데이터 입력 최소 10개 */
INSERT INTO Seat VALUES(0501,0301,TRUE);
INSERT INTO Seat VALUES(0502,0302,TRUE);
INSERT INTO Seat VALUES(0503,0303,FALSE);
INSERT INTO Seat VALUES(0504,0304,FALSE);
INSERT INTO Seat VALUES(0505,0305,FALSE);
INSERT INTO Seat VALUES(0506,0306,TRUE);
INSERT INTO Seat VALUES(0507,0307,TRUE);
INSERT INTO Seat VALUES(0508,0308,FALSE);
INSERT INTO Seat VALUES(0509,0309,FALSE);
INSERT INTO Seat VALUES(0510,0310,FALSE);

/* 티켓 데이터 입력 최소 10개 */
INSERT INTO Ticket VALUES(0401,0201,0301,0501,0701,TRUE,15000,15000);
INSERT INTO Ticket VALUES(0402,0202,0302,0502,0702,TRUE,15000,15000);
INSERT INTO Ticket VALUES(0403,0203,0303,0503,0703,FALSE,15000,15000);
INSERT INTO Ticket VALUES(0404,0204,0304,0504,0704,FALSE,15000,15000);
INSERT INTO Ticket VALUES(0405,0205,0305,0505,0705,FALSE,15000,15000);
INSERT INTO Ticket VALUES(0406,0206,0306,0506,0706,TRUE,15000,15000);
INSERT INTO Ticket VALUES(0407,0207,0307,0507,0707,TRUE,15000,15000);
INSERT INTO Ticket VALUES(0408,0208,0308,0508,0708,FALSE,15000,15000);
INSERT INTO Ticket VALUES(0409,0209,0309,0509,0709,FALSE,15000,15000);
INSERT INTO Ticket VALUES(0410,0210,0310,0510,0710,FALSE,15000,15000);

DROP TABLE IF EXISTS Ticket;
DROP TABLE IF EXISTS Seat;
DROP TABLE IF EXISTS _Schedule;
DROP TABLE IF EXISTS Movie;
DROP TABLE IF EXISTS Reservation;
DROP TABLE IF EXISTS Screen;
DROP TABLE IF EXISTS _Member;

CREATE TABLE Movie (
  movieid	INTEGER PRIMARY KEY,	/* 영화번호 */
  moviename	VARCHAR(40),			/* 영화명	*/
  runtime   FLOAT,					/* 상영시간*/
  grade		VARCHAR(40),			/* 상영등급*/
  director	VARCHAR(40),			/* 감독명 */
  actor		VARCHAR(40),			/* 배우명 */
  genre		VARCHAR(40),			/* 장르 */
  intro		VARCHAR(40),			/* 영화소개 */
  opendate	VARCHAR(40)					/* 개봉일 */
);

/* 상영관 */
CREATE TABLE Screen (
  screenid	INTEGER PRIMARY KEY,	/* 상영관번호	*/
  seatnum	INTEGER,				/* 좌석수	*/
  isscreenuse   BOOL				/* 상영관사용여부 */
);

/* 회원고객 */
CREATE TABLE _Member(
  memberid	INTEGER PRIMARY KEY,	/* 회원아이디	*/
  membername	VARCHAR(40),		/* 고객명 */
  phonenum  VARCHAR(40),			/* 휴대폰번호 */
  email	VARCHAR(40)					/* 전자메일주소 */
);

/* TABLE 이름 변경 */
/* 상영일정 */
CREATE TABLE _Schedule(
  scheduleid	INTEGER PRIMARY KEY,	/* 상영일정번호	*/
  movieid	INTEGER,					/* 영화번호 */
  screenid  INTEGER,					/* 상영관번호*/
  sopendate	VARCHAR(40),						/* 상영시작일*/
  sopenday	VARCHAR(40),				/* 상영요일*/
  screencount INTEGER,					/* 상영회차*/
  sopentime	VARCHAR(40),						/* 상영시작시간*/
  FOREIGN KEY (movieid) REFERENCES Movie(movieid),
  FOREIGN KEY (screenid) REFERENCES Screen(screenid)
);

/* 좌석 */
CREATE TABLE Seat(
  seatid	INTEGER PRIMARY KEY,	/* 좌석번호	*/
  screenid	INTEGER,				/* 상영관번호 */
  isseat  BOOL,						/* 좌석사용여부 */
  FOREIGN KEY (screenid) REFERENCES Screen(screenid) /* 상영관번호 외래키 */
);

/* 예매정보 */
CREATE TABLE Reservation(
  reservationid	INTEGER PRIMARY KEY,	/* 예매번호 */
  paymentmethod	VARCHAR(40),			/* 결제방법 */
  paymentstate  BOOL,					/* 결제상태 */
  paymentprice	INTEGER,				/* 결제금액 */
  memberid	INTEGER,					/* 회원아이디 */
  paymentdate VARCHAR(40),						/* 결제일자 */
  FOREIGN KEY (memberid) REFERENCES _Member(memberid) /* 멤버번호 외래키 */
);

/* 티켓 */
CREATE TABLE Ticket(
  ticketid	INTEGER PRIMARY KEY,	/* 티켓번호	*/
  scheduleid	INTEGER,			/* 상영일정번호 */
  screenid  INTEGER,				/* 상영관번호 */
  seatid	INTEGER,				/* 좌석번호 */
  reservationid	INTEGER,			/* 예매번호 */
  isticketing BOOL,					/* 발권여부 */
  standardprice	INTEGER,			/* 표준가격 */
  saleprice INTEGER,				/* 판매가격 */
  FOREIGN KEY (scheduleid) REFERENCES _Schedule(scheduleid),		/*상영일정번호 외래키*/
  FOREIGN KEY (screenid) REFERENCES Screen(screenid),				/*상영관번호 외래키*/
  FOREIGN KEY (seatid) REFERENCES Seat(seatid),						/*좌석번호 외래키*/
  FOREIGN KEY (reservationid) REFERENCES Reservation(reservationid)	/*예매번호 외래키*/
);


/*회원번호 데이터 입력 최소 10개*/
INSERT INTO _Member VALUES(0601,"박상욱","010-5187-5312","dkxkqkrtkddn@naver.com");
INSERT INTO _Member VALUES(0602,"손재호","010-1111-2222","sonjaeho@naver.com");
INSERT INTO _Member VALUES(0603,"동기창","010-1111-3333","dongi@naver.com");
INSERT INTO _Member VALUES(0604,"김도형","010-0112-5555","dohyeong@naver.com");
INSERT INTO _Member VALUES(0605,"이승언","010-2232-1112","aaa@naver.com");
INSERT INTO _Member VALUES(0606,"이규리","010-1232-5312","bbb@naver.com");
INSERT INTO _Member VALUES(0607,"임영빈","010-5551-8086","imyoung@naver.com");
INSERT INTO _Member VALUES(0608,"박규태","010-1235-2825","gyutae@naver.com");
INSERT INTO _Member VALUES(0609,"주이식","010-2959-1293","hello2sic@naver.com");
INSERT INTO _Member VALUES(0610,"강은우","010-1232-9693","kangenuo@gmail.com");

/*상영관 데이터 입력 최소 10개*/
INSERT INTO Screen VALUES(0301,5,TRUE);
INSERT INTO Screen VALUES(0302,5,TRUE);
INSERT INTO Screen VALUES(0303,5,TRUE);
INSERT INTO Screen VALUES(0304,5,TRUE);
INSERT INTO Screen VALUES(0305,5,TRUE);
INSERT INTO Screen VALUES(0306,5,TRUE);
INSERT INTO Screen VALUES(0307,5,TRUE);
INSERT INTO Screen VALUES(0308,5,TRUE);
INSERT INTO Screen VALUES(0309,5,TRUE);
INSERT INTO Screen VALUES(0310,5,TRUE);

/*예매정보 데이터 입력 최소 10개*/
INSERT INTO Reservation VALUES(0701,"온라인결제",TRUE,15000,0601,20220130);
INSERT INTO Reservation VALUES(0702,"온라인결제",TRUE,15000,0602,20210230);
INSERT INTO Reservation VALUES(0703,"온라인결제",FALSE,15000,0603,20210330);
INSERT INTO Reservation VALUES(0704,"온라인결제",FALSE,15000,0604,20220430);
INSERT INTO Reservation VALUES(0705,"온라인결제",FALSE,15000,0605,20220530);
INSERT INTO Reservation VALUES(0706,"현장결제",TRUE,15000,0606,20220630);
INSERT INTO Reservation VALUES(0707,"현장결제",TRUE,15000,0607,20220730);
INSERT INTO Reservation VALUES(0708,"현장결제",FALSE,15000,0608,20220830);
INSERT INTO Reservation VALUES(0709,"현장결제",FALSE,15000,0609,20220930);
INSERT INTO Reservation VALUES(0710,"현장결제",FALSE,15000,0610,20221030);

/*영화 데이터 입력 최소 10개*/
INSERT INTO Movie VALUES(0101,"해운대",2,"19","강동민","하지원","재난","쓰나미를 피하라",20210130);
INSERT INTO Movie VALUES(0102,"인셉션",3,"15","이동엽","레오나르도 디카프리오","추리","꿈속의 꿈",20210209);
INSERT INTO Movie VALUES(0103,"범죄도시",2,"19","이경은","마동석","액션","마동석의 액션쾌감",20210307);
INSERT INTO Movie VALUES(0104,"범죄도시2",2,"15","김하늬","마동석","액션","액션쾌감의 마동석",20210430);
INSERT INTO Movie VALUES(0105,"마스터",2,"15","엄준식","현빈","추리","속고 속이는 마스터",20210509);
INSERT INTO Movie VALUES(0106,"공공의적",2,"15","장지환","설경구","액션","모두가 모두의 적이다",20210613);
INSERT INTO Movie VALUES(0107,"2012",3,"12","김찬호","우디 해럴슨","재난","몰려오는 재난을 피해라",20210731);
INSERT INTO Movie VALUES(0108,"쥬라기월드",3,"12","박보영","크리스 프랫","액션","공룡이 되살아났다",20210814);
INSERT INTO Movie VALUES(0109,"컨져링",2,"19","이지은","류국봉","공포","상상 그 이상으로 무서움",20210927);
INSERT INTO Movie VALUES(0110,"곡성",2,"15","임수빈","윤찬영","공포","뭣이 중한디!",20211019);

/*상영일정 데이터 입력 최소 10개*/
INSERT INTO _Schedule VALUES(0201,0101,0301,20210130,"일요일",1,20210130);	/*상영회차는 sql count로 계산한 다음에 넣어줘야 할듯*/
INSERT INTO _Schedule VALUES(0202,0102,0302,20210209,"월요일",1,20210209);
INSERT INTO _Schedule VALUES(0203,0103,0303,20210307,"화요일",1,20210307);
INSERT INTO _Schedule VALUES(0204,0104,0304,20210430,"수요일",1,20210430);
INSERT INTO _Schedule VALUES(0205,0105,0305,20210509,"목요일",1,20210509);
INSERT INTO _Schedule VALUES(0206,0106,0306,20210613,"금요일",1,20210613);
INSERT INTO _Schedule VALUES(0207,0107,0307,20210731,"토요일",1,20210731);
INSERT INTO _Schedule VALUES(0208,0108,0308,20210814,"일요일",1,20210814);
INSERT INTO _Schedule VALUES(0209,0109,0309,20210927,"월요일",1,20210927);
INSERT INTO _Schedule VALUES(0210,0110,0310,20211019,"화요일",1,20211019);
INSERT INTO _Schedule VALUES(0211,0101,0301,20210131,"월요일",2,20210131);	/*상영회차는 sql count로 계산한 다음에 넣어줘야 할듯*/

/* 좌석 데이터 입력 최소 10개 */
INSERT INTO Seat VALUES(0501,0301,TRUE);
INSERT INTO Seat VALUES(0502,0302,TRUE);
INSERT INTO Seat VALUES(0503,0303,FALSE);
INSERT INTO Seat VALUES(0504,0304,FALSE);
INSERT INTO Seat VALUES(0505,0305,FALSE);
INSERT INTO Seat VALUES(0506,0306,TRUE);
INSERT INTO Seat VALUES(0507,0307,TRUE);
INSERT INTO Seat VALUES(0508,0308,FALSE);
INSERT INTO Seat VALUES(0509,0309,FALSE);
INSERT INTO Seat VALUES(0510,0310,FALSE);

/* 티켓 데이터 입력 최소 10개 */
INSERT INTO Ticket VALUES(0401,0201,0301,0501,0701,TRUE,15000,15000);
INSERT INTO Ticket VALUES(0402,0202,0302,0502,0702,TRUE,15000,15000);
INSERT INTO Ticket VALUES(0403,0203,0303,0503,0703,FALSE,15000,15000);
INSERT INTO Ticket VALUES(0404,0204,0304,0504,0704,FALSE,15000,15000);
INSERT INTO Ticket VALUES(0405,0205,0305,0505,0705,FALSE,15000,15000);
INSERT INTO Ticket VALUES(0406,0206,0306,0506,0706,TRUE,15000,15000);
INSERT INTO Ticket VALUES(0407,0207,0307,0507,0707,TRUE,15000,15000);
INSERT INTO Ticket VALUES(0408,0208,0308,0508,0708,FALSE,15000,15000);
INSERT INTO Ticket VALUES(0409,0209,0309,0509,0709,FALSE,15000,15000);
INSERT INTO Ticket VALUES(0410,0210,0310,0510,0710,FALSE,15000,15000);

commit;


Select *
from Movie;

Select *
from _Schedule;

Select *
from Screen;

Select *
from Ticket;

Select *
from Seat;

Select *
from _Member;

Select *
from Reservation;

# 회원 기능

# 로그인 기능
SELECT memberid
FROM _Member;

#모든 영화에 대한 조회 기능 //이때 str은 모두 “%”로 초기화해야 입력 안된 정보 무시 가능 
SELECT *
from Movie where moviename Like '%' and director Like '%' and actor Like '%' and genre Like '%';

#선택 가능한 상영일자 + 상영요일 //상영일자번호 저장 
SELECT *

from _Schedule 

where _Schedule.movieid =  

(select Movie.movieid 

from Movie 

where moviename = "해운대"); /* 영화이름은 str로 자바에서 처리 */

#선택 가능한 상영관 

SELECT Screen.screenid 

from Screen,_Schedule 

where Screen.screenid = _Schedule.screenid and 

scheduleid = 0201; #자바에서 동적으로 처리

#선택 가능한 좌석
Select seatid
from Seat
where Seat.screenid IN 
(
	Select Screen.screenid
	from Screen
	where Screen.screenid = 0301 #자바에서 동적으로 처리
) and
Seat.isseat = FALSE;

# 지금까지 저장된 정보를 가지고 Reservation 삽입
INSERT INTO Reservation VALUES(0711,"온라인결제",True,15000,18010847,20220602000000);

#Ticket 정보 업데이트
UPDATE Ticket
SET scheduleid = 0201 and screenid = 0301 and reservationid = 0701 and isticketing = True
where seatid = "0401"; #자바에서 동적으로 처리

#좌석 사용 여부 업데이트
UPDATE Seat
SET isseat = True
where seatid = 0401;

#본인이 예매한 영화에 대해서 영화명, 상영일, 상영관번호, 좌석번호, 및 판매가격 정보를 보여주는 기능 

SELECT Reservation.memberid, movie.moviename, _Schedule.scheduleid, Ticket.seatid, Ticket.saleprice, Ticket.ticketid 

from Movie,_Schedule,Ticket,Reservation

where #Reservation.reservationid = 0701  and  #자바에서 str로 처리

Ticket.reservationid = Reservation.reservationid and 

Reservation.memberid = "0601" and #자바에서 str로 처리

_Schedule.scheduleid = Ticket.scheduleid and 

Movie.movieid = _Schedule.movieid;

#위에서 표시된 예매 정보 중에서 하나를 클릭하면 해당 예매에 대한 모든 상영일정, 상영관, 티켓 정보표시 기능 
#상영일정, 상영관, 티켓 다 따로따로 처리해야하나? Distinct 써서 처리하면 좋을듯?

SELECT * 

from _Schedule, Screen, Ticket

where Ticket.scheduleid = _Schedule.scheduleid and
Ticket.screenid = Screen.screenid and
Ticket.reservationid = 0701; #자바에서 동적으로 처리

# 본인이 예매한 영화에 대하여 조회하고 한 개 이상의 예매 정보를 삭제하는 기능  
# 본인이 예매한 영화 조회
Select * from Movie where movieid IN 
(
	Select movieid 
	from _Schedule
	where scheduleid = 
	(
		select scheduleid
        from Ticket,Reservation
        where Ticket.reservationid = Reservation.reservationid and
        Ticket.reservationid = 0701 #str은 자바에서 처리
	)
);

#예매 정보 변경된거 확인용 삭제, 영화변경, 상영일자 변경
Select * 
from Ticket
where ticketid = 0401;

Select *
from Seat
where seatid = 0501;

Select *
from Reservation
where reservationid = 0701;

#공통 작업
#티켓 정보 변경 str은 자바에서 처리
Update Ticket
SET scheduleid = NULL
where reservationid = 0701; #자바에서 동적으로 처리

Update Ticket
SET reservationid = NULL 
where reservationid = 0701; #자바에서 동적으로 처리

Update Ticket
SET isticketing = FALSE
where reservationid = 0701; #자바에서 동적으로 처리

#좌석 사용여부 수정 str은 자바에서 처리
Update Seat
SET isseat = FALSE
where seatid = 0501; #자바에서 동적으로 처리

#에매정보 삭제
Delete from Reservation where reservationid = 0701; #자바에서 동적으로 처리
#공통 작업

#영화 변경
#해당 좌석, 예매 정보 기억해놨다가 영화 조회부터 화면 다시 시작하면 됨

#상영일정 변경
#현재 선택한 영화에 해당하는 상영일자, 상영관, 좌석등을 선택하여 다시 업데이트 및 예매 생성

Select *from Movie;

Select * from _Schedule
where sopendate <= "20210604";

SELECT Screen.screenid from Screen, _Schedule where Screen.screenid = _Schedule.screenid and screen ='301';

select * from seat;
