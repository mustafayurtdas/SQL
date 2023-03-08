--INTERSECT: iki sorgu ifadesinin kesisim degerini verir.
--EXCEPT:ILK SORGUDA OLUP IKINCI SORGUDA OLMAYAN DEGERLERI BIZE VERIR

CREATE TABLE isciler 
(
	isim VARCHAR(20), 
	sehir VARCHAR(20), 
	maas int, 
	sirket VARCHAR(20)
);
   
INSERT INTO isciler VALUES('Ahmet Yorgun', 'Istanbul', 6500, 'Honda');
INSERT INTO isciler VALUES('Vural Solgun', 'Istanbul', 5500, 'Toyota');
INSERT INTO isciler VALUES('Murat Oz', 'Ankara', 4500, 'Honda'); 
INSERT INTO isciler VALUES('Murat Oz', 'Istanbul', 4500, 'Honda'); 
INSERT INTO isciler VALUES('Murat Oz', 'Izmir', 7000, 'Ford');
INSERT INTO isciler VALUES('Vural Solgun', 'Ankara', 5500, 'Ford');
INSERT INTO isciler VALUES('Harun Sarsılmaz','Bursa', 5200, 'Honda');

/* -----------------------------------------------------------------------------
 -- SORU1: isim'i 'Murat Oz' olanlarin isim'lerini, sehir'lerini ve
 -- sehir'i 'Istanbul' olmayanların isim'lerini sehir'lerini bulup  
    iki sorgunun kesisimini listeleyiniz 
------------------------------------------------------------------------------*/

SELECT isim, sehir FROM isciler WHERE isim ='Murat Oz'
intersect
SELECT isim, sehir FROM isciler WHERE sehir!='Istanbul';


/* -----------------------------------------------------------------------------
 -- SORU2: isim'i 'Murat Oz' olanlarin isim'lerini, sehir'lerini ve
 -- sehir'i 'Istanbul' olmayanların isim'lerini sehir'lerini bulup  
    ilk sorguda olup ikinci sorguda olmayan degerleri listeleyiniz 
------------------------------------------------------------------------------*/

SELECT isim, sehir FROM isciler WHERE isim ='Murat Oz'
except
SELECT isim, sehir FROM isciler WHERE sehir!='Istanbul';










