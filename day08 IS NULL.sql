/*
IS NULL - IS NOT NULL
---------------------
IS NULL: null olan verileri getirir
IS NOT NULL: null olmayan verileri getirir
*/

create table deneme
(
id char(9),
isim varchar(50),
adres varchar(50)
);

insert into deneme values(123456789,'Ali','Istanbul');
insert into deneme values(456987123,'Veli','Ankara');
insert into deneme values(789456258,'Mine','Izmir');
insert into deneme values(963258741,null,'Ankara');

select * from deneme;

--SORU1: isim sutununda null olan veriyi listeleyiniz

select * from deneme where isim is null;

-- SORU2: isim sutunuda null olmayan verileri listeleyiniz

select * from deneme where isim is not null;

