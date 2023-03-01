/*========================CONSTRANINT -- KISITLAMALAR=======================================================

1) UNIQUE -->  Bir sütundaki verilerin BENZERSİZ olmasıdır.(2 veya daha fazla null deger kabul eder)

2) NOT NULL --> Bir sütunun NULL içermemesini sağlar
   (NOT NULL kısıtlaması veri türünden hemen sonra yazılır. CONSTRAINT ismi tanımlanmaz.)   

3) PRIMARY KEY --> UNIQUE(BENZERSİZ) - NOT NULL 
   Bir tabloda en fazla bir adet Primary Key olur. 
   iki sutunun birlesiminden bir Primary Key oluşturulmasına ise Composite Primary Key denir.

4) CHECK --> Bir sütunun değer aralığını sınırlamak için kullanılır.

5) FOREIGN KEY --> Başka bir tablodaki PRİMARY KEY'i referans göstermek için kullanılır.
   Böylelikle, tablolar arasında Parent- Child ilişkisi oluşur.
============================================================================================================*/

/*
SORU1: memurlar isminde bir tablo oluşturunuz. 
id, isim, maas, mezuniyet sutunları olsun.
id sutununun data tipi int olsun. PRİMARY KEY kısıtlaması olsun.
isim sutununun data tipi varchar(30) olsun. UNIQUE kısıtlaması olsun.
maas sutununun data tipi int olsun. maas 5000 buyuk olsun.
mezuniyet sutununun data tipi varchar(25) olsun. NOT NULL kısıtlaması olsun.    
*/

CREATE TABLE memurlar (
	id int PRIMARY KEY,						-- UNIQUE + NOT NULL
	isim varchar(30) UNIQUE,				-- UNIQUE
	maas int CHECK (maas>5000),				-- SART KONTROLU
	mezuniyet varchar(25) NOT NULL			-- NOT NULL
);

INSERT INTO memurlar VALUES(1,'Ali',10000,'Lisans');
INSERT INTO memurlar VALUES(2,'Ahmet',15000,'Yüksek Lisans');
INSERT INTO memurlar VALUES(3,'Altuğ',20000,'Lisans');
INSERT INTO memurlar VALUES(4,'Elif',18000,'Lisans');


insert into memurlar values(1,'Zulal',20000,'Lise');          	--	PRIMARY KEY SEBEBİYLE ERROR VERİR
insert into memurlar values(5,'Altug',25000,'Yüksek Lisans'); 	--	UNIQUE SEBEBİYLE ERROR VERİR
insert into memurlar values(6,'Hayri',4000,'Lise'); 			--	CHECK SEBEBİYLE ERROR VERİR
insert into memurlar values(7,'Burak',20000); 					--	NOT NULL SEBEBİYLE ERROR VERİR


SELECT * FROM memurlar;


