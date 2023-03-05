/*================================ ORDER BY  ===================================
   ORDER BY komutu bir SORGU deyimi içerisinde belli bir SUTUN’a göre 
   SIRALAMA yapmak için kullanılır.
   
   Syntax
   -------
    ORDER BY sutun_adı              İNT==>KÜÇÜKTEN BÜYÜGE  STRİNG==>A-Z
    ORDER BY sutun_adı DESC         İNT==>BÜYÜKTEN KÜÇÜGE  STRİNG==>Z-A
==============================================================================*/   
CREATE TABLE meslekler
(
id int PRIMARY KEY,
isim VARCHAR(50), 
soyisim VARCHAR(50),
meslek CHAR(9),
maas int
);
        
INSERT INTO meslekler VALUES(1, 'Ali', 'Can', 'Doktor', '20000' );
INSERT INTO meslekler VALUES(2, 'Veli', 'Cem', 'Mühendis', '18000');
INSERT INTO meslekler VALUES(3, 'Mine', 'Bulut', 'Avukat', '17000');
INSERT INTO meslekler VALUES(4, 'Mahmut', 'Bulut', 'Ögretmen', '15000');
INSERT INTO meslekler VALUES (5, 'Mine', 'Yasa', 'Teknisyen', '13000');
INSERT INTO meslekler VALUES (6, 'Veli', 'Yilmaz', 'Hemşire', '12000');
INSERT INTO meslekler VALUES(7, 'Ali', 'Kan', 'Marangoz', '10000' );
INSERT INTO meslekler VALUES(8, 'Veli', 'Cem', 'Tekniker', '14000');

select * from meslekler;

-- SORU1: meslekler tablosunu isim'e göre kucukten buyuge sıralayarak listeleyiniz.

select * from meslekler order by isim;

select * from meslekler;

-- SORU2: meslekler tablosunu maas'i buyukten kucuge sıralayarak listeleyiniz

select * from meslekler order by maas desc;

select * from meslekler;

-- SORU3: meslekler tablosunda isim'i 'Ali' olanları,
-- 		  maas'a göre büyükten küçüge sıralayarak listeleyiniz

select * from meslekler where isim='Ali' order by maas desc;

select * from meslekler;

-- SORU4: meslekler tablosunda soyisim 'i 'Bulut' olanları,
-- 		  maas'a gore sıralayarak listeleyiniz.

select * from meslekler where soyisim='Bulut' order by maas;

