/*vendredi 30 decembre 2022
  Auteur: samsepiol
  se connecter a mysql : mysql -u nomutilisateur -p
  lancer le script : source chemin/vers/script.sql */



/*creation de la base de donnee*/
create database if not exists assurance_egalite;

/*connexion a la base de donnee nouvellement cree*/
use assurance_egalite;

/*creation de la table Membre*/
create table if not exists Membres
(id_membre integer,
Nom char(100) not null,
Prenom char(100),
Sexe char(1),
Telephone char(10),
Quartier char(100),
Ville char(100),
Date_inscription date,
primary key(id_membre));

/*creation de la table Emprunt*/
create table if not exists Emprunt
(id_emprunt integer,
Membre integer,
Date_emprunt date not null,
Date_retour date not null,
Taux float not null,
Etat boolean default false,
primary key(id_emprunt),
foreign key(Membre) references Membres(id_membre));

/*craetion de la table Versement*/
create table if not exists Versement
(id_versement integer,
Membre integer,
Secours float,
Mariage float,
Epargne float,
Ration float,
Pagne float,
Date_versement date,
primary key(id_versement),
foreign key(Membre) references Membres(id_membre));
