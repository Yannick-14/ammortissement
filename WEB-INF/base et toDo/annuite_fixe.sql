create database amortissement;
\c amortissement;

create table personne
(
    idOlona serial,
    anarana varchar(100)
);

create table utilisateur_banque
(
    idPersonne serial,
    personne decimal(10,2),
    typeMethode decimal(10,2),
    typemode decimal(10,2),
    periode decimal(10,2),
    nonRetour decimal(10,2),
    gain decimal(10,2),
    taux decimal(10,2)
);

create table emprunt
(
    idEmprunt serial primary key,
    personne decimal(10,2),
    periode decimal(10,2),
    capital decimal(10,2),
    interet decimal(10,2),
    amortissement decimal(10,2),
    annuite decimal(10,2),
    valeur_nette decimal(10,2)
);