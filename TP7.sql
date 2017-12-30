create table personnel(
	nom varchar(20) not null,
	role varchar(20),
	constraint cle_personnel primary key (nom) 	
);

create table numero(
	titre varchar(30) not null,
	nature varchar(20),
	responsable varchar(20),
	constraint cle_numero primary key (titre),
	foreign key(responsable) references personnel(nom) 
);

create table accessoire(
	nom varchar(30) not null,
	couleur varchar(10),
	volume numeric(5,2),
	rateller int,
	camion int,
	constraint cle_accessoire primary key (nom)
);

create table utilisation(
	titre varchar(30) not null,
	utilisateur varchar(20) not null,
	accessoire varchar(30) not null,
	constraint cle_utilisation primary key(titre,utilisateur,accessoire),
	foreign key(titre) references numero(titre),
	foreign key(utilisateur) references personnel(nom),
	foreign key(accessoire) references accessoire(nom)
);

\c - marven08
grant Marven08 to Antony08;
\c - antony08
alter database Cirque owner to Marven08;

insert into personnel values ('Clovis','Jongleur');
insert into personnel values ('Reine de May','Ecuyer');
insert into personnel values ('Louche','Clown');
insert into personnel values ('Attention','Equilibriste');
insert into personnel values ('Partition','Musicien');
insert into personnel values ('Crinière','Dompteur');
insert into personnel values ('Jerry','Clown');
insert into personnel values ('Bal','Jongleur');
insert into personnel values ('Final','Musicien');
insert into personnel values ('Louis','Jongleur');
insert into personnel values ('Léo','Jongleur');
insert into personnel values ('Lulu','Ecuyer');
insert into personnel values ('Coloquinte','Equilibriste');
insert into personnel values ('Grostas','Jongleur');
insert into personnel values ('Sangtrèspur','Dompteur');

insert into numero values('Les Zoupalas','Jonglerie','Clovis');
insert into numero values('Le coche infernal','Equitation','Reine de May');
insert into numero values('Les fauves','Clownerie','Louche');
insert into numero values('Les Smilers','Equilibre','Attention');
insert into numero values('La passoire magique','Lion','Crinière');
insert into numero values('Les Zozos','Clownerie','Jerry');
insert into numero values('Les Tartarins','Jonglerie','Bal');

insert into accessoire values('Ballon','Rouge',0.3,15,5);
insert into accessoire values('Barre','Blanc',0.6,19,5);
insert into accessoire values('Fouet','Marron',0.6,11,3);
insert into accessoire values('Bicyclette à éléphant','Vert',0.4,27,8);
insert into accessoire values('Trompette','Rouge',0.2,2,1);
insert into accessoire values('Cercle magique','Orange',0.2,1,1);
insert into accessoire values('Boule','Cristal',0.2,88,8);
insert into accessoire values('Cage à lions','Noir',10.0,0,2);
insert into accessoire values('Chaise longue de lion','Bleu',0.9,11,5);
insert into accessoire values('Peigne de chimpanzé','Jaune',0.2,23,3);
insert into accessoire values('Etrier',null,null,null,null);

insert into utilisation values('Les Zoupalas','Louis','Ballon');
insert into utilisation values('Les Zoupalas','Léo','Ballon');
insert into utilisation values('Les Zoupalas','Louis','Barre');
insert into utilisation values('Le coche infernal','Grostas','Bicyclette à éléphant');
insert into utilisation values('Le coche infernal','Lulu','Fouet');
insert into utilisation values('Les fauves','Jerry','Trompette');
insert into utilisation values('Les Smilers','Attention','Cercle magique');
insert into utilisation values('Les Smilers','Attention','Boule');
insert into utilisation values('Les Smilers','Coloquinte','Bicyclette à éléphant');
insert into utilisation values('La passoire magique','Crinière','Cage à lions');
insert into utilisation values('La passoire magique','Crinière','Chaise longue de lion');
insert into utilisation values('Les Zozos','Jerry','Bicyclette à éléphant');
insert into utilisation values('Les Zozos','Jerry','Peigne de chimpanzé');
insert into utilisation values('Les Tartarins','Grostas','Bicyclette à éléphant');
insert into utilisation values('Le coche infernal','Sangtrèspur','Etrier');

\c - fabrice08
create view Res_Numero
as select titre, responsable
from numero;

--en tant qu'être propriétaire de la table, donner le droit
grant select,insert,update,delete on numero to Fabrice08;

do instead
update Res_Numero 
set responsable = 'Léo'
where titre = 'Les Zoupalas';

