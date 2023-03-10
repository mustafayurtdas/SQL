/* ===========  UPPER- LOWER- INITCAP-DISTINCT =========
        ------------------------------
UPPER ==> Sütunudaki verileri Büyük Harf ile listeler.
Syntax:
-------
select UPPER(Sutun_adi) from tablo_adi;

LOWER ==> Sütunudaki verileri Küçük Harf ile listeler.
Syntax:
-------
select LOWER(Sutun_adi) from tablo_adi;

INITCAP ==> Sütunudaki verileri ilk Harfi Büyük Diger Harfleri Küçük listeler.
Syntax:
-------
select INITCAP(Sutun_adi) from tablo_adi;

DISTINCT ==> Sütunudaki verileri tekrarsız listeler.
Syntax:
-------
select DISTINCT(Sutun_adi) from tablo_adi;
*/

create table ornek
(
isim varchar(25),
soyisim varchar(25)
);

insert into ornek values('Hasan','YAN');
insert into ornek values('Veli','TURK');
insert into ornek values('Ramiz','KARA');
insert into ornek values('Elif','GUL');
insert into ornek values('Hasan','VURAL');

select * from ornek;

-- SORU1: isim sutununu buyuk harflerle listeleyiniz

select upper(isim) from ornek;

-- SORU2:  isim sutununu kucuk harflerle listeleyiniz

select lower(isim) from ornek;

-- SORU3: soyisim sutununu ilk harfi buyuk diger harfleri kucuk listeleyiniz

select initcap(soyisim) from ornek;

-- SORU4: isim sutununu buyuk harflerle, soyisim sutununu kucuk harflerle listeleyiniz

select upper(isim), lower(soyisim) from ornek;

-- SORU5: isim sutununu tekrarsız listeleyiniz

select distinct(isim) from ornek;

select * from ornek;

