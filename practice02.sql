/*
student_info adında bir table oluşturunuz.
student_id(PRIMARY KEY), student_name(UNIQUE), student_age(NOT NULL) ve student_dob adında sütunlar oluşturunuz.
Sütunlara uygun data tipleri ve belirtilen constraint'leri atayınız.
student_age sütunu 0-20 arası dışında değer alamaz.
student_name sütunu küçük harf karakter alamaz.
*/

CREATE TABLE student_info(

	student_id SMALLINT PRIMARY KEY,
	student_name VARCHAR(50) UNIQUE,
	student_age SMALLINT NOT NULL,
	student_dob DATE,
	
	CONSTRAINT student_age_check CHECK(student_age BETWEEN 0 AND 20),
	CONSTRAINT student_name_upper CHECK(student_name= UPPER(student_name) )

)

--Tüm sütunlara veri girerek 2 record oluşturunuz.:

INSERT INTO student_info VALUES('101','ALI CAN',15, '12.06.2007');
INSERT INTO student_info VALUES(102,'VELI HAN',19, '5.Aug.04');
INSERT INTO student_info VALUES(103,'AYSE TAN',16, 'Sep.3.06');

INSERT INTO student_info VALUES(104, 'KEMAL KUZU', 15, null);
INSERT INTO student_info VALUES('105', 'TOM HANKS', 20, '12-Sep-2003');
INSERT INTO student_info VALUES('106', 'ANGELINA JULIE', 10, '12-Sep-2013');
INSERT INTO student_info VALUES('107', 'BRAD PITT', 0, '10-Aug-2021');

--Spesifik iki sütuna veri giriniz:
INSERT INTO student_info (student_id,student_age) VALUES(108,17);
INSERT INTO student_info (student_id,student_age,student_name) VALUES(109,5,'JOHN WALKER');

--student_id değeri 108 olan satırın student_name değerini 'LEO OCEAN' olarak güncelleyin.

UPDATE student_info SET student_name = 	'LEO OCEAN' WHERE student_id = 108;

--John Walker, student_dob sütununu to 11-Dec-1997 değerine değiştirin

UPDATE student_info SET student_dob = '11-Dec-1997' WHERE student_name = 'JOHN WALKER';

--105 id'li dob hücresini 11-Apr-1996 değerine ve name hücresini  MARK TWAIN değerine güncelle.

UPDATE student_info SET student_dob = '11-Apr-1996',student_name = 'MARK TWAIN'  WHERE student_id = 105;

--id'si 106'dan küçük tüm dob değerlerini 01-Aug-2021'e güncelle.

UPDATE student_info SET student_dob = '01-Aug-2021' WHERE student_id < 106;



SELECT * FROM student_info;
