-- 1-) Aşağıdaki tabloları oluşturarak verileri giriniz.
CREATE TABLE calisanlar1
(
id CHAR(4),
isim VARCHAR(50),
maas int(5),
CONSTRAINT id_pk PRIMARY KEY (id)
);
INSERT INTO calisanlar1 VALUES('1001', 'Ahmet Aslan', 7000);
INSERT INTO calisanlar1 VALUES( '1002', 'Mehmet Yılmaz' ,12000);
INSERT INTO calisanlar1 VALUES('1003', 'Meryem ', 7215);
INSERT INTO calisanlar1 VALUES('1004', 'Veli Han', 5000);
CREATE TABLE aileler
(
id CHAR(4),
cocuk_sayisi VARCHAR(50),
ek_gelir int(5),
CONSTRAINT id_fk FOREIGN KEY (id) REFERENCES calisanlar1(id)
);
INSERT INTO aileler VALUES('1001', 4, 2000);
INSERT INTO aileler VALUES('1002', 2, 1500);
INSERT INTO aileler VALUES('1003', 1, 2200);
INSERT INTO aileler VALUES('1004', 3, 2400);

SELECT*FROM calisanlar1;
select*from aileler;
/* 
SORU 2-) Veli Han'ın maaşına %20 zam yapacak update komutunu yazınız.
Güncellemeden sonra calisanlar tablosu aşağıda görüldüğü gibi olmalıdır.
*/
update calisanlar1
set maas = maas*1.2
where isim='veli han';

/* 
SORU 3-) Maaşı ortalamanın altında olan çalışanların maaşına %20 zam yapınız.
Komut sonrası görünüm aşağıdaki gibidir.
*/
update calisanlar1
set maas=maas*1.2
where  maas< (select avg(maas) from (select maas from calisanlar1 ) as liste);

/* 
SORU 4-) Çalışanların isim ve cocuk_sayisi'ni listeleyen bir sorgu yazınız. Komut
sonrası görünüm aşağıdaki gibidir */

select isim, (select cocuk_sayisi from aileler where calisanlar1.id=aileler.id ) as cocuk_sayisi
from calisanlar1;

-- 2.yontem daha kisayoldan
select isim,cocuk_sayisi from calisanlar1,aileler
where calisanlar1.id=aileler.id;

/* 
SORU 5-) calisanlar' ın id, isim ve toplam_gelir'lerini gösteren bir sorgu yazınız.
toplam_gelir = calisanlar.maas + aileler.ek_gelir
Komut sonrası görünüm aşağıdaki gibidir.
*/
select id, isim, ((select ek_gelir from aileler  
where calisanlar1.id=aileler.id )+maas)as toplam_gelir   from calisanlar1;

-- 2.yontem
select isim, (maas+ek_gelir) ,calisanlar1.id
from calisanlar1,aileler
where calisanlar1.id=aileler.id;
/* 
SORU 6-) Eğer bir ailenin kişi başı geliri 2000 TL den daha az ise o çalışanın
-- maaşına ek %10 aile yardım zammı yapınız.
-- kisi_basi_gelir = toplam_gelir / cocuk_sayisi + 2 (anne ve baba)
*/
UPDATE calisanlar1 
    SET maas = maas * 1.1   
    WHERE (SELECT (maas + ek_gelir)/(cocuk_sayisi + 2) FROM aileler
          WHERE calisanlar1.id = aileler.id) < 2000; 
