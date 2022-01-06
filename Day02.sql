	CREATE TABLE student
	(id varchar(4),
	name varchar(25),
	age int
			);
/*=========================
     VERİ GİRİŞİ
===========================*/

INSERT INTO student VALUES('1001', 'MEHMET ALİ', 25);
INSERT INTO student VALUES('1002', 'AYŞE YILMAZ', 34);
INSERT INTO student VALUES('1003', 'JOHN STAR', 56);
INSERT INTO student VALUES('1004', 'MARY BROWN', 17);

/*==================================
     PARCALİ VERİ GİRİŞİ
====================================*/
insert into student(name,age) VALUES('Samet Ay',24);

/*=================================
     TABLODAN VERİ SORGULAMA
===================================*/
/* student dosyasındaki bilgilerin tamamini getir demek 
    select * from dosya adi
    DROP TABLE dosya adi silmek icin yazilir ve RUN tusuna basilir.
*/
select * from student;  