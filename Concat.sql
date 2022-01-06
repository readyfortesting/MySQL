create table customer (
musteri_no int,
ad VARCHAR(22),
soyad VARCHAR(25),
sehir varchar(45),
cinsiyet varchar(15),
puan int
);
INSERT INTO customer VALUES(111,'ebru', 'akar','denizli','kadin',78);
INSERT INTO customer VALUES(222,'ayse', 'kara','ankara','kadin',90);
INSERT INTO customer VALUES(333,'ali','gel','istanbul','erkek',66);
INSERT INTO customer VALUES(444, 'mehmet','okur','mus','erkek',98);

select concat('Adiniz Soyadiniz:', ad,' ',soyad) from customer;
-- bosluk yapmak icin ' '
-- + yapmak icin ,

select concat(musteri_no,'.)',ad,' ',soyad) as ad_soyad, sehir, cinsiyet, puan from customer;   
-- 3.kisinin no su yazilsin dyelim
-- '' tirnak icine yazilan hersey aynen kelime gibi cikar