-- -----------------------------------------------------------------------------
--             Génération d'une base de données pour
--                           PostgreSQL                     
-- -----------------------------------------------------------------------------
--      Nom de la base : Gestion_VOL
--      Auteur : Elyes Lamine
--      Date de derrière modification : 17/10/2013 6:35:30
-- -----------------------------------------------------------------------------
-- Ce fichier contient le script destiné à créer la base de données "Gestion des vols".
-- Ce script doit être exécuté en tant qu'utilisateur "postgres".

\echo [INFO] Debut du script
\c postgres

DROP TABLE IF EXISTS VOL;
DROP TABLE IF EXISTS PILOTE;
DROP TABLE IF EXISTS AVION;
\echo [INFO] Suppression de la base de donnees
DROP DATABASE gestion_vol;

\echo [INFO] Creation de la base de donnees
CREATE DATABASE gestion_vol ENCODING 'UTF8';

\echo [INFO] Connexion a la nouvelle base de donnees
\c gestion_vol


\echo [INFO] Creation de la table Pilote

/* Question 1 */

CREATE TABLE Pilote 
( plnum INTEGER PRIMARY KEY,
 plnom VARCHAR(32),
 plprenom VARCHAR(32),
 ville VARCHAR(32),
 salaire INTEGER
 );

\echo [INFO] Creation de la table Avion
CREATE TABLE Avion (
avnum INTEGER NOT NULL,
avnom VARCHAR(32),
capacite INTEGER ,
localisation VARCHAR(32),
CONSTRAINT PK_Avion PRIMARY KEY (avnum)
);

/* Question 2 */
\echo [INFO] Insertion des tuples dans la table Pilote

INSERT INTO Pilote (plnum, plnom, plprenom, ville, salaire) VALUES (1,'Zighed','Djamel','Paris',21000);
INSERT INTO Pilote (plnum, plnom, plprenom, ville, salaire) VALUES (2,'Boussaid','Omar','Toulouse',21000);
INSERT INTO Pilote (plnum, plnom, plprenom, ville, salaire) VALUES (3,'Viallaneix','Jacques','Nice',18000);
INSERT INTO Pilote (plnum, plnom, plprenom, ville, salaire) VALUES (4,'Nicoloyannis','Nicolas','Paris',17000);
INSERT INTO Pilote (plnum, plnom, plprenom, ville, salaire) VALUES (5,'Darmont','Jerome','Toulouse',19000);
INSERT INTO Pilote (plnum, plnom, plprenom, ville, salaire) VALUES (6,'Lallich','Stephane','Paris',18000);
INSERT INTO Pilote (plnum, plnom, plprenom, ville, salaire) VALUES (7,'Rakotomalala','Ricco','Nice',17000);
INSERT INTO Pilote (plnum, plnom, plprenom, ville, salaire) VALUES (8,'Chauchat','Jean-Hughes','Lyon',15000);
INSERT INTO Pilote (plnum, plnom, plprenom, ville, salaire) VALUES (9,'Mahboubi','Hadj','Nice',18000);
INSERT INTO Pilote (plnum, plnom, plprenom, ville, salaire) VALUES (10,'Bntayeb','Fadila','Paris',20000);

/*OR

INSERT INTO pilote VALUES 
(1,'Zighed','Djamel','Paris',21000),
(2,'Boussaid','Omar','Toulouse',21000),
(3,'Viallaneix','Jacques','Nice',18000),
(4,'Nicoloyannis','Nicolas','Paris',17000),
(5,'Darmont','Jerome','Toulouse',19000),
(6,'Lallich','Stephane','Paris',18000),
(7,'Rakotomalala','Ricco','Nice',17000),
(8,'Chauchat','Jean-Hughes','Lyon',15000),
(9,'Mahboubi','Hadj','Nice',18000),
(10,'B ntayeb','Fadila','Paris',20000);
*/

\echo [INFO] Insertion des tuples dans la table Avion

INSERT INTO Avion (avnum, avnom, capacite, localisation) VALUES (1,'A300',300,'Nice');
INSERT INTO Avion (avnum, avnom, capacite, localisation) VALUES (2,'A310',300,'Nice');
INSERT INTO Avion (avnum, avnom, capacite, localisation) VALUES (3,'B707',250,'Paris');
INSERT INTO Avion (avnum, avnom, capacite, localisation) VALUES (4,'A300',280,'Lyon');
INSERT INTO Avion (avnum, avnom, capacite, localisation) VALUES (5,'Concorde',160,'Nice');
INSERT INTO Avion (avnum, avnom, capacite, localisation) VALUES (6,'B747',460,'Paris');
INSERT INTO Avion (avnum, avnom, capacite, localisation) VALUES (7,'B707',250,'Paris');
INSERT INTO Avion (avnum, avnom, capacite, localisation) VALUES (8,'A310',300,'Toulouse');
INSERT INTO Avion (avnum, avnom, capacite, localisation) VALUES (9,'Mercure',180,'Lyon');
INSERT INTO Avion (avnum, avnom, capacite, localisation) VALUES (10,'Concorde',160,'Paris');

/*OR

INSERT INTO Avion (avnum, avnom, capacite, localisation) VALUES 
(1,'A300',300,'Nice'),
(2,'A310',300,'Nice'),
(3,'B707',250,'Paris'),
(4,'A300',280,'Lyon'),
(5,'Concorde',160,'Nice'),
(6,'B747',460,'Paris'),
(7,'B707',250,'Paris'),
(8,'A310',300,'Toulouse'),
(9,'Mercure',180,'Lyon'),
(10,'Concorde',160,'Paris');
*/

/* Question 3 */
\echo [INFO] Creation de la table Vol
CREATE TABLE Vol 
(volnum int NOT NULL,
plnum int,
avnum int,
villedep VARCHAR(20) NOT NULL,
villearr VARCHAR(20) NOT NULL,
heuredep TIME,
heurearr TIME
); 
ALTER TABLE Vol ADD CONSTRAINT pk_vol PRIMARY KEY (volnum); 
ALTER TABLE Vol ADD CONSTRAINT Fk1_vol FOREIGN KEY (plnum) REFERENCES Pilote(plnum),
 ADD CONSTRAINT FK2_vol FOREIGN KEY(avnum) REFERENCES AVION(avnum);

/* Question 4 */

INSERT INTO Vol VALUES (1,1,1,'Nice','Toulouse','11:00:00','12:00:00');
INSERT INTO Vol VALUES(2,1,8,'Paris','Toulouse','17:00:00','18:00:00');
INSERT INTO Vol VALUES(3,2,1,'Toulouse','Lyon','14:00:00','16:00:00');
INSERT INTO Vol VALUES(4,5,3,'Toulouse','Lyon','18:00:00','20:00:00');
INSERT INTO Vol VALUES(5,9,1,'Paris','Nice','6:00:00','8:00:00');
INSERT INTO Vol VALUES(6,10,2,'Lyon','Nice','11:00:00','12:00:00');
INSERT INTO Vol VALUES(7,1,4,'Pa Is','Lyon','8:00:00','9:00:00');
INSERT INTO Vol VALUES(8,8,4,'Nice','Paris','7:00:00','8:00:00');
INSERT INTO Vol VALUES(9,1,8,'Nantes','Lyon','9:00:00','15:00:00');
INSERT INTO Vol VALUES(10,8,2,'Nice','Paris','12:00:00','13:00:00');
INSERT INTO Vol VALUES(11,9,2,'Paris','Lyon','15:00:00','16:00:00');
INSERT INTO Vol VALUES(12,1,2,'Lyon','Nantes','16:00:00','20:00:00');
INSERT INTO Vol VALUES(13,4,5,'Nice','Lens','11:00:00','14:00:00');
INSERT INTO Vol VALUES(14,3,5,'Lens','Paris','15:00:00','16:00:00');
INSERT INTO Vol VALUES(15,8,9,'Paris','Toulouse','17:00:00','18:00:00');
INSERT INTO Vol VALUES(16,7,5,'Paris','Toulouse','18:00:00','19:00:00');

/* Question 5 */

INSERT INTO Vol VALUES(17,5,8,'Bordeaux','Clermont-Fd','12:00:00','13:00:00');
/* La deuxième requête ne fonctionne pas car la clé 12 n'existe pas dans la table pilote */
INSERT INTO Vol VALUES(18,12,7,'Paris','Lille','11:00:00','12:00:00');

/* Question 6 */

ALTER TABLE Avion ALTER COLUMN capacite SET NOT NULL;
ALTER TABLE Avion ADD CONSTRAINT R1_verif CHECK (capacite > 150 and capacite < 480);
--ALTER TABLE Avion ADD CONSTRAINT R2_verif CHECK (capacite is not null and capacite between 150 and 480);

/* Question 7 */

UPDATE Vol SET villedep='Lille', heurearr='17:00:00' WHERE volnum=14;

/* Question 8 */

DELETE FROM Vol WHERE volnum=17;

/* Question 9 */

ALTER TABLE Pilote ADD COLUMN date_de_naissance date;
ALTER TABLE Pilote ADD constraint ck_birth check(date_de_naissance >= '01/01/1950' AND date_de_naissance <= '01/01/1980');
ALTER TABLE Pilote ADD constraint ck_birth check(Extract( YEAR from date_de_naissance) between 1950 AND 1980);
ALTER TABLE Pilote ADD constraint ck_birth2 check(date_part('year',date_de_naissance) between 1950 AND 1980);


/* Question 10 */



UPDATE Pilote SET date_de_naissance='07/10/1956' WHERE plnum=1;
UPDATE Pilote SET date_de_naissance='13/12/1956' WHERE plnum=2;
UPDATE Pilote SET date_de_naissance='07/10/1972' WHERE plnum=3;
UPDATE Pilote SET date_de_naissance='17/12/1972' WHERE plnum=4;
UPDATE Pilote SET date_de_naissance='01/07/1959' WHERE plnum=5;
UPDATE Pilote SET date_de_naissance='05/07/1976' WHERE plnum=6;
UPDATE Pilote SET date_de_naissance='23/10/1978' WHERE plnum=7;
UPDATE Pilote SET date_de_naissance='07/08/1979' WHERE plnum=8;
UPDATE Pilote SET date_de_naissance='09/09/1970' WHERE plnum=9;
UPDATE Pilote SET date_de_naissance='09/08/1956' WHERE plnum=10;

set datestyle to 'sql, DMY'; 
-- SET DATESTYLE='DMY';

/* Question 11 */

/* A - Nom des pilotes triés par salaire décroissant et par ordre alphabétique */

SELECT Pilote.plnom FROM Pilote ORDER BY salaire DESC, Plnom ASC;

    plnom     
--------------
 Zighed
 Boussaid
 B ntayeb
 Darmont
 Viallaneix
 Mahboubi
 Lallich
 Rakotomalala
 Nicoloyannis
 Chauchat
(10 lignes)


/* B - Salaire moyen des pilotes */

SELECT round(avg(salaire),2) As "Salaire moyen" FROM Pilote;

        avg         
--------------------
 18400.000000000000
(1 ligne)


/* C - Nom, prénom et salaire des pilotes dont le salaire est supérieur à 20 000€ */

SELECT plnom, plprenom, salaire FROM Pilote WHERE salaire > 20000;

  plnom   | plprenom | salaire 
----------+----------+---------
 Zighed   | Djamel   |   21000
 Boussaid | Omar     |   21000
(2 lignes)

/* D - Salaire moyen par ville */

SELECT round(avg(salaire),2) As Salaires_moyens, ville FROM Pilote GROUP BY ville;

 salaires_moyens |  ville   
-----------------+----------
        20000.00 | Toulouse
        15000.00 | Lyon
        19000.00 | Paris
        17666.67 | Nice
(4 lignes)

/* E - Nom des avions, triés par ordre alphabétique et sans doublon */

SELECT DISTINCT avnom FROM Avion ORDER BY avnom;

  avnom   
----------
 A300
 A310
 B707
 B747
 Concorde
 Mercure
(6 lignes)

/* F - Nombre d'avions localisés à Lyon */

--SELECT count(*) As "nombre d'avion à Lyon" FROM Avion WHERE UPPER(localisation) = UPPER('Lyon');
SELECT count(*) As "nombre d'avion à Lyon" FROM Avion WHERE lower(localisation) = 'lyon';
 count 
-------
     2
(1 ligne)


/* G - Nombre d'avions différents localisés à Lyon */

SELECT count(DISTINCT avnum) FROM Avion WHERE UPPER(localisation) = UPPER('Lyon');

 count 
-------
     2
(1 ligne)


/* H - Nom des pilotes nés la même année */

/*SELECT p1.plnom, extract( year from p1.date_de_naissance) as "Annee de naissance" 
FROM Pilote p1 WHERE Exists ( Select p2. plnom, p2.date_de_naissance from Pilote p2 
							where date_part('year',p2.date_de_naissance)=date_part('year',p1.date_de_naissance)
							and p1.plnum<>p2.plnum); */

SELECT DISTINCT p1.plnom, p2.plnom, extract( year from p1.date_de_naissance) as "Annee de naissance" 
FROM Pilote p1 , Pilote p2 
WHERE  date_part('year',p2.date_de_naissance)= date_part('year',p1.date_de_naissance)
and p1.plnum!=p2.plnum;

/* SELECT DISTINCT p1.plnom, extract( year from p1.date_de_naissance) as "Annee de naissance" 
FROM Pilote p1 , Pilote p2 
WHERE  date_part('year',p2.date_de_naissance)= date_part('year',p1.date_de_naissance)
and p1.plnum!=p2.plnum; */


 
 date_part |    plnom     
-----------+--------------
      1956 | Zighed
      1956 | Boussaid
      1972 | Viallaneix
      1972 | Nicoloyannis
      1956 | B ntayeb
(5 lignes)

/* I - Noms des pilotes nés le même mois et le même jour */

SELECT p1.plnom, p1.date_de_naissance  FROM Pilote p1 WHERE Exists ( Select p2. plnom from Pilote p2 where date_part('month',p2.date_de_naissance)=date_part('month',p1.date_de_naissance) and 
date_part('day',p2.date_de_naissance)=date_part('day',p1.date_de_naissance) and p1.plnum<>p2.plnum);

SELECT DISTINCT p1.plnom,date_part('day',p1.date_de_naissance) As jour,date_part('month',p1.date_de_naissance) As mois  FROM Pilote p1 , Pilote p2 
WHERE  date_part('day',p2.date_de_naissance)=date_part('day',p1.date_de_naissance)
and date_part('month',p2.date_de_naissance)=date_part('month',p1.date_de_naissance) 
and p1.plnum!=p2.plnum;

 

 date_part |    plnom     
-----------+--------------
      1956 | Zighed
      1956 | Boussaid
      1972 | Viallaneix
      1972 | Nicoloyannis
      1959 | Darmont
      1976 | Lallich
      1978 | Rakotomalala
      1979 | Chauchat
      1970 | Mahboubi
      1956 | B ntayeb
(10 lignes)

/* J - Le nom et âge des pilotes */

Select plnom,age(date_de_naissance) As Age from pilote;
Select plnom,date_part('year',age(date_de_naissance)) As Age from pilote;
Select plnom,extract(year from age(date_de_naissance)) As Age from pilote;

SELECT plnom, date_trunc('year',age(date_de_naissance)) AS age FROM Pilote;
SELECT plnom, date_trunc('month',age(date_de_naissance)) AS age FROM Pilote;

    plnom     |   age    
--------------+----------
 Zighed       | 56 years
 Boussaid     | 55 years
 Viallaneix   | 40 years
 Nicoloyannis | 39 years
 Darmont      | 53 years
 Lallich      | 36 years
 Rakotomalala | 34 years
 Chauchat     | 33 years
 Mahboubi     | 42 years
 B ntayeb     | 56 years
(10 lignes)

/* K - Somme des capacités de tous les avions */

SELECT SUM(capacite) FROM Avion;

 sum  
------
 2640

/* L - Durée moyenne des voyages */

SELECT avg(heurearr,heuredep) AS duree_moyenne FROM Vol;

 duree_moyenne 
---------------
 01:52:30
(1 ligne)

/* M - Le salaire moyen des pilotes par année de naissance */

SELECT date_part('year',date_de_naissance) As Annee, round(avg(salaire),2) AS "Moyenne salaires" 
FROM Pilote GROUP BY date_part('year',date_de_naissance)
Order By date_part('year',date_de_naissance);



SELECT date_part('year',date_de_naissance) As Annee, round(avg(salaire),2) AS "Moyenne salaires" 
FROM Pilote GROUP BY Annee 
Order By date_part('year',date_de_naissance);

 date_part |  round   
-----------+----------
      1970 | 18000.00
      1956 | 20666.67
      1979 | 15000.00
      1959 | 19000.00
      1978 | 17000.00
      1976 | 18000.00
      1972 | 17500.00
(7 lignes)

/* N - Capacité minimum et maximum des avions */

SELECT  localisation, min(capacite) AS capacite_min, max(capacite) AS capacite_max FROM Avion; 

SELECT  localisation, min(capacite) AS capacite_min, max(capacite) AS capacite_max FROM Avion 
group by localisation ; 
 capacite_min | capacite_max 
--------------+--------------
          160 |          460
(1 ligne)

/* O - Maximum des salaires moyens par ville */


SELECT round(avg(salaire),2) As SalaireMoyMax, ville FROM Pilote GROUP BY ville HAVING avg(salaire) >= all (SELECT avg(salaire) FROM Pilote GROUP BY ville);

        avg         |  ville   
--------------------+----------
 20000.00 | Toulouse
(1 ligne)

/* O bis - Salaire maximum par ville */

SELECT round(max(salaire),2) AS salaire_max, ville FROM Pilote GROUP BY ville;

 salaire_max |  ville   
-------------+----------
    21000.00 | Toulouse
    15000.00 | Lyon
    21000.00 | Paris
    18000.00 | Nice
(4 lignes)

/* O ter - Salaires moyens par ville */

SELECT round(avg(salaire),2) AS salaire_max, ville FROM Pilote GROUP BY ville;

 salaire_moy |  ville   
-------------+----------
    20000.00 | Toulouse
    15000.00 | Lyon
    19000.00 | Paris
    17666.67 | Nice
(4 lignes)
+

/* P - Ville dont le salaire moyen est le plus élevé */

SELECT round(avg(salaire),2), ville FROM Pilote GROUP BY ville HAVING avg(salaire)>= all (SELECT avg(salaire) FROM Pilote GROUP BY ville);

        avg         |  ville   
--------------------+----------
 20000.00 | Toulouse
(1 ligne)

/* Q - Villes accessibles (sans doublon) depuis une ville de départ dont le nom est Paris */

SELECT DISTINCT villearr AS Ville_de_depart FROM Vol WHERE UPPER(villedep) = UPPER('Paris');

 ville_de_depart 
-----------------
 Toulouse
 Nice
 Lyon
(3 lignes)

/* R -Caractéristiques (AVNUM, AVNOM, CAPACITE, LOCALISATION) des avions localisés dans la même ville qu'un pilote dont le nom est "Darmont" */
SELECT avion.* FROM avion, pilote where 
avion.localisation = pilote.ville and pilote.plnom = 'Darmont';



SELECT * FROM Avion WHERE localisation = (SELECT ville FROM Pilote WHERE UPPER(plnom) = UPPER('Darmont'));
SELECT * FROM Avion WHERE localisation in(SELECT ville FROM Pilote WHERE UPPER(plnom) = UPPER('Darmont'));

 avnum | avnom | capacite | localisation 
-------+-------+----------+--------------
     8 | A310  |      300 | Toulouse
(1 ligne)

/* S - Caractéristiques (VOLNUM, VILLEDEP, VILLEARR, HEUREDEP, HEUREARR, AVNOM, PLNOM) d'un vol dont le numéro est saisi au clavier (paramètre) */

SELECT volnum, villedep, villearr, heuredep, heurearr, avnom, plnom FROM Vol, Pilote, Avion WHERE Vol.plnum =  Pilote.plnum AND Vol.avnum = Avion.avnum AND volnum = 15;

 volnum | villedep | villearr | heuredep | heurearr |  avnom  |  plnom   
--------+----------+----------+----------+----------+---------+----------
     15 | Paris    | Toulouse | 17:00:00 | 18:00:00 | Mercure | Chauchat
(1 ligne)

/* T - Nom, prénom et numéro de vol des pilotes affectés à (au moins) un vol */

SELECT DISTINCT plnom, plprenom FROM Pilote, Vol WHERE Vol.plnum =  Pilote.plnum;

/* T bis - Nom, prénom et numéro de vol des pilotes qui ont effectué au moins trois vols */
Select p.plnom, p.plprenom, count(v.volnum) FROM Pilote p, Vol v  WHERE v.plnum =  p.plnum 
group by p.plnom, p.plprenom 
having count (v.volnum)>=3 ; 

    plnom     |  plprenom   | volnum 
--------------+-------------+--------
 Zighed       | Djamel      |      1
 Zighed       | Djamel      |      2
 Boussaid     | Omar        |      3
 Darmont      | Jerome      |      4
 Mahboubi     | Hadj        |      5
 B ntayeb     | Fadila      |      6
 Zighed       | Djamel      |      7
 Chauchat     | Jean-Hughes |      8
 Zighed       | Djamel      |      9
 Chauchat     | Jean-Hughes |     10
 Mahboubi     | Hadj        |     11
 Zighed       | Djamel      |     12
 Nicoloyannis | Nicolas     |     13
 Chauchat     | Jean-Hughes |     15
 Rakotomalala | Ricco       |     16
 Viallaneix   | Jacques     |     14
(16 lignes)

/* U - Numéro et nom des avions affectés à des vols (éliminer les doublons - utiliser au moins deux méthodes différentes) */

SELECT DISTINCT Avion.avnum, avnom FROM Avion, Vol WHERE Vol.avnum = Avion.avnum;

 avnum |  avnom   
-------+----------
     3 | B707
     4 | A300
     2 | A310
     1 | A300
     5 | Concorde
     9 | Mercure
     8 | A310
(7 lignes)

SELECT avnum,avnom FROM Avion WHERE avnum IN (SELECT avnum FROM Avion INTERSECT SELECT DISTINCT avnum FROM Vol); 

 avnum |  avnom   
-------+----------
     1 | A300
     2 | A310
     3 | B707
     4 | A300
     5 | Concorde
     8 | A310
     9 | Mercure
(7 lignes)

/* V - Nombre de vols par pilote (indiquer uniquement le numéro des pilotes) */

SELECT COUNT(*), plnum FROM vol GROUP BY plnum; 

 count | plnum 
-------+-------
     3 |     8
     1 |     4
     5 |     1
     1 |     5
     1 |     3
     1 |    10
     2 |     9
     1 |     2
     1 |     7
(9 lignes)

/* W - Nombre total d'heures de vol par pilote (préciser le nom des pilotes) */

SELECT SUM(heurearr-heuredep), plnom FROM vol v,pilote p WHERE v.plnum = p.plnum GROUP BY plnom;

   sum    |    plnom     
----------+--------------
 03:00:00 | Chauchat
 01:00:00 | B ntayeb
 03:00:00 | Mahboubi
 02:00:00 | Darmont
 13:00:00 | Zighed
 03:00:00 | Nicoloyannis
 01:00:00 | Rakotomalala
 02:00:00 | Viallaneix
 02:00:00 | Boussaid
(9 lignes)

/* X - Numéro et nom des avions qui ne sont affectés à aucun vol (utiliser au moins deux méthodes différentes) */

select a.avnum, a.avnom from avion a 
except 
select a1.avnum, a1.avnom from avion a1,vol v 
where v.avnum=a1.avnum; 

select a.avnum, a.avnom from avion a 
where not exists (select * from vol v where v.avnum=a.avnum); 

select a.avnum, a.avnom from avion a 
where a.avnum not in (select v.avnum from vol v); 

SELECT DISTINCT Avion.avnum, Avion.avnom,Vol.avnum,Vol.volnum    FROM Avion LEFT JOIN Vol ON Avion.avnum = Vol.avnum WHERE Vol.avnum IS NULL;

 avnum |  avnom   
-------+----------
    10 | Concorde
     6 | B747
     7 | B707
(3 lignes)



/* Y - Nom et prénom des pilotes qui ont volé sur tous les avions (utiliser deux méthodes différentes pour effectuer cette division) */
/* Stratégie 1 - Rechercher les pilotes tels qu'il n'existe pas d'avion tel qu'il n'existe pas de vol pour ce pilote et cet avion. */
/* Stratégie 2 - Rechercher les pilotes qui ont volé sur un nombre d'avions supérieur ou égal au nombre total d'avions dans la base de données */

SELECT Pilote.plnom, Pilote.plprenom FROM Pilote WHERE NOT EXISTS(SELECT * FROM Avion 
WHERE  NOT EXISTS(SELECT * FROM  Vol WHERE Avion.avnum = Vol.avnum)); 

 plnom | plprenom 
-------+----------
(0 ligne)

SELECT Pilote.plnom, Pilote.plprenom FROM Pilote 
WHERE (SELECT COUNT(*) FROM Avion) <= (SELECT COUNT(DISTINCT Vol.avnum) FROM Vol WHERE Vol.plnum = Pilote.plnum); 

 plnom | plprenom 
-------+----------
(0 ligne)
