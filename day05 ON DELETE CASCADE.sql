/*--------------------ON DELETE CASCADE---------------------------------------------
ON DELETE CASCADE komutu sayesinde;
 
Direk parent tablodaki veriyi silebiliyoruz
Ayrıca,
Direk parent tabloyu silebiliyoruz
Bunun için FK olan satırın en sonuna ON DELETE CASCADE komutu yazmamız yeterli
-------------------------------------------------------------------------------------*/
CREATE TABLE parent 
(
vergi_no int PRIMARY KEY,
firma_ismi VARCHAR(50),
irtibat_ismi VARCHAR(50)
);
    
INSERT INTO parent VALUES (101, 'Sony', 'Kim Lee');
INSERT INTO parent VALUES (102, 'Asus', 'George Clooney');
INSERT INTO parent VALUES (103, 'Monster', 'Johnny Deep');
INSERT INTO parent VALUES (104, 'Apple', 'Mick Jackson');
CREATE TABLE child
(
ted_vergino int, 
urun_id int, 
urun_isim VARCHAR(50), 
musteri_isim VARCHAR(50),
CONSTRAINT fk FOREIGN KEY(ted_vergino) REFERENCES parent(vergi_no)
ON DELETE CASCADE
);    
    
INSERT INTO child VALUES(101, 1001,'PC', 'Habip Sanli');
INSERT INTO child VALUES(102, 1002,'Kamera', 'Zehra Oz');
INSERT INTO child VALUES(102, 1003,'Saat', 'Mesut Kaya');
INSERT INTO child VALUES(102, 1004,'PC', 'Vehbi Koc');
INSERT INTO child VALUES(103, 1005,'Kamera', 'Cemal Sala');
INSERT INTO child VALUES(104, 1006,'Saat', 'Behlül Dana');
INSERT INTO child VALUES(104, 1007,'Kamera', 'Eymen Ozden');
select * from parent;
select * from child;
--SORU1: parent tablosundaki tum verileri siliniz   
delete from parent;
--> ON DELETE CASCADE sayesinde
-- Child tablodaki veri silinmeden Parent tablodaki veri silinmeye calisildiginda PgAdmin error vermez.
-- Parent tablodaki veriyi siler.
-- Fakat bu durumda Child tablodaki veri de silinir.
select * from parent;
select * from child;
--SORU2: parent tablosunu siliniz..
drop table parent cascade;
--SORU3: child tablosunu siliniz
drop table child;
/*
FOREIGN KEY'LERDE ON DELETE CASCADE KOMUTU YAZILMAZSA
1-) Child tablo silinmeden Parent tablo silinmeye çalışıldıgında PgAdmin Error verir.
yani Child tablo silinmeden Parent tablo silinemez
2-) Child tablodaki veri silinmeden Parent tablodaki veri silinmeye çalışıldıgında Pg Admin Error verir.
yani Child tablodaki veri silinmeden Parent tablodaki veri silinemez
FOREIGN KEY'LERDE ON DELETE CASCADE KOMUTU YAZILIRSA
1-) Child tablo silinmeden Parent tablo silinebilir.
PgAdmin Error vermez
2-) Child tablodaki veri silinmeden Parent tablodaki veri silinmeye çalışıldıgında PgAdmin Error vermez
Parent tablodaki veriyi siler.
Fakat bu durumda Child tablodaki veride silinir.
*/
