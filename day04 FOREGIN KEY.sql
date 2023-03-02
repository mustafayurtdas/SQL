/*----------------------------FOREGIN KEY---------------------------------------------------

	FOREGIN KEY --> Başka bir tablodaki PRİMARY KEY'i referans göstermek için kullanılır. 
	Böylelikle, tablolar arasında parent child ilişkisi oluşur.
	
	FOREIGN KEY'in bulundugu tablo Child tablodur.
	PRIMARY KEY'in bulundugu tablo ise Parent tablodur.

	FOREIGN KEY KISITLAMASI SAYESİNDE:
	---------------------------------
	
	1-) parent tabloda olmayan primary key ile child tabloya veri girişi yapılamaz
	(child tablo null deger kabul eder)

	2-) child tablodaki veri silinmeden parent tablodaki veri silinemez

	3-) child tablo silinmeden parent tablo silinemez
----------------------------------------------------------------------------------------------*/

create table hastaneler
(
hastane_adi varchar(30) PRIMARY KEY,
adres varchar(30),
alan_kodu int
);

insert into hastaneler values('Meddem', 'Isparta', '0246');
insert into hastaneler values('Sifa', 'Ankara', '0236');
insert into hastaneler values('Davraz', 'Istanbul', '0216');
insert into hastaneler values('Deva', 'Antalya', '0242');


create table doktorlar
(
gorev_yeri varchar(30),
doktor_adi varchar(30),
diploma_no int,
brans_adı varchar(30),
	
CONSTRAINT fk FOREIGN KEY(gorev_yeri) REFERENCES hastaneler(hastane_adi) 
	
);	
insert into doktorlar values('Meddem', 'Hasan Bal', '123456', 'psikiyatri');
insert into doktorlar values('Sifa', 'Vedat Sen', '123865', 'pediatri');
insert into doktorlar values('Davraz', 'Huseyin Oz', '123568', 'noroloji');
insert into doktorlar values('Deva', 'Ahmet Kar', '123852', 'dahiliye');
insert into doktorlar values('Meddem', 'Hakan Kar', '123369', 'dermatoloji');
insert into doktorlar values('Sifa', 'Ramiz Kara', '123147', 'anestezi');
insert into doktorlar values('Davraz', 'Okan Pul', '123147', 'ortopedi');


SELECT * FROM doktorlar;

--SORU 1: doktorlar tablosuna gorev_yeri 'Meddem' olan veri girişi yapınız

insert into doktorlar values('Meddem', 'Mustafa Yurtdaş', '175865', 'kardiyoloji');

--SORU 2: .doktorlar tablosuna gorev_yeri 'Okmeydanı' olan veri girişi yapınız.
----> Parent Tablo da olmayan Primary Key ile Child tabloya veri girişi yapılamaz

insert into doktorlar values('Okmeydanı', 'Hatice Kar', '123865', 'ortopedi');


--SORU 3: doktorlar tablosuna gorev_yeri null olan veri girişi yapınız

insert into doktorlar values(null, 'Haşim Kay', '123845', 'noroloji');

---->  Child tablo null veri kabul eder

--SORU 4: .hastaneler tablosundaki hastane_adi 'Meddem' olan veriyi siliniz.

---->  Child tablodaki veri silinmeden Parent tablodaki veri silinemez.

DELETE FROM hastaneler WHERE hastane_adi = 'Meddem';   -- Key (hastane_adi)=(Meddem) is still referenced from table "doktorlar".

--SORU 5: doktorlar tablosundaki gorev_yeri 'Meddem' olan verileri siliniz

DELETE FROM doktorlar WHERE gorev_yeri = 'Meddem'; 

---> 4. Soru şimdi yapılabilir, Parent tablaodan veri silinebilir...

DELETE FROM hastaneler WHERE hastane_adi = 'Meddem';

--SORU 7: hastaneler tablosunu siliniz.

---->  Child tablo silinmeden Parent tablo silinemez.

DROP TABLE hastaneler;

--SORU 8: doktorlar tablosunu siliniz. 

DROP TABLE doktorlar;

--SORU 9: hastaneler tablosunu siliniz.

DROP TABLE hastaneler;