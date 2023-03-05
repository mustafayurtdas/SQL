/*============================SUBQUERY==============================
 SUBQUERY:  Sorgu içinde çalışan sorguya denir.
==========================================================================*/
CREATE TABLE malzemeler    
(
ted_vergino int, 
malzeme_id int, 
malzeme_isim VARCHAR(20), 
musteri_isim VARCHAR(25)
);    
    
INSERT INTO malzemeler VALUES(201, 1001,'Laptop', 'Aslı Can');
INSERT INTO malzemeler VALUES(202, 1002,'Telefon', 'Fatih Ak');
INSERT INTO malzemeler VALUES(202, 1003,'TV', 'Ramiz Özmen');
INSERT INTO malzemeler VALUES(202, 1004,'Laptop', 'Veli Tan');
INSERT INTO malzemeler VALUES(203, 1005,'Telefon', 'Cemile Al');
INSERT INTO malzemeler VALUES(204, 1006,'TV', 'Ali Can');
INSERT INTO malzemeler VALUES(204, 1007,'Telefon', 'Ahmet Yaman');
    
CREATE TABLE toptancilar    
(
vergi_no int,
sirket_ismi VARCHAR(40),
irtibat_ismi VARCHAR(30)
);
    
INSERT INTO toptancilar VALUES (201, 'IBM', 'Kadir Şen');
INSERT INTO toptancilar VALUES (202, 'Huawei', 'Çetin Hoş');
INSERT INTO toptancilar VALUES (203, 'Erikson', 'Mehmet Gör');
INSERT INTO toptancilar VALUES (204, 'Apple', 'Adem Coş');

select * from malzemeler;

-- SORU1: Malzemeler tablosundaki musteri_isim'i 'Ali Can' olanın malzeme_isim'ini,
--	      toptancilar  tablosunda irtibat_ismi 'Adem Coş' olan sirket_ismi ile güncelleyiniz.

update malzemeler set malzeme_isim=('Apple') where musteri_isim='Ali Can';

-- cevabı daha dinamik hale getirelim
update malzemeler 
set malzeme_isim=(select sirket_ismi from toptancilar where irtibat_ismi='Adem Coş')
where musteri_isim='Ali Can';

-- () ==> select sirket_ismi from toptancilar where irtibat_ismi='Adem Coş'

 -- SORU2: Malzemeler tablosundaki malzeme_isim'i 'Laptop' olan musteri_isim'lerini,
 -- toptancilar  tablosunda sirket_ismi 'Apple' in irtibat_ismi ile güncelleyiniz.

update malzemeler set musteri_isim=(select irtibat_ismi from toptancilar where sirket_ismi='Apple')
where malzeme_isim='Laptop';

-- cevabı daha dinamik hale getirelim
() ==> select irtibat_ismi from toptancilar where sirket_ismi='Apple'
