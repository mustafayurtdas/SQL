/*==========================UPDATE===========================


DML Grubundan ==> UPDATE komutu Tablodaki Verileri Günceller


Syntax:
------

update tablo_adi set sutun_adi=yeni_deger where şart;


==============================================================*/

create table film
(
film_no int,
film_ismi varchar(30),
film_turu varchar(30)
);

insert into film values (100, 'Eyvah Eyvah', 'Komedi');
insert into film values (200, 'Kurtlar Vadisi', 'Aksiyon');
insert into film values (300, 'Eltilerin Savasi', 'Komedi');
insert into film values (400, 'Aile Arasinda', 'Komedi');
insert into film values (500, 'GORA', 'Bilim Kurgu');
insert into film values (600, 'Organize Isler', 'Komedi');
insert into film values (700, 'Babam ve Oglum', 'Dram');

select * from film;

-- SORU1: film_no'su 300 olan film'in 
--film_ismi'ni 'Recep İvedik' olarak güncelleyeniz.

UPDATE film SET film_ismi = 'Recep İvedik' WHERE film_no = 300;

--  SORU2: film tablosundaki tüm film_turu'nu 'Aksiyon' olarak güncelleyeniz.

UPDATE film SET film_turu= 'Aksiyon';

-- SORU3: film_no'su 100 olan film'in 
--film_ismi'ni 'Cakallarla Dans' , film_turu'nu 'Komedi' olarak güncelleyiniz.

UPDATE film SET film_ismi= 'Cakallarla Dans', film_turu = 'Komedi' WHERE film_no= 100;

-- SORU4: film_ismi 'Babam ve Oglum' olan film'in
--film_turu'nu 'Dram' olarak güncelleyiniz.

UPDATE film SET film_turu = 'Dram' WHERE film_ismi= 'Babam ve Oglum';

-- SORU5: film tablosundaki 'GORA' olan değeri,
-- 'AROG' olarak güncelleyiniz.

UPDATE film SET film_ismi = 'AROG' WHERE  film_ismi = 'GORA';

-- SORU6: film tablosundaki film_no değeri 300'den büyük olanların,
 --film_no'sunu 1 artırarak güncelleyiniz.

UPDATE film SET film_no = film_no + 1  WHERE  film_no > 300;

select * from film;

