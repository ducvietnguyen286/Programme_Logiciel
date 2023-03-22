/*1er programme : bio*/
/*
bio(louis13,h,1601,1643,henri4,marie_medicis).
bio(elisabeth_france,f,1603,1644,henri4,marie_medicis).
bio(louis14,h,1638,1715,louis13,anne_autriche).
pere(X,Y) :- bio(Y,_,_,_,X,_).
age(X,Y) :- bio(X,_,T,Z,_,_), Y is Z-T.
*/
/* declarations*/

/*Les personnes de sexe masculin*/
masculin(jean).
masculin(paul).
masculin(alain).
masculin(pierre).
masculin(leon).
masculin(luc).
masculin(jacques).

% les personnes de sexe feminin
feminin(lucie).
feminin(claire).
feminin(andree).
feminin(martine).

% description des liens de parentes
est_pere(jean,paul).
est_pere(jean,alain).
est_pere(pierre,jean).
est_pere(leon,lucie).
est_pere(paul,luc).
est_pere(pierre,jacques).
est_mere(claire,lucie).
est_mere(veronique,jean).
est_mere(veronique,jacques).
est_mere(lucie,paul).
est_mere(lucie,alain).
est_mere(martine,luc).

% 2 questions
/*
masculin(jean).
feminin(claire).
feminin(X).
masculin(X).
est_mere(lucie,alain).
est_mere(lucie,benoit).
est_mere(X,jean).
est_pere(jean,X).
est_pere(X,_).
*/

/* 3. DÃ©finition de prÃ©dicats*/

est_parent(X,Y) :- est_pere(X,Y).
est_parent(X,Y) :- est_mere(X,Y).

est_enfant(X,Y) :- est_parent(Y,X).

est_femme(X,Y) :- est_pere(Y,Z), est_mere(X,Z).
est_mari(X,Y) :- est_mere(Y,Z), est_pere(X,Z).
est_grand_pere(X,Y) :- est_parent(Z,Y), est_pere(X,Z).
est_grand_mere(X,Y) :- est_parent(Z,Y), est_mere(X,Z).

est_grand_parent(X,Y) :- est_parent(Z,Y), est_pere(X,Z).
est_frere(X,Y) :- masculin(X), est_parent(Z,X), est_parent(Z,Y).
est_soeur(X,Y) :- feminin(X), est_parent(Z,X), est_parent(Z,Y).
est_frereSoeur(X,Y) :- est_frere(X,Y).
est_frereSoeur(X,Y) :- est_soeur(X,Y).
est_petit_enfant(X,Y) :- est_grand_parent(Y,X).
est_petit_fils(X,Y) :- est_grand_parent(Y,X), masculin(X).
est_petite_fille(X,Y) :- est_grand_parent(Y,X), feminin(X).
est_oncle(X,Y) :- est_frere(X,Z), est_parent(Z,Y).
est_tante(X,Y) :- est_soeur(X,Z), est_parent(Z,Y).

est_demi_frere(X,Y) :- masculin(X), est_pere(Z,X), est_pere(Z,Y), est_mere(M1,X), est_mere(M2,Y), M1\==M2.
est_demi_frere(X,Y) :- masculin(X), est_mere(Z,X), est_mere(Z,Y), est_pere(P1,X), est_pere(P2,Y), P1\==P2.

est_demi_soeur(X,Y) :- feminin(X), est_pere(Z,X), est_pere(Z,Y), est_mere(M1,X), est_mere(M2,Y), M1\==M2.
est_demi_soeur(X,Y) :- feminin(X), est_mere(Z,X), est_mere(Z,Y), est_pere(P1,X), est_pere(P2,X), P1\==P2.

beau_frere(X,Y) :- est_femme(Z,Y), est_frere(X,Z).
beau_frere(X,Y) :- est_mari(Z,Y), est_frere(X,Z).
beau_frere(X,Y) :- est_soeur(Z,Y), est_mari(X,Z).

belle_soeur(X,Y) :- est_femme(Z,Y), est_soeur(X,Z).
belle_soeur(X,Y) :- est_mari(Z,Y), est_soeur(X,Z).
belle_soeur(X,Y) :- est_frere(Z,Y), est_femme(X,Z).

/*4 Traduction d'énoncés*/
aime(pierre,X) :- aime(X,vin).


aime(marie,vin).
/*aime(pierre,vin).*/
voleur(pierre).
vole(X,Y) :- voleur(X),aime(X,Y).




































