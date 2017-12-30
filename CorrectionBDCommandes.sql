-- -----------------------------------------------------------------------------
--             Génération d'une base de données pour
--                           PostgreSQL
--                        (17/11/2011 6:35:50)
-- -----------------------------------------------------------------------------
--      Nom de la base : commandes
--      Auteur : Elyes Lamine
--      Date de dernière modification : 17/10/2013 6:35:30
-- -----------------------------------------------------------------------------
-- Ce fichier contient le script destiné à créer la base de données "commandes".
-- Ce script doit être exécuté en tant qu'utilisateur "postgres".

\echo [INFO] Debut du script
\c postgres
\echo [INFO] Suppression de la base de donn?es
DROP DATABASE commandes;

\echo [INFO] Creation de la base de donnees
CREATE DATABASE commandes ENCODING 'UTF8';

\echo [INFO] Connexion a la nouvelle base de donnees
\c commandes


\echo [INFO] Creation de la table client
DROP TABLE IF EXISTS client; 
create table Client 
(numcli int not null,
	nom varchar(20),
	prenom varchar(20),
	datenaiss date,
	rue varchar(30),
	cp int,
	ville varchar(30),
	constraint cle_client primary key (numcli)
);

\echo [INFO] Creation de la table fournisseur
DROP TABLE IF EXISTS fournisseur; 
create table fournisseur (
	numfour int not null,
	raisonsoc varchar(40),
	constraint cle_four primary key (numfour)
);

DROP TABLE IF EXISTS Produit; 
create table Produit (
	numprod int not null,
	desi varchar(40),
	prixuni decimal(6,2),
	numfour int not null constraint fk_numfour references fournisseur (numfour), 
	constraint cle_prod primary key (numprod)
);

create table commande (
	numcli int not null constraint fk_ncli references Client (numcli),
	numprod int not null constraint fk_nprod references Produit (numprod),
	quantite int,
	datec date,
	constraint cle_commande primary key (numcli,numprod)
); 


insert into Client values(1,'Dupont','Albert','1970-06-01','Rue de Crimee',69001,'Lyon');
insert into Client values(2,'West','james','1963-09-03','Studio',0,'Hollywood');
insert into Client values(3,'Martin','Marie','1978-06-05','Rue des Acacias',69130,'Ecully');
insert into Client values(4,'Durand','Gaston','1980-11-15','Rue de la Meuse',69008,'Lyon');
insert into Client values(5,'Titgoutte','Justine','1975-02-28','Chemin du Chateau',69630,'Chaponost');
insert into Client values(6,'Dupond','Noemie','1957-09-18','Rue de Dele',69007,'Lyon');

insert into fournisseur values(11,'Top Jouet');
insert into fournisseur values(12,'Mega fringue');
insert into fournisseur values(13,'Madame Meuble');
insert into fournisseur values(14,'Tout le Sport');

insert into Produit values(101,'Soldat qui tire',50.00,11);
insert into Produit values(102,'Cochon qui rit',50.00,11);
insert into Produit values(103,'poupee qui pleure',100,11);
insert into Produit values(104,'jean',250.00,12);
insert into Produit values(105,'Blouson',350.00,12);
insert into Produit values(106,'Chaussures',200.00,12);
insert into Produit values(107,'T-shirt',100.00,12);
insert into Produit values(108,'Table',500.00,13);
insert into Produit values(109,'Chaise',100.00,13);
insert into Produit values(110,'Armoire',1000,13);
insert into Produit values(111,'Lit',5000.00,13);
insert into Produit values(112,'Raquette de tennis',300.00,14);
insert into Produit values(113,'VTT',699.00,14);
insert into Produit values(114,'Ballon',75.00,14);

insert into commande values(1,110,1,'1999-09-24');
insert into commande values(1,108,1,'1999-09-24');
insert into commande values(1,109,4,'1999-09-24');
insert into commande values(3,101,2,'1999-09-24');
insert into commande values(3,102,1,'1999-09-24');
insert into commande values(4,104,3,'1999-09-24');
insert into commande values(4,105,1,'1999-09-24');
insert into commande values(4,106,2,'1999-09-24');
insert into commande values(4,107,5,'1999-09-24');
insert into commande values(5,114,10,'1999-09-24');
insert into commande values(6,102,2,'1999-09-24');
insert into commande values(6,103,5,'1999-09-24');
insert into commande (numcli,numprod,datec) values(6,114,'1999-09-24');


-- Pour que l'insertion des dates se fasse sans problème, elles doivent avoir le format jour-mois-année:
SET DATESTYLE to 'SQL, DMY'; 
-- SET DATESTYLE to 'ISO, DMY'; 

/* Manipulation de la base de données */
/* Question 1 */
SELECT * FROM Client;

/* Question 2*/
SELECT * FROM Client ORDER BY ville DESC, nom ASC;

/* Question 3 */
SELECT desi, round(prixuni/6 ,4) as "pris en euro" FROM Produit;

/* Question 4 */
SELECT nom, prenom FROM Client;

/* Question 5 */
SELECT nom, prenom FROM Client WHERE Ville='Lyon';

/* Question 6 */
SELECT numcli, numprod, quantite, datec FROM commande WHERE quantite>=3;

/*Question 7*/
SELECT desi FROM produit WHERE prixuni>= 50 and prixuni<=100;
SELECT desi FROM produit WHERE prixuni BETWEEN 50 AND 100;

/*Question 8*/
SELECT numcli, numprod, quantite, datec FROM commande WHERE quantite is null;

/*Question 9*/
SELECT nom, ville FROM client WHERE ville LIKE '%ll%';

/*Question 10*/
SELECT prenom FROM client WHERE nom='Dupont' OR nom='Durand' OR nom='Martin';
SELECT prenom FROM client WHERE nom IN ('Dupont','Durand','Martin');

/*Question 11*/
SELECT AVG(prixuni) FROM produit AS "Moyenne prix produits";

/*Question 12*/
SELECT COUNT(*) FROM commande AS "Nombre de commandes";

/*Question 13*/
SELECT client.nom, commande.datec, commande.quantite FROM client, commande WHERE client.numcli=commande.numcli;
SELECT nom, datec, quantite FROM client INNER JOIN commande USING (numcli);
SELECT nom, datec, quantite FROM client INNER JOIN commande ON client.numcli=commande.numcli;
SELECT nom, datec, quantite FROM client NATURAL INNER JOIN commande;

/*Question 14*/
SELECT numcli, nom, datec, quantite FROM client NATURAL INNER JOIN commande;

/*Question 15*/
SELECT DISTINCT nom FROM client NATURAL INNER JOIN commande WHERE quantite=1;
SELECT DISTINCT C.nom FROM client C, commande Com WHERE client.numcli=Com.numcli And Com.quantite =1; 

/*Question 16*/
SELECT numcli, sum(quantite) FROM commande GROUP BY numcli ORDER BY numcli ASC;

/*Question 17*/
SELECT numprod, avg(quantite) FROM commande GROUP BY numprod HAVING count(*)>1 ORDER BY numprod ASC;

/*Question 18*/
/*Donner le numéro du produit le moins cher*/
SELECT numprod FROM produit WHERE prixuni<=ALL(SELECT prixuni FROM produit);
SELECT numprod FROM produit WHERE prixuni<=(SELECT MIN(prixuni) FROM produit);

/*Question 19*/
/*Ajouter un nouveau fournisseur numero 15, raison sociale supergame*/
INSERT INTO fournisseur (numfour,raisonsoc) VALUES ('15','Supergame');

/*question 20*/
/*faire une remise de 20% sur tout les produit > 600 francs*/
SELECT numprod,round(prixuni-((prixuni*20)/100),2) FROM produit WHERE prixuni>600;
UPDATE produit SET prixuni=round(prixuni-((prixuni*20)/100),2) WHERE prixuni>600;

/*Question 21*/
/*Supprimer les produits compris entre 25 et 80 francs*/
/*VOIR TD SUIVANT*/
DELETE FROM produit WHERE prixuni BETWEEN 25 AND 80;

/*Question 22*/
/*Inserer deux nouveaux produits 115, 116 / description WII, Playstation/ fournisseur 15 / prixuni 149,600*/
INSERT INTO produit (numprod,desi,prixuni,numfour) VALUES (115,'WII',149.00,15),(116,'Playstation',600.00,15);

/*question 23*/
/*Nom des clients avec le montant total dépensé*/
SELECT client.nom, sum(produit.prixuni * commande.quantite) FROM commande,produit,client 
WHERE client.numcli=commande.numcli AND commande.numprod=produit.numprod 
GROUP BY client.nom;
 

/*Question 24*/
/*Meilleur client*/
SELECT client.nom 
FROM client, produit, commande 
WHERE commande.numcli= client.numcli AND produit.numprod=commande.numprod 
GROUP BY client.nom
HAVING SUM(prixuni*quantite) >= ALL(
									SELECT SUM(prixuni*quantite) 
									FROM client, produit, commande 
									WHERE client.numcli=commande.numcli and produit.numprod=commande.numprod 
									GROUP BY client.numcli);

