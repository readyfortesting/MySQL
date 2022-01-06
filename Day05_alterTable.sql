/*=============================== ALTER TABLE ==================================
    
    ALTER TABLE  tabloda ADD, MODIFY, veya DROP/DELETE COLUMNS islemleri icin 
    kullanilir.
    
    ALTER TABLE ifadesi tablolari yeniden isimlendirmek (RENAME) icin de
    kullanilir.
    
   -- dis yapi DDL(alter),satir ekleme,sütun adi degistirme,data tipi degistrme gibi kein buyuk degişikliklerde DDL
   -- İC YAPİ DML : update
==============================================================================*/

    CREATE TABLE personel
    (
        id int PRIMARY KEY , 
        isim VARCHAR(50), 
        sehir VARCHAR(50), 
        maas int, 
        sirket VARCHAR(20)
    );


    INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
    INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
    INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
    INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');
    INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
    INSERT INTO personel VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');
    
    
    /* -----------------------------------------------------------------------------
  ORNEK1: personel tablosuna ulke_isim adinda ve default degeri 'Turkiye' olan 
  yeni bir sutun ekleyiniz.
------------------------------------------------------------------------------*/ 
alter table personel
add ulke_isim VARCHAR(20) default 'TURKİYE';
                select * from personel; -- kontrol etmek icin buraya yazdim
/* -----------------------------------------------------------------------------
  ORNEK2: personel tablosuna cinsiyet Varchar2(20) ve yas Number(3) seklinde 
  yeni sutunlar ekleyiniz.
------------------------------------------------------------------------------*/  
    alter table personel add (cinsiyet Varchar(20), yas int);
    
/* -----------------------------------------------------------------------------
  ORNEK3: personel tablosundan sirket sutununu siliniz. 
------------------------------------------------------------------------------*/ 
-- tablonun ana yapisinda islem olacaksa,buyuk bir degisiklik olacaksa DDL yani ALTER
alter table personel
drop column sirket;

/* -----------------------------------------------------------------------------
  ORNEK4: personel tablosundaki ulke_isim sutununun adini ulke_adi olarak 
  degistiriniz. 
------------------------------------------------------------------------------*/  
 alter table personel
 rename column ulke_isim to ulke_adi;
 
    
/* -----------------------------------------------------------------------------
  ORNEK5: personel tablosunun adini isciler olarak degistiriniz. 
------------------------------------------------------------------------------*/  
  alter table personel rename to isciler;
  
  -- kontrol etmek icin select * from isciler;
/* -----------------------------------------------------------------------------
  ORNEK6: isciler tablosundaki ulke_adi sutununa NOT NULL kisitlamasi ekleyiniz
  ve veri tipini VARCHAR(30) olarak değiştiriniz. 
------------------------------------------------------------------------------*/ 
alter table isciler modify ulke_adi varchar(30) not null;


