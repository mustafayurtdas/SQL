
/*
TRANSACTİON: Verileri silinmeye karsı korur
Tabloya ekledigimiz verileri silinmeye karsı korumak istiyorsak TRANSACTİON islemi kullanılır
Begin: Transaction'ı baslatmak icin kullanılır
Savepoint: Verileri silinmeye karsı save eder
Rollback: Silinen verileri geri getirir
Commit: Transaction'ı sonlandırmak icin kullanılır
*/

create table evraklar
(
id int,
onem_derecesi varchar(40),
konusu varchar(100)
);

Begin;
insert into evraklar values(100,'Çok Önemli','Saglık');
insert into evraklar values(101,'Çok Önemli','Maliye');
insert into evraklar values(102,'Çok Önemli','Nüfus');
insert into evraklar values(103,'Çok Önemli','Mezuniyet');

savepoint x;

insert into evraklar values(104,'Önemsiz','Apartman Makbuzu');
insert into evraklar values(105,'Önemsiz','Su Faturası');

select * from evraklar;

delete from evraklar;

select * from evraklar;

rollback to x;

select * from evraklar;

commit;

delete from evraklar;

select * from evraklar;

-- NOT:  commit işleminden sonra (yani transaction islemi sonlandırıldıktan sonra )
-- delete from evraklar; koduyla evraklar tablosundaki tum verileri silerseniz
-- artık o veriler geri gelmez.
-- Cunku transaction islemi sonlandırılmıstı
/*
