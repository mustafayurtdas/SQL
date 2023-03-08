/*========================================= JOIN İSLEMLERİ ===================================================
 
  
    Join islemleri: iki tabloyu birlestirmek için kullanılır.

    3 Cesit Join islemi kullanilabilmektedir.
    
    1) INNER JOIN: Tablolardaki ortak olan verileri listeler.
    2) LEFT JOIN:  ilk tabloda olan tum verileri listeler.
    3) RIGHT JOIN: ikinci tabloda olan tum verileri listeler.

       FULL JOIN: her iki tablodaki verilerin tamamını listeler (Left Join + Union + Right Join)

 	Syntax
    -----------
    SELECT sutun1,sutun2... FROM tablo1_adi    
           
    ....JOIN tablo2_adi 
        
    ON tablo1_adi.ortak_sutun = tablo2_adi.ortak_sutun;

===================================================================================================================*/




create table qa_dersler
(
ders_id int,
ders_ismi varchar(30),
ders_saati varchar(30)
);

insert into qa_dersler values (101, 'Core Java', 40);
insert into qa_dersler values (102, 'Selenium', 30);
insert into qa_dersler values (103, 'API', 15);
insert into qa_dersler values (104, 'SQL', 10);
insert into qa_dersler values (105, 'SDLC', 10);
insert into qa_dersler values (106, 'LAMDA', 12);




create table developer_dersler
(
ders_id int,
ders_ismi varchar(30),
ders_saati varchar(30)
);

insert into developer_dersler values (101, 'Core Java', 40);
insert into developer_dersler values (103, 'API', 15);
insert into developer_dersler values (104, 'SQL', 10);
insert into developer_dersler values (105, 'SDLC', 10);
insert into developer_dersler values (106, 'LAMDA', 12);
insert into developer_dersler values (107, 'Spring Framework', 20);
insert into developer_dersler values (108, 'Micro Services', 12);


--SORU1: join kullanarak qa_dersler'ini listeleyeniz


SELECT A.ders_id, A.ders_ismi, A.ders_saati FROM qa_dersler as A
lEFT JOIN developer_dersler as B
ON A.ders_id = B.ders_id;

-- 2.YOL

SELECT A.ders_id, A.ders_ismi, A.ders_saati FROM developer_dersler as B
RIGHT JOIN qa_dersler AS A 
ON A.ders_id = B.ders_id;


--SORU1: join kullanarak developer_dersler'ini listeleyiniz


SELECT A.ders_id, A.ders_ismi, A.ders_saati FROM developer_dersler  AS A
lEFT JOIN qa_dersler AS B
ON A.ders_id = B.ders_id;

-- 2.YOL

SELECT B.ders_id, B.ders_ismi, B.ders_saati FROM qa_dersler AS A
RIGHT JOIN developer_dersler AS B 
ON A.ders_id = B.ders_id;

--SORU2: join kullanarak ortak dersleri listeleyiniz 

SELECT A.ders_id, A.ders_ismi, A.ders_saati FROM qa_dersler AS A
INNER JOIN developer_dersler AS B
ON A.ders_id = B.ders_id;


--SORU3: join kullanarak qa_dersleri ve developer_dersleri tablosundaki verilerin tamamını listeleyiniz.

SELECT A.ders_id, A.ders_ismi, A.ders_saati FROM qa_dersler as A
lEFT JOIN developer_dersler as B
ON A.ders_id = B.ders_id

UNION

SELECT B.ders_id, B.ders_ismi, B.ders_saati FROM qa_dersler AS A
RIGHT JOIN developer_dersler AS B 
ON A.ders_id = B.ders_id;



create table filmler
(film_id int,
film_name varchar(30),
category varchar(30)
);

insert into filmler values (100, 'Eyvah Eyvah', 'Komedi');
insert into filmler values (200, 'Kurtlar Vadisi', 'Aksiyon');
insert into filmler values (300, 'Eltilerin Savasi', 'Komedi');
insert into filmler values (400, 'Aile Arasinda', 'Komedi');
insert into filmler values (500, 'GORA', 'Bilim Kurgu');
insert into filmler values (600, 'Organize Isler', 'Komedi');
insert into filmler values (700, 'Babam ve Oglum', 'Dram');


create table aktorler
(id int,
actor_name varchar(30),
film_id int
);

insert into aktorler values (1, 'Ata Demirer', 100);
insert into aktorler values (2, 'Necati Sasmaz', 200);
insert into aktorler values (3, 'Gupse Ozay', 300);
insert into aktorler values (4, 'Engin Gunaydin', 400);
insert into aktorler values (5, 'Cem Yilmaz', 500);


select * from filmler;


-- SORU1: Tüm film_name'leri, tüm category'lerini ve filmlerde oynayan actor_name'leri listeleyiniz.


select film_name, category, actor_name from filmler as A
left join aktorler as B
on A.film_id=B.film_id

--2.YOL
select film_name, category, actor_name from aktorler as B
right join filmler as A
on A.film_id=B.film_id



-- SORU2: Tüm actor_name'leri ve film_name'lerini listeleyiniz.


select actor_name,film_name from aktorler as A
left join filmler as B
on A.film_id=B.film_id

--2.YOL
select actor_name,film_name from filmler as B
right join aktorler as A
on A.film_id=B.film_id




