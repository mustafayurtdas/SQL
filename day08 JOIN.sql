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


select A.ders_id, A.ders_ismi, A.ders_saati from qa_dersler as A
left join developer_dersler as B
on A.ders_id=B.ders_id;

-- 2.YOL

select A.ders_id, A.ders_ismi, A.ders_saati from developer_dersler as B
right join qa_dersler as A 
on A.ders_id=B.ders_id;


--SORU2: join kullanarak developer_dersler'ini listeleyiniz

















