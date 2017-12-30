/*1 création des tableax pilote et avion*/
/*
create table pilote 
(plnum int not null,
	plnom varchar(20),
	plprenom varchar(20),	
	ville varchar(30),
	salaire int,
	constraint cle_pilote primary key (plnum)
);

create table avion
(avnum int not null,
	avnom varchar(20),
	capacite int,
	localisation varchar(30),
	constraint cle_avion primary key (avnum)
);
*/


/*2 remplir les tables pilote et avion*/
/*
insert into pilote values(1,'Zighed','Djamel','Paris',21000);
insert into pilote values(2,'Boussaid','Omar','Toulouse',21000);
insert into pilote values(3,'Viallaneix','Jacques','Nice',18000);
insert into pilote values(4,'Nicoloyannis','Nicolas','Paris',17000);
insert into pilote values(5,'Darmont','Jerome','Toulouse',19000);
insert into pilote values(6,'Lallich','Stephane','Paris',18000);
insert into pilote values(7,'Rakotomalala','Ricco','Nice',17000);
insert into pilote values(8,'Chauchat','Jean-Hughes','Lyon',15000);
insert into pilote values(9,'Mahboubi','Hadj','Nice',18000);
insert into pilote values(10,'B ntayeb','Fadila','Paris',20000);
*/
/*
insert into avion values(1,'A300',300,'Nice');
insert into avion values(2,'A310',300,'Nice');
insert into avion values(3,'B707',250,'Paris');
insert into avion values(4,'A300',280,'Lyon');
insert into avion values(5,'Concorde',160,'Nice');
insert into avion values(6,'B747',460,'Paris');
insert into avion values(7,'B707',250,'Paris');
insert into avion values(8,'A310',300,'Toulouse');
insert into avion values(9,'Mercure',180,'Lyon');
insert into avion values(10,'Concorde',160,'Paris');
*/


/*3 - création du tableau vol*/
/*
create table vol
(volnum int not null,
	plnum int,
	avnum int,
	villedep varchar(20),
	villearr varchar(20),
	heuredep int,
	heurearr int,
	
	constraint cle_vol primary key (volnum),
	foreign key (plnum) references pilote(plnum),
	foreign key (avnum) references avion(avnum)
);
*/

/*
create table vol
(volnum int not null,
	plnum int,
	avnum int,
	villedep varchar(20),
	villearr varchar(20),
	heuredep int,
	heurearr int,
	constraint cle_vol primary key (volnum)
	
);

ALTER TABLE vol
ADD FOREIGN KEY (plnum)
REFERENCES pilote(plnum);

ALTER TABLE vol
ADD FOREIGN KEY (avnum)
REFERENCES avion(avnum);
*/

/*4 remplir le tableau vol*/
/*
insert into vol values(1,1,1,'Nice','Toulouse',11,12);
insert into vol values(2,1,8,'Paris','Toulouse',17,18);
insert into vol values(3,2,1,'Toulouse','Lyon',14,16);
insert into vol values(4,5,3,'Toulouse','Lyon',18,20);
insert into vol values(5,9,1,'Paris','Nice',6,8);
insert into vol values(6,10,2,'Lyon','Nice',11,12);
insert into vol values(7,1,4,'Paris','Lyon',8,9);
insert into vol values(8,8,4,'Nice','Paris',7,8);
insert into vol values(9,1,8,'Nantes','Lyon',9,15);
insert into vol values(10,8,2,'Nice','Paris',12,13);
insert into vol values(11,9,2,'Paris','Lyon',15,16);
insert into vol values(12,1,2,'Lyon','Nantes',16,20);
insert into vol values(13,4,5,'Nice','Lens',11,14);
insert into vol values(14,3,5,'Lens','Paris',15,16);
insert into vol values(15,8,9,'Paris','Toulouse',17,18);
insert into vol values(16,7,5,'Paris','Toulouse',18,19);
*/

/*5 ajouter les enregistrements suivants dans le tableau vol Remarque*/
/*
insert into vol values(17,5,8,'Bordeaux','clemont-Fd',12,13);
insert into vol values(18,12,7,'Paris','Lille',11,12);
*/
/*Remarque : 
le première enregistrement peut être ajouté dans le tableau mais le deuxième non, car le clé "12" de plnum n'existe pas dans le tableau pilote, on a que 10 lignes dans le tableau pilote pour l'instant
*/

/*6 modifier tableau avion pour que capacite entre 150 et 480*/
/*
alter table avion
add check (capacite between 150 and 480);
*/

/*7 modifier ligne 14 dans tableau vol*/
/*
update vol
set villedep = 'Lille', heurearr = 17
where volnum = 14;
*/
