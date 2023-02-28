-- students isimli bir table oluşturunuz

CREATE TABLE students
(
	id SMALLINT,
	isim VARCHAR(50),
	adres VARCHAR(80),
	sinav_notu SMALLINT
);

SELECT * FROM students;

-- INSERT : Veri tabanına yeni veri ekler

INSERT INTO students VALUES(120,'Ali Can','Ankara',65);
INSERT INTO students VALUES(121,'Veli Han','Trabzon',75);
--Integer sütunlara tek tırnak içine yada yalın değer girilebilir.
INSERT INTO students VALUES('122','Ayşe','Bursa','85');
INSERT INTO students VALUES(123,'Mary Star','Istanbul',95);
INSERT INTO students VALUES(124,'Terry Star','Ankara',95);
INSERT INTO students VALUES(125,'Herry Otar','Hatay',95);
INSERT INTO students VALUES(126,'Sally Young','Isparta',100);


-- Soru 1: students tablosundaki id ve isim sütunlarını çağırınız.
SELECT id, isim FROM students;

-- Soru 2: students tablosundan notu 85 üzeri olan öğrenci bilgilerini çağırınız.
SELECT * FROM students WHERE sinav_notu>85;

-- Soru 3: students tablosundan adresi Ankara olan öğrencilerin isimleri çağırınız.
SELECT isim FROM students WHERE adres = 'Ankara';

-- Soru 4: students tablosundan adresi Ankara ve notu 85 üzeri olan öğrencilerin isimleri çağırınız.
SELECT isim FROM students WHERE sinav_notu>85 AND adres = 'Ankara';

-- Soru 5: students tablosundan notu 95 veya 65 olan öğrencilerin tüm bilgilerini çağırınız.
--1. YOL:
SELECT * FROM students WHERE sinav_notu=65 OR sinav_notu=95;
--2. YOL:
SELECT * FROM students WHERE sinav_notu IN (65,95);

-- Soru 6: students tablosundan notu 75 ve 95 arasında olan öğrencilerin isimlerini çağırınız.
--1. YOL:
SELECT isim FROM students WHERE sinav_notu>=75 AND sinav_notu<=95;
--2. YOL:
SELECT isim FROM students WHERE sinav_notu BETWEEN 75 AND 95;

-- Soru 7: students tablosundan id si 122 ve 125 arasında olmayan öğrencilerin adreslerini çağırınız.
--1. YOL:
SELECT adres FROM students WHERE id<122 OR id>125;
--2. YOL:
SELECT adres FROM students WHERE id NOT BETWEEN 122 AND 125;
--3. YOL:
SELECT adres FROM students WHERE id NOT IN (122,123,124,125);

-- Tüm satırları sil
DELETE FROM students;

-- verileri geri gelmeyecek şekilde sil
TRUNCATE students;-- where ile kullanılamaz

-- Soru 8: students tablosundan adres'i Hatay olan satırı siliniz
DELETE FROM students WHERE adres='Hatay';

-- Soru 9: students tablosundan ismi 'Ali Can' ve 'Veli Han' olan satırı siliniz

--1. yol
DELETE FROM students WHERE isim='Ali Can' OR isim='Veli Han';
--2.yol
DELETE FROM students WHERE isim IN ('Ali Can','Veli Han');

-- students table'ını siliniz

DROP TABLE students;
