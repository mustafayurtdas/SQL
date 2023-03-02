/*
SORU2: insanlar isminde bir tablo oluşturunuz. 
isim, soyisim sutunları olsun.
isim sutununun data tipi varchar(20) olsun.
soyisim sutununun data tipi varchar(30) olsun. 


isim sutununda PRİMARY KEY kısıtlaması olsun. Kısıtlamanın isimi pr_ks olsun.
soyisim sutununda UNIQUE kısıtlaması olsun. Kısıtlamanın ismi uni_ks olsun.
*/

CREATE TABLE insanlar(
	
	isim varchar(20),
	soyisim varchar(30),
	
	CONSTRAINT pr_ks PRIMARY KEY(isim),
	CONSTRAINT uni_ks UNIQUE(soyisim)
	
);

INSERT INTO insanlar VALUES('Harun','Tan');
INSERT INTO insanlar VALUES('Azra','Can');


INSERT INTO insanlar VALUES('Harun','Kan');  	-- PRIMARY KEY SEBEBİYLE ERROR VERİR
INSERT INTO insanlar VALUES(null,'Er');  		-- PRIMARY KEY SEBEBİYLE ERROR VERİR
INSERT INTO insanlar VALUES('Kudret','Can');	-- UNIQUE SEBEBİYLE ERROR VERİR




/*
SORU3: hayvanlar isminde bir tablo oluşturunuz. 
isim, cins sutunları olsun.
isim sutununun data tipi varchar(20) olsun.
cins sutununun data tipi varchar(25) olsun.

isim ve cins sutunları birlesiminden bir PRIMARY KEY kısıtlaması olsun.(Composite Primary Key)

*/

CREATE TABLE hayvanlar (
	
	isim varchar(20),
	cins varchar(25),
	
	CONSTRAINT comp_pr_ks PRIMARY KEY (isim,cins)

);

INSERT INTO hayvanlar VALUES('Fındık','Sus Kopegi'); 
INSERT INTO hayvanlar VALUES('Fındık','Coban Kopegi'); 
INSERT INTO hayvanlar VALUES('Duman','Sus Kopegi');  

INSERT INTO hayvanlar VALUES('Fındık','Sus Kopegi');  -- COMPOSİTE PRIMARY KEY SEBEBİYLE ERROR VERİR


-- NOT: CONSTRAINT'leri sutun isimlerinin altında belirtmenin bize sagladıgı kolaylık;

-- 1) CONSTRAINT ismini kendimiz belirleyebiliyoruz
-- 2) COMPOSİTE PRIMARY KEY yapmamıza imkan saglıyor.( iki stunun birlesiminden bir Primary Key olusturulmasına)



create table emekciler
(
id char(5) PRIMARY KEY,   ---> UNIQUE + NOT NULL
isim varchar(50) UNIQUE,
maas int NOT NULL
);


insert into emekciler values(10002, 'Mehmet Yılmaz', 12000);
insert into emekciler values(10008, null, 5000);
insert into emekciler values(10010, null,5000);
insert into emekciler values(10020, null, 5000);
insert into emekciler values(10004, 'Veli Han', 5000);
insert into emekciler values(10005, 'Mustafa Ali', 5000);
insert into emekciler values(10006, 'Canan Yaş', null);  				-- not-null constraint
insert into emekciler values(10003, 'CAN', 5000);
insert into emekciler values(10007, 'CAN', 5000);  						-- unique constraint
insert into emekciler values(10009, 'Cem', '');  						-- invalid input syntax for type integer
insert into emekciler values('', 'osman', 2000);
insert into emekciler values('', 'osman can', 2000); 					-- unique constraint "emekciler_pkey"
insert into emekciler values('', 'veli can', 6000);  	 				-- unique constraint "emekciler_pkey"
insert into emekciler values(10002, 'ayse Yılmaz', 12000);  			-- unique constraint "emekciler_pkey"
insert into emekciler values(null, 'filiz', 12000); 					-- not-null constraint



SELECT * FROM emekciler;



