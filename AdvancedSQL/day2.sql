do $$
<<outer_block>>
declare -- Outer blok
	counter integer := 0;
begin
	counter := counter+1;
	raise notice 'Outer Block icin counter degeri: %', counter;
	
	declare -- inner block
		counter integer := 0;
	begin
		counter := counter+10;
		raise notice 'Inner Block icin Counter degeri: %', counter;
		raise notice 'Outer Block icin counter degeri: %', outer_block.counter;
	end;
	raise notice 'Outer Block icin counter degeri: %', counter;
	
end $$;


-- ******** CONSTANT / SABIT **********

do $$
declare
	kdv constant numeric := 0.1;
	net_price numeric := 20.5;
begin
	raise notice 'Satis fiyati: %', net_price*(1+kdv);
end $$;

-- ******** IF STATEMENT **********

-- syntax
/*
		IF condition THEN
			statement;
		END IF;
*/


-- Task 1:  1 id'li filmi bulalım, eğer bulunamazsa ekrana 'Bulunamadı: %',istenen_id yazısını print edelim.

do $$
declare 
	istenilen_film film%rowtype;
	istenilen_id film.id%type := 10;	
begin
	SELECT * FROM film WHERE id=istenilen_id INTO istenilen_film;
	
	if not found then 
		raise notice 'Bulunamadi: %', istenilen_id;
	end if;
end $$;

-- ******** IF ELSE STATEMENT **********

-- syntax
/*
		IF condition THEN
			statement;
		ELSE
			alternative statement;
		END IF;
*/

do $$
declare 
	istenilen_film film%rowtype;
	istenilen_id film.id%type := 1;	
begin
	SELECT * FROM film WHERE id=istenilen_id INTO istenilen_film;
	
	if not found then 
		raise notice 'Bulunamadi: %', istenilen_id;
	else
		raise notice 'Film: %', istenilen_film.title;
	end if;
end $$;

-- ******** IF ELSE - IF ELSE STATEMENT **********

-- syntax
/*
		IF condition THEN
			statement;
		ELSEIF condition2 THEN
			statement;
		ELSE		
			statement;
		END IF;
*/


/*
 	Task : 1 id li film varsa: 
			Süresi 50 dakikanın altında ise Short, 
			50<length<120 ise Medium, 
			length>120 ise Long yazdıralım.
*/


do $$
declare 
	istenilen_film film%rowtype;
	istenilen_id film.id%type := 1;
	de
begin
	SELECT * FROM film WHERE id=istenilen_id INTO istenilen_film;
	
	if not found then
		raise notice 'Film bulunamadi.';
	else
		if istenilen_film.length<50 then 
			raise notice 'Short - Suresi: %',istenilen_film.length;
		elseif istenilen_film.length<120 then
			raise notice 'Medium - Suresi: %',istenilen_film.length;
		else
			raise notice 'Long- Suresi: %',istenilen_film.length;
		end if;
	
	end if;
end $$;

-- 2. yol
 
do $$
declare 
	istenilen_film film%rowtype;
	istenilen_id film.id%type := 1;
	description text;
begin
	SELECT * FROM film WHERE id=istenilen_id INTO istenilen_film;
	
	if not found then
		raise notice 'Film bulunamadi.';
	else
		if istenilen_film.length<50 then 
			description := 'Short';
		elseif istenilen_film.length<120 then
			description := 'Medium';
		else
			description := 'Long';
		end if;
		
		raise notice'% filmin suresi : %', istenilen_film.title, description;
	
	end if;
end $$;


-- ************ Case Statement **********

-- syntax
/*
		CASE expression
			WHEN condition1 THEN
				***
			***
			
			ELSE
				***
		END CASE;
*/
		
-- Task: Filmin turune gore cocuklara uygunlugunu yazdirin

do $$
declare 
	uyari varchar(50);
	tur film.type%type;
begin
	select type from film where id=4 into tur;
	
	if found then
		case tur
			when 'Korku' then uyari := 'Cocuklar icin uygun degildir.';
			when 'Macera' then uyari := 'Cocuklar icin uygundur.';
			when 'Animasyon' then uyari := 'Cocuklar icin tavsiye edilir.';
			else
				uyari := 'Tanimlanamadi!';
		end case;
		
		raise notice '%', uyari;
	end if;
end $$;


-- Task: Film tablosundaki film sayısı, 10 dan az ise "Film sayısı az.",
--			10 dan çok ise "Film sayısı yeterli" yazdırın.
SELECT count(*) FROM film -- 4


do $$
declare
	film_sayısı integer := 0;
begin
	select count(*) from film
	into film_sayısı;
	
	if film_sayısı < 10 then
		raise notice 'Film sayısı az!';
	else 
		raise notice 'Film sayısı yeterli';
	end if;
	
end $$;


-- ************ Case Statement **********

-- syntax
/*
		WHILE condition LOOP
			statement;
		END LOOP;
*/

-- Task: 1 den 4 e kadar counter değerini ekrana yazdıralım


do $$
declare
	counter integer := 1;
begin
	While counter<5 loop
		raise notice '%', counter;
		counter := counter+1;
	end loop;
end $$;

-- ******* FOR LOOP ********
--syntax:
/*
		for loop_counter in [reverse] from..to loop
			işlemler
		end loop;
*/

do $$
begin
	for counter in 1..6 loop -- +1
		raise notice '%', counter;
	end loop;
end $$;

-- Reversed
do $$
begin
	for counter in reverse 6..1 loop -- -1
		raise notice '%', counter;
	end loop;
end $$;

-- by

do $$
begin
	for counter in 0..6 by 2 loop -- +2
		raise notice '%', counter;
	end loop;
end $$;

-- Reversed by
do $$
begin
	for counter in reverse 6..0 by 2 loop -- -2
		raise notice '%', counter;
	end loop;
end $$;

-- Task: 10 dan 20 ye kadar sayıları 2şer 2şer yazdıralım

do $$
begin
	for counter in 10..20 by 2 loop
		raise notice '%', counter;
	end loop;
end $$;


-- LOOP / EXIT KEYWORD
do $$
declare
	counter integer := 0;
begin
	loop
		raise notice '%', counter;
		counter := counter + 1;
		EXIT WHEN counter=6;
	end loop;
end $$;

-- Array : Array elemanlarini gosterelim
do $$
declare
	array_int int[] := array[11,22,33,44,55,66,77,88,99];
	var int[];
begin
	for var in select array_int loop
		raise notice '%', var;
		raise notice '%', var[2];
	end loop;
end $$;

-- ******** CONTINUE ********
--syntax:
-- continue [loop_label] when_condition
do $$
declare
	counter integer := 0;
begin
	loop
		counter := counter+1;
		exit when counter>10;
		
		continue when mod(counter, 2)=0;
		
		raise notice '%', counter;
	end loop;
end $$;

-- ******** FUNCTION ********

--syntax:
/*
		create [or replace] function function_name(param_list)
			returns return_type -- dönen data type belirtiliyor
			language plpgsql -- yazılan dili belirtiyoruz
			as
			
			$$
			declare
			begin
			
				return ...;
			
			end $$;
*/

-- Film tablomuzdaki belirli süre aralığındaki filmlerin sayisini getiren bir fonksiyon yazalım

create or replace function get_film_count(min_len integer, max_len integer)
returns integer
language plpgsql
as

	$$
	declare
		film_count integer;
	begin
		SELECT count(*)
		FROM film
		WHERE length between min_len and max_len
		INTO film_count;
		
		return film_count;
	end $$;
	
-- 1. YOL
select get_film_count(30, 100);

-- 2. YOL
select get_film_count(
	min_len := 30,
	max_len := 100
);
		
		
-- HAZIR METHOD LAR
select min(length) from film;
select max(length) from film;
select avg(length) from film;		
		

-- Task : parametre olarak girilen iki sayının toplamını veren sayitoplama adında bir fonksiyon yazalım






