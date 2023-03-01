/*============================ALTER==================================

DDL Grubundan==> ALTER komutu tabloyu günceller.


add column ==> yeni sutun ekleyerek tabloda güncellemeler yapar

drop column ==> mevcut olan sutunu silerek tabloda güncellemeler yapar

rename column ==> sutunun ismini degistirerek tabloda güncellemeler yapar       

rename ==> tablonun ismini degistirerek tabloda güncellemeler yapar 


Syntax:
-------

alter table tablo_adi güncelleme;

=====================================================================*/

create table arabalar
(
id int,
marka varchar(20),
model varchar(20),
vites varchar(20),
fiyat int
);


insert into arabalar values(1,'Mercedes','C180','Otomatik',900000);
insert into arabalar values(2,'Toyota','Corolla','Otomatik',400000);
insert into arabalar values(3,'Honda','Civic','Otomatik',500000);
insert into arabalar values(4,'Citroen','C3','Manuel',450000);

select * from arabalar;

--SORU1: arabalar tablosuna kilometre varchar(10) seklinde yeni sutun ekleyiniz

ALTER TABLE arabalar ADD column kilometre varchar(10);

--SORU2: arabalar tablosuna  yas int seklinde yeni sutun ekleyiniz.

ALTER TABLE arabalar ADD COLUMN yas int;

--SORU3: arabalar tablosuna airbag varchar(10) seklinde yeni sutun ekleyiniz default degeri 'mevcut' olsun

ALTER TABLE arabalar ADD COLUMN airbag varchar(10) DEFAULT 'mevcut';

--SORU4: arabalar tablosundan vites sutununu siliniz

ALTER TABLE arabalar DROP COLUMN vites;

--SORU5: arabalar tablosundaki fiyat sutununun ismini bedel olarak güncelleyiniz

ALTER TABLE arabalar RENAME COLUMN fiyat to bedel ;

--SORU6: arabalar tablosunun ismini galeri olarak güncelleyiniz

ALTER TABLE arabalar RENAME to galeri;

--SORU7: galeri tablosunun ismini arabalar olarak güncelleyiniz

ALTER TABLE galeri RENAME TO arabalar;

select * from arabalar;














