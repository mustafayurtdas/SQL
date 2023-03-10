/*=========================================  LIKE  ================================================
LIKE ==> Gibi anlamına gelir. 
Örnek:
-----
'A' ile baslayan verileri listele
'n' ile biten verileri listele
ikinci harfi 'e' olan verileri listele  
örneklerindeki işlemler için LIKE komutu kullanılır.
LIKE, sorgulama yaparken belirli pattern'leri kullanmamıza olanak verir. 
Pattern:
-------
% ==> Sıfır veya daha fazla karakteri belirtir.
_ ==> Tek bir karakteri belirtir.
Syntax:
------
SELECT * FROM tablo_adi
WHERE sutun_adi like PATTERN
====================================================================================================*/
CREATE TABLE musteriler 
(
id int UNIQUE,
isim varchar(50) NOT NULL,
maas int
);
INSERT INTO musteriler (id, isim, maas) VALUES (1001, 'Ali', 100000);  
INSERT INTO musteriler (id, isim, maas) VALUES (1002, 'Ayse', 57500);  
INSERT INTO musteriler (id, isim, maas) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler (id, isim, maas) VALUES (1004, 'Fatma', 42000);  
INSERT INTO musteriler (id, isim, maas) VALUES (1005, 'Kasim', 44000);
INSERT INTO musteriler (id, isim, maas) VALUES (1006, 'ahmet', 82000);
select * from musteriler;

--SORU1: isim'i 'A' harfi ile baslayan musterilerin tum bilgilerini listeleyiniz
select * from musteriler where isim like 'A%';

--SORU2: isim'i 'a' harfi ile baslayan musterilerin tum bilgilerini listeleyiniz
select * from musteriler where isim like 'a%';

/*============================ ILIKE ===============================*/

--SORU3: isim'i buyuk harf kucuk harf gözetmeksizin 'A' ile baslayan tum bilgileri listeleyiniz
select * from musteriler where isim ilike 'A%';

-- NOT: buyuk harf kucuk harf gozetmeksizin listelemek istersek ilike kullanırız



--SORU4: isim'i 'e' harfi ile biten tum bilgileri listeleyiniz
select * from musteriler where isim like '%e';

--SORU5: isim'i icerisinde 'er' olan tum bilgileri listeleyiniz.
select * from musteriler where isim ilike '%er%';

--SORU6: isim'i 5 harfli olup son 4 harfi 'atma' olan tum bilgileri listeleyiniz.
select * from musteriler where isim like '_atma';

--SORU7: isim'in 2. harfi 'a' olan tum bilgileri listeleyiniz.
select * from musteriler where isim like '_a%';

--SORU8: isim'in 3. harfi 's' olan tum bilgileri listeleyiniz.
select * from musteriler where isim like '__s%';

--SORU9: isim'in 3. harfi 's' olup 4 harfli tum bilgileri listeleyiniz.
select * from musteriler where isim like '__s_';

--SORU10: isim'in ilk harfi 'F' olup en az 4 harfli tum bilgileri listeleyiniz.
select * from musteriler where isim like 'F___%';

--SORU11: isim'in ikinci harfi 'a' olup, 4.harfi 'm' olan en az 4 harfli tum bilgilerini listeleyiniz.
select * from musteriler where isim like '_a_m%';

/*============================ NOT LIKE ===============================*/
--SORU12: isim'i icerisinde 'i' olmayan tum bilgileri listeleyiniz.
select * from musteriler where isim not like '%i%';

