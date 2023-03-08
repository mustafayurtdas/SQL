/*=====================================EXISTS============================================================

 

Subquery'lerde kullanılır. Mevcut ise getir anlamında kullanılır.

EXISTS veya NOT EXISTS ifadeleri de alt sorgudan getirilen degerlerin içerisinde bir degerin
olması veya olmaması durumunda işlem yapılmasını saglar

========================================================================================================*/

CREATE TABLE mart
(   
urun_id int,    
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');


CREATE TABLE nisan 
(   
urun_id int ,
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');

/*
--MART ve NİSAN aylarında aynı urun_id ile satılan ürünlerin urun_id'lerini
  ve aynı zamanda bu ürünleri MART ayında alan musteri_isim 'lerini listeleyen bir sorgu yazınız. 
*/
SELECT urun_id,musteri_isim FROM mart 
WHERE EXISTS (SELECT urun_id FROM nisan WHERE mart.urun_id = nisan.urun_id);


/*
--MART ve NİSAN aylarında aynı urun_isim'i ile satılan ürünlerin urun_isim'lerini                  
ve aynı zamanda bu ürünleri NİSAN ayında alan musteri_isim'lerini listeleyen bir sorgu yazınız.
*/

SELECT urun_isim, musteri_isim FROM nisan 
WHERE EXISTS (SELECT urun_isim FROM mart WHERE mart.urun_isim = nisan.urun_isim);

/*ÖDEV:

--MART ve NİSAN aylarında aynı urun_id ile satılmayan ürünlerin urun_id'lerini
  ve aynı zamanda bu ürünleri MART ayında alan musteri_isim 'lerini listeleyen bir sorgu yazınız. 
*/


select * from nisan;

select * from mart;




