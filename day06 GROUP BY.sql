/*============================= GROUP BY =====================================

    GROUP BY cümleciği bir SELECT ifadesinde satırları, sutunların değerlerine 
    göre özet olarak GRUPLAMAK için kullanılır. 
   
    GROUP BY cümleceği her grup başına bir satır döndürür. 
    
    GROUP BY genelde, AVG(),COUNT(),MAX(),MIN() ve SUM() gibi aggregate 
    fonksiyonları ile birlikte kullanılır.
==============================================================================*/

create table insan(
id int primary key,
isim varchar(20),
soyisim varchar(20),
yas int,
cinsiyet char,
sehir varchar(20),
ulke varchar(20),
maas int
);


insert into insan values(200, 'Oguz', 'Kagan', '46', 'E', 'Berlin', 'Almanya', '32000');
insert into insan values(201, 'Burak', 'Ak', '30', 'E', 'Paris', 'Fransa', '50000');
insert into insan values(202, 'Funda', 'Nar', '30', 'K', 'Berlin', 'Almanya', '42000');
insert into insan values(203, 'Muhammet', 'Bir', '40', 'E', 'Paris', 'Fransa', '36000');
insert into insan values(204, 'Hasan',  'Ozay', '30', 'E', 'Izmir', 'Turkiye', '18000');
insert into insan values(205, 'Fatma', 'Yilmaz', '40', 'K', 'Istanbul', 'Turkiye', '20000');
insert into insan values(206, 'Resul', 'Demir', '35', 'E', 'Ankara', 'Turkiye', '21000');
insert into insan values(207, 'Elif', 'Can', '38', 'K', 'Isparta', 'Turkiye', '19000');
insert into insan values(208, 'Sinan', 'Burc', '32', 'E', 'Londra', 'Ingiltere', '60000');
insert into insan values(209, 'Hamza', 'Kul', '29', 'E', 'Londra', 'Ingiltere', '63000');
insert into insan values(210, 'Aylin', 'Van', '51', 'K', 'Roma', 'Italya', '38000');



select * from insan;

-- SORU01: ulke'lere göre ortalama yas'ı listeleyiniz

Select ulke , round(avg(yas)) AS ort_yas FROM insan GROUP BY ulke;

-- SORU02: ulke'lere göre kaç çalışan olduğunu listeleyiniz.

select ulke, count(id) AS sayi FROM insan group by ulke;

-- SORU03: cinsiyet'e göre maas ortalamasını listeleyiniz

select cinsiyet, round(avg(maas),2) AS ort_maas FROM insan group by cinsiyet;

-- SORU04: insan tablosunu, ulke'lere göre ve sehir'lere göre gruplayarak listeleyiniz

Select ulke,sehir From insan group by ulke,sehir;

-- SORU05: ulke'lere göre ve sehir'lere göre çalışan sayısını listeleyiniz.

Select ulke,sehir, count(isim) as calisan From insan group by ulke,sehir;

-- SORU06: ulke'lere göre ve cinsiyet'e göre çalışan sayısını ve yas ortalamasını listeleyiniz.

select ulke,cinsiyet, count(isim) as calisan,round(avg(yas)) as ort_yas from insan group by ulke, cinsiyet;



-- SORU07: maas'ı 30000 den büyük olanların, ulke'lere göre ve cinsiyet'e göre çalışan sayısını, yas ortalamasını listeleyiniz.

select ulke, cinsiyet, count(isim) as calisan_sayisi, round(avg(yas)) as yas_ort from insan 
where maas>30000
group by ulke,cinsiyet;


/*
=========================================== HAVING =================================================
1) Şart belirtmek icin kullanılır
2) Group By komutundan sonra yer alır
3) Where komutundan farkı: Gruplama yaptıktan sonra cıkan sonucta şart kosulacaksa kullanılır
===================================================================================================
*/

--SORU08: ulke'lere göre yas ortalamasını bulup, yas ortalaması 30'dan buyuk olanları listeleyiniz. 

select ulke, round(avg(yas)) as yas_ort from insan
group by ulke
having avg(yas)>30;

--SORU9: ulke'lere göre toplam maası bulup, toplam maas 30000'den buyuk olanları listeleyiniz

select ulke, sum(maas) as toplam_maas from insan 
group by ulke
having sum(maas)>30000;

