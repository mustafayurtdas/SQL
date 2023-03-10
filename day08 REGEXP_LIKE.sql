/* ==================================  REGEXP_LIKE  ==========================================
   REGEXP_LIKE: Gibi anlamına gelir. Daha karmaşık sorgulama işlemi için kullanılabilir.
           ~ isareti ile ifade edilir.
        Syntax:
        --------
    SELECT * FROM tablo_adi
    WHERE sutun_adi ~ PATTERN
 ========================================================================================= */

create table exercises
(
id int UNIQUE,
kelime varchar(50) NOT NULL, 
harf_sayisi int
);

INSERT INTO exercises VALUES (1001, 'hot', 3);  
INSERT INTO exercises VALUES (1002, 'hat', 3);  
INSERT INTO exercises VALUES (1003, 'hit', 3);  
INSERT INTO exercises VALUES (1004, 'hbt', 3);  
INSERT INTO exercises VALUES (1008, 'hct', 3);  
INSERT INTO exercises VALUES (1005, 'adem', 4);  
INSERT INTO exercises VALUES (1006, 'selim', 5);  
INSERT INTO exercises VALUES (1007, 'yusuf', 5);
INSERT INTO exercises VALUES (1009, 'hAt', 3); 
select * from exercises;


-- SORU1 : ilk harfi 'h', son harfi 't' olup, 2. harfi 'a' veya 'i' olan 3 harfli kelimelerin tum bilgilerini listeleyiniz.

select * from exercises where kelime ~ 'h[ai]t';

-- SORU2 : ilk harfi 'h', son harfi 't' olup, 2. harfi 'a' veya 'i' olan 3 harfli kelimeleri
--         buyuk harf kucuk harf gözetmeksizin tum bilgilerini listeleyiniz.

select * from exercises where kelime ~* 'h[ai]t';

--NOT: buyuk harf kucuk harf gozetmeksizin listelemek istersek ~* kullanırız

-- SORU3 : ilk harfi 'h', son harfi 't' olup, 2.harfi 'a' ile 'k' arasinda olan 3 harfli kelimelerin tum bilgilerini listeleyiniz
select * from exercises where kelime ~ 'h[a-k]t';

-- SORU4 : ilk harfi 'a' veya 's' ile baslayan kelimelerin tum bilgilerini listeleyiniz
select * from exercises where kelime ~ '^[as]';

--NOT: ^ isareti baslayan anlamında kullanılır

-- SORU5 : son harfi 'm' veya 'f' ile biten kelimelerin tum bilgilerini listeleyiniz.
select * from exercises where kelime ~ '[mf]$';

-- NOT: $ isareti biten anlamında kullanılır


-- SORU6 : son harfi 'm' veya 'f' ile bitmeyen kelimelerin tum bilgilerini listeleyiniz.
select * from exercises where kelime !~ '[mf]$';


