/* Drop tables */

DROP TABLE report;
DROP TABLE reservation;
DROP TABLE control_book;
DROP TABLE librarian;
DROP TABLE book;
DROP TABLE manager;
DROP TABLE member;



/* create Tables */
/* book */

CREATE TABLE book (
  b_id number(8) NOT NULL , 
  b_name varchar2(256), 
  author varchar2(256), 
  category varchar2(256), 
  price number(8),
  PRIMARY KEY (b_id)
  );
  
  /* librarian */
  CREATE TABLE librarian (
  l_id number(11) NOT NULL,
  l_pwd varchar2(256),
  l_name varchar2(256) ,
  l_email varchar2(256) ,
  PRIMARY KEY (l_id)
  );
  
    /* manager */
    CREATE TABLE manager (
  man_id number(10) NOT NULL ,
  man_pwd varchar2(256) ,
  man_name varchar2(256) ,
  man_email varchar2(256),
  PRIMARY KEY (man_id)
  );
  
    /* member */
    CREATE TABLE member (
  m_id number(10) NOT NULL,
  m_pwd varchar2(255),
  m_name varchar2(255),
  m_surname varchar2(255) ,
  m_email varchar2(255),
PRIMARY KEY (m_id)  
 );
  
    /* report */
  CREATE TABLE report (
  r_num number(10) NOT NULL,
  b_no number(10),
  PRIMARY KEY (r_num),
  CONSTRAINT bno FOREIGN KEY (b_no)REFERENCES book (b_id)
  );
  
    /* reservation */
  CREATE TABLE reservation (
  res_num number(10) NOT NULL,  
  m_no number(10),
  b_no number(10) ,
  rdate date,
  PRIMARY KEY (res_num),
   CONSTRAINT res2 FOREIGN KEY (m_no) REFERENCES member (m_id),
   CONSTRAINT res1 FOREIGN KEY(b_no)REFERENCES book (b_id)

  );
  
  /* control_book*/
  create table control_book(
  
    b_nb number (10) NOT NULL,
  old_title varchar2 (30),
  new_title varchar2(30),
  modified_date date,
  PRIMARY KEY (b_nb),
    CONSTRAINT con FOREIGN KEY (b_nb) REFERENCES book (b_id)
  );
insert into book (b_id, b_name, author, category, price)
values(1,'Flow','Mihaly Csikszentmihalyi','Self-help',25);
insert into book (b_id, b_name, author, category, price)
values(2,'Shoe Dog','Phil Knight','memoir',30);
insert into book (b_id, b_name, author, category, price)
values(3,'How to Win Friends and Influence People','Dale Carnegie','Self-help','25');
insert into book (b_id, b_name, author, category, price)
values(4,'Think and Grow Rich','Napoleon Hill','Self-help',30);
insert into book (b_id, b_name, author, category, price)
values(5,'10% Happier','Dan Harris','Self-help',30);
insert into book (b_id, b_name, author, category, price)
values(6,'The Godfather','Mario Puzo','Crime Novel',35);
insert into book (b_id, b_name, author, category, price)
values(7,'Game of Thrones','George R. R. Martin','Fantasy',35);
insert into book (b_id, b_name, author, category, price)
values(8,'Digital Minimalism','Cal Newport','self-help',50);
insert into book (b_id, b_name, author, category, price)
values(9,'Building a Story Brand','Donald Miller','Marketing',40);

insert into librarian (l_id,l_pwd,l_name,l_email)
values(129,'Youlanda','rolboul','youlanda@aol.com');
insert into librarian (l_id,l_pwd,l_name,l_email)
values(745,'Dyan','8159520','doldroyd@aol.com');

insert into manager (man_id,man_pwd,man_name,man_email)
values(1234,'rock4261302','Erick','erick.ferencz@aol.com');
insert into manager (man_id,man_pwd,man_name,man_email)
values(1235,'sitges','Fatima','fsaylors@saylors.org');
insert into manager (man_id,man_pwd,man_name,man_email)
values(1236,'clojoli','Jina','jina_briddick@briddick.com');

Insert into member (m_id, m_pwd, m_name, m_surname, m_email) 
Values(5656, 'James', 'Butt', '7606374520', 'jbutt@gmail.com');
Insert into member (m_id, m_pwd, m_name, m_surname, m_email) 
Values(1556, 'Josephine', 'Darakjy', 'piontekendre', 'josephine_darakjy@darakjy.org');
Insert into member (m_id, m_pwd, m_name, m_surname, m_email)
Values(5445, 'Art', 'Venere', 'rambo144', 'art@venere.org');
Insert into member (m_id, m_pwd, m_name, m_surname, m_email) 
Values(5742, 'Lenna', 'Paprocki', 'primoz123', 'lpaprocki@hotmail.com');
Insert into member (m_id, m_pwd, m_name, m_surname, m_email) 
Values(7866, 'Donette', 'Foller', 'sal1387', 'donette.foller@cox.net');
Insert into member (m_id, m_pwd, m_name, m_surname, m_email) 
Values(6624, 'Simona', 'Morasca', 'EVASLRDG', 'simona@morasca.com');
Insert into member (m_id, m_pwd, m_name, m_surname, m_email) 
Values(6625, 'Mitsue', 'Tollner', 'Detroit84', 'mitsue_tollner@yahoo.com');
Insert into member (m_id, m_pwd, m_name, m_surname, m_email) 
Values(6626, 'Leota', 'Dilliard', 'dlbd090505', 'leota@hotmail.com');


insert into report(r_num,b_no)
values(789,1);
insert into report(r_num,b_no)
values(2,2);
insert into report(r_num,b_no)
values(745,3);
insert into report(r_num,b_no)
values(41,3);
insert into report(r_num,b_no)
values(7,3);

insert into reservation(res_num ,m_no,b_no,rdate)
values(85,5656,1,'10/02/2019');
insert into reservation(res_num,m_no,b_no,rdate)
values(95,1556,2,'13/02/2019');
insert into reservation(res_num,m_no,b_no,rdate)
values(74,5445,3,'15/02/2019');
insert into reservation(res_num,m_no,b_no,rdate)
values(59,5656,4,'16/02/2019');
insert into reservation(res_num,m_no,b_no,rdate)
values(26,5656,6,'20/02/2019');
insert into reservation(res_num,m_no,b_no,rdate)
values(36,5656,7,'01/03/2019');
insert into reservation(res_num,m_no,b_no,rdate)
values(654,5656,7,'15/01/2020');


COMMIT;  
  


 
  