-- yorum

/*
yorum satiri
*/

-- **************** DEGISKEN TANIMLAMA **************
do $$ -- do : Anonymous Block. Dolar ozel karakter oncesinde tirnak icin
declare
	counter integer := 1; -- counter adinda bir degisken olusturuldu' default degeri 1 olarak atandi.
	isim varchar(50) := 'Emre';
	soyisim varchar(50) := 'Gül';
	payment numeric(4,2) := 20.5; --20.50
begin
	raise notice '%', isim;
	raise notice 'Isim: %, Soyisim: %', isim, soyisim;
end $$;	


-- **************** soru **************
-- Gerekli değişkenleri oluşturarak ekrana, "Ahmet ve Mehmet beyler 120 tl ye bilet aldılar." cümlesini ekrana yazdırın.
do $$ 
declare
	bilet numeric(3) := 120;
	isim1 varchar(50) := 'Ahmet';
	Isim2 varchar(50) := 'Mehmet';

begin

	raise notice '% ve % byler % tl ye bilet aldilar.', isim1, isim2, bilet;
end $$;

-- **************** Bekletme komutu **************

do $$
Declare
	created_at time := now(); -- time -> data type, now() -> oluşturulduğu zaman
begin
	raise notice '%', created_at;
	perform pg_sleep(5);       --- 5 saniye bekle
	raise notice '%', created_at;
end $$

-- **************** Tablodan Data Tipini Kopyalama **************

do $$
Declare
	f_title film.title%type; -- f_title text;
	f_sure film.length%type; -- f_title integer;
begin
	SELECT title FROM film WHERE id=1 INTO f_title;
	
	raise notice 'Film Basligi: %', f_title;
end $$;
	
-- **************** Row Type **************	

do $$
Declare
	selected_actor actor%rowtype; -- f_title text;

begin
	SELECT * FROM actor WHERE id=1 INTO selected_actor;
	
	raise notice '% %', selected_actor.firat_name, selected_actor.last_name;
end $$;
	
	
-- **************** Record Type **************	

do $$
Declare
	rec record; 
begin
	SELECT title,type FROM film WHERE id=2 INTO rec;
	
	raise notice 'Title: %, Tur: %', rec.title, rec.type;
end $$;
