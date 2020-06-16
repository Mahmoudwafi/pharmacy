CREATE TABLE PHARMACY (
    PHARMACY_ID INT PRIMARY KEY,
    PHARMCY_NAME VARCHAR (100) NOT NULL,
    PHARMACY_ADDREES VARCHAR (255),
);

CREATE TABLE PHARMACY_CONTACT (
    CONTACT_ID INT NOT NULL,
    PHONE_NUMBER VARCHAR (100) NOT NULL,
    PHARMACY_ID INT,
    PRIMARY KEY (CONTACT_ID),
    CONSTRAINT FK_PHARMCY FOREIGN KEY (PHARMACY_ID)
    REFERENCES PHARMACY(PHARMACY_ID)
);

CREATE TABLE PHARMACIST (
    PHAMACIST_ID  INT NOT NULL,
    PHAMACIST_NAME VARCHAR (100) NOT NULL,
    SALARY INT,
    PHARMACY_ID INT,
    PRIMARY KEY (PHAMACIST_ID),
    CONSTRAINT FK_DOC_PHAR FOREIGN KEY (PHARMACY_ID)
    REFERENCES PHARMACY (PHARMACY_ID)
);


CREATE TABLE RECIEPT (
    RECIEPT_ID  INT NOT NULL,
    BARCODE VARCHAR (1000) NOT NULL,
    RECIEPT_DATE DATE,
    PRICE INT,
    PRIMARY KEY (RECIEPT_ID)
);



CREATE TABLE CLIENT (
    CLIENT_ID INT NOT NULL,
    CLIENT_NAME VARCHAR (100) NOT NULL,
    AGE INT,
    PHARMACY_ID INT,
    PRIMARY KEY (CLIENT_ID),
    CONSTRAINT FK_CLIENT_PHAR FOREIGN KEY (PHARMACY_ID)
    REFERENCES PHARMACY (PHARMACY_ID)
);


CREATE TABLE PHARMACIST_CONTACT (
    CONTACT_ID  INT NOT NULL,
    PHONE_NUMBER VARCHAR (100) NOT NULL,
    PHAMACIST_ID  INT,
    PRIMARY KEY (CONTACT_ID),
    CONSTRAINT FK_PHARMACIST FOREIGN KEY (PHAMACIST_ID)
    REFERENCES PHARMACIST (PHAMACIST_ID)
);

CREATE TABLE VISIT_DATA (
    ID INT NOT NULL,
    CLIENT_ID INT,
    PHAMACIST_ID  INT,
    RECIEPT_ID INT,
    PRIMARY KEY (ID),
    CONSTRAINT FK_CLIENT_VIS FOREIGN KEY (CLIENT_ID)
    REFERENCES CLIENT  (CLIENT_ID),
    CONSTRAINT FK_PHARMACIST1 FOREIGN KEY (PHAMACIST_ID)
    REFERENCES PHARMACIST (PHAMACIST_ID),
    CONSTRAINT FK_RECIEPT FOREIGN KEY (RECIEPT_ID)
    REFERENCES RECIEPT (RECIEPT_ID)
);

INSERT INTO PHARMACY (PHARMACY_ID,PHARMCY_NAME, PHARMACY_ADDREES) 
VALUES (1,'PHAMACY 1','CAIRO, EGYPT');


INSERT INTO PHARMACIST (PHAMACIST_ID,PHAMACIST_NAME, SALARY, PHARMACY_ID) 
VALUES (1,'AYMAN', 8720, 1);

INSERT INTO RECIEPT (RECIEPT_ID ,BARCODE, RECIEPT_DATE, PRICE)
VALUES (1,'XYZ123',CURRENT_TIMESTAMP , 720) ;

INSERT INTO CLIENT (CLIENT_ID,CLIENT_NAME, AGE, PHARMACY_ID) 
VALUES (1,'CLIENT 1', 55, 1);

INSERT INTO PHARMACIST_CONTACT (CONTACT_ID, PHONE_NUMBER, PHAMACIST_ID) 
VALUES (1,'1010011010', 1);

UPDATE PHARMACY SET PHARMCY_NAME ='XYXXYX' ,PHARMACY_ADDREES='ALEX,EGYPT' WHERE PHARMACY_ID =1;

UPDATE PHARMACIST  SET SALARY =10000 WHERE PHAMACIST_ID = 1;

UPDATE RECIEPT   SET PRICE =530  WHERE RECIEPT_ID =1;


UPDATE CLIENT    SET CLIENT_NAME ='CSSDASFA' WHERE CLIENT_ID =1;

UPDATE PHARMACIST_CONTACT  SET PHONE_NUMBER ='01011010101' WHERE CONTACT_ID =1;

DELETE FROM VISIT_DATA   WHERE PHAMACIST_ID  =1;


DELETE FROM VISIT_DATA   WHERE RECIEPT_ID =1;


DELETE FROM VISIT_DATA   WHERE CLIENT_ID =1;


DELETE FROM CLIENT WHERE CLIENT_NAME = 'CLIENT 1';

DELETE FROM PHARMACIST_CONTACT WHERE PHONE_NUMBER = '1010011010';

SELECT C.CLIENT_NAME, C.CLIENT_ID  FROM CLIENT C , RECIEPT 
WHERE CLIENT_ID  =C.CLIENT_ID 
AND C.CLIENT_NAME = 'XX'
AND PRICE =(SELECT MAX(R.PRICE) FROM RECIEPT R WHERE CLIENT_ID   = C.    CLIENT_ID  ) ;

SELECT P.SALARY MAX_SALARY FROM PHARMACIST P 
WHERE SALARY=(SELECT MAX(P1.SALARY) FROM PHARMACIST P1);

SELECT R.RECIEPT_ID ,R.PRICE MAX_PRICE FROM RECIEPT R 
WHERE R.PRICE =(SELECT MAX(R1.PRICE) FROM RECIEPT R1);

SELECT COUNT (*) FROM VISIT_DATA WHERE CLIENT_ID = 1 ;

SELECT COUNT(*) FROM VISIT_DATA  WHERE RECIEPT_ID = 1;


SELECT C.CLIENT_NAME, C.CLIENT_ID  FROM CLIENT C , RECIEPT 
WHERE CLIENT_ID  =C.CLIENT_ID 
AND C.CLIENT_NAME = 'XX'
AND PRICE =(SELECT MAX(R.PRICE) FROM RECIEPT R WHERE CLIENT_ID   = C.    CLIENT_ID  ) ;

SELECT P.    PHARMCY_NAME , C.PHONE_NUMBER FROM PHARMACY P , PHARMACIST_CONTACT C 
WHERE     PHARMCY_NAME LIKE '%PHARMA%' AND P.PHARMACY_ID = C.CONTACT_ID;
 
SELECT P.PHARMACY_ADDREES, PH.    SALARY  FROM  PHARMACY P , PHARMACIST PH WHERE 
PHARMACY_ADDREES LIKE '%CAIRO%' AND P.PHARMACY_ID = PH.PHAMACIST_ID ;

SELECT SUM (T.PRICE)
 FROM
 RECIEPT T, VISIT_DATA VD, CLIENT C
WHERE
 C.CLIENT_ID=VD.CLIENT_ID AND VD.RECIEPT_ID =T.RECIEPT_ID AND CLIENT_NAME= '?';
 
SELECT PRICE 
FROM RECIEPT WHERE RECIEPT_ID = 1;
SELECT PHAMACIST_NAME 
 FROM PHARMACIST ORDER BY PHAMACIST_NAME  DESC;
 SELECT AVG (AGE)
 FROM CLIENT;
SELECT SUM (PRICE) FROM RECIEPT 
WHERE RECIEPT_DATE = CURRENT_TIMESTAMP; 
      
SELECT * FROM PHARMACY;

SELECT * FROM PHARMACIST;

SELECT * FROM RECIEPT;

SELECT * FROM PHARMACIST_CONTACT;
 
SELECT AGE FROM CLIENT WHERE CLIENT_ID=1;

SELECT AVG (SALARY) FROM PHARMACIST;

SELECT * FROM RECIEPT WHERE BARCODE='?';
SELECT * 
FROM PHARMACIST 
WHERE PHAMACIST_ID =1;

SELECT PHARMACY_ADDREES 
FROM PHARMACY 
WHERE PHARMACY_ID =1;

SELECT MAX(AGE) FROM CLIENT ;

SELECT MAX(SALARY) FROM PHARMACIST P
WHERE SALARY = (SELECT MAX (P1.SALARY) FROM PHARMACIST P1 WHERE 
P1.PHAMACIST_ID  ! =P.PHAMACIST_ID  ) ;

SELECT P.PHAMACIST_NAME , P.PHAMACIST_ID FROM PHARMACIST P , PHARMACIST_CONTACT PC WHERE PC.PHAMACIST_ID=P.PHAMACIST_ID AND PC.PHONE_NUMBER ='?';
SELECT * FROM PHARMACIST 
WHERE PHAMACIST_NAME = '?';

SELECT * FROM PHARMACIST 
WHERE PHAMACIST_ID = 1;


