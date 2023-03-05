--============================= LİMİT =================================
-- sınır koymak icin kullanılır
--=====================================================================

create table musteriler
(
id int,
musteri_isim varchar(50),
maas int
);

insert into musteriler values(1,'Ayse',10000);
insert into musteriler values(2,'Adem',15000);
insert into musteriler values(3,'Halit',20000);
insert into musteriler values(4,'Hasan',25000);
insert into musteriler values(5,'Recep',30000);
insert into musteriler values(6,'Harun',35000);
insert into musteriler values(7,'Hatice',40000);
insert into musteriler values(8,'Poyraz',50000);
insert into musteriler values(9,'Ayse',60000);
insert into musteriler values(10,'Adem',70000);


--SORU1: musteriler tablosundaki ilk 5 kisinin bilgilerini listeleyiniz.

select * from musteriler limit 5;

-- SORU2: musteriler tablosunda id degeri 2 den büyük olan,
-- 		  ilk 3 veriyi listeleyiniz

select * from musteriler where id>2 limit 3;

-- SORU3: musteriler tablosunda maas'i 20000'den büyük olan,
-- 		  ilk 3 veriyi listeleyiniz

select * from musteriler where maas>20000 limit 3;

-- SORU4: musteriler tablosunda maası en yüksek 3 kişinin bilgilerini listeleyiniz

select * from musteriler order by maas desc limit 3;

--SORU5: musteriler tablosunda maası en yüksek ilk 2 veriden sonra 5 veriyi listeleyin 

select * from musteriler order by maas desc offset 2 limit 5;

-- SORU6: musteriler tablosunda en yüksek maaşı alan 3. 4. 5. 6. kişilerin bilgilerini listeleyiniz

select * from musteriler order by maas desc offset 2 limit 4;
