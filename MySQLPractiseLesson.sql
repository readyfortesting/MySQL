CREATE TABLE people 
(
    ssn CHAR (9),
    name VARCHAR(50),
    address VARCHAR(80)
);
DROP TABLE PEOPLE;

INSERT INTO PEOPLE VALUES (123456789, 'Mark Star', 'Florida');
INSERT INTO PEOPLE VALUES (234567890, 'Angie Way', 'Virginia');
INSERT INTO PEOPLE VALUES (345678901, 'Marry Tien', 'New Jersey');
INSERT INTO PEOPLE (ssn, address) VALUES (456789012, 'Michigan');
INSERT INTO PEOPLE (ssn, address) VALUES (567890123, 'California');
INSERT INTO PEOPLE (ssn, name) VALUES (567890123, 'California');

SELECT * FROM PEOPLE ;

--  SORU 1 : Boş adları "ad daha sonra eklenecek" olarak değiştirin.
-- DEGİSTİRMEK İCİN UPDATE KULLANİLİR.
update people 
set name='Adlar daha sonra eklenecek'
where name is null;

-- SORU 2 : Boş adresleri 'Adres daha sonra eklenecek' olarak değiştirin.
UPDATE people
SET adress='Adres daha sonra eklenecek' 
WHERE adress IS NULL;

-- SORU 3: people tablosunda 'Daha sonra eklenecek' tüm boş değerleri değiştirin.
UPDATE PEOPLE
SET NAME=coalesce(name, 'daha sonra eklenecek')

-- Create işçi tablosu alanları worker_id,work_name,work_salary şeklindedir.
-- worker_id, worker_id_pk adında primary key sahip olacak


-- İşçiler tablosuna 4 kayıt ekleyin-- Konsoldaki tabloya bakin
CREATE TABLE worker 
(
    worker_id char(3),
    worker_name VARCHAR(50),
    worker_salary int not null,
     CONSTRAINT worker_id_pk PRIMARY KEY (worker_id)
);
DROP TABLE worker;
INSERT INTO WORKER VALUES ('100','oli can', 1200);
INSERT INTO WORKER VALUES ('102','Veli Han', 2000);
INSERT INTO WORKER VALUES ('103','Ayse Kan', 7000);
INSERT INTO WORKER VALUES ('104', 'Angie Ocean', 8500);

SELECT * FROM WORKER ;

-- SORU 4:Veli Han'ın maaşını en yüksek maaştan yüzde 20 daha azına artırin.
UPDATE WORKER
SET worker_salary=(SELECT max(worker_salary) FROM (SELECT *FROM WORKER) AS W )-((SELECT MAX(worker_salary) FROM (SELECT * FROM WORKER )AS V)*0.20)
WHERE worker_name='Veli Han';

-- -- SORU 5: En düsük maasi %30 arttirin ve Oli Can'in mevcut maasi ie update ediniz.


-- Maaş ortalama maaştan düşükse maaşları 1000 artırın

-- Maaşın ortalama maaştan az olması durumunda maaşları ortalama maaşa eşit 