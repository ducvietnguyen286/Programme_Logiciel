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
est-pere(jean,paul).
est-pere(jean,alain).
est-pere(pierre,jean).
est-pere(leon,lucie).
est-pere(paul,luc).
est-pere(pierre,jacques).
est-mere(claire,lucie).
est-mere(veronique,jean).
est-mere(veronique,jacques).
est-mere(lucie,paul).
est-mere(lucie,alain).
est-mere(martine,luc).

% 2 questions
/*
masculin(jean).
feminin(claire).
feminin(X).
masculin(X).
est-mere(lucie,alain).
est-mere(lucie,benoit).
est-mere(X,jean).
est-pere(jean,X).
est-pere(X,_).
*/

/* 3. Définition de prédicats*/

est-parent(X,Y) :- est-pere(X,Y).
est-parent(X,Y) :- est-mere(X,Y).

est-enfant(X,Y) :- est-parent(Y,X).

est-femme(X,Y) :- est-pere(Y,Z), est-mere(X,Z).
est-mari(X,Y) :- est-mere(Y,Z), est-pere(X,Z).
est-grand-pere(X,Y) :- est-parent(Z,Y), est-pere(X,Z).
est-grand-mere(X,Y) :- est-parent(Z,Y), est-mere(X,Z).

est-grand-parent(X,Y) :- est-parent(Z,Y), est-pere(X,Z).
est-frere(X,Y) :- masculin(X), est-parent(Z,X), est-parent(Z,Y).
est-soeur(X,Y) :- feminin(X), est-parent(Z,X), est-parent(Z,Y).
est-frereSoeur(X,Y) :- est-frere(X,Y).
est-frereSoeur(X,Y) :- est-soeur(X,Y).
est-petit-enfant(X,Y) :- est-grand-parent(Y,X).
est-petit-fils(X,Y) :- est-grand-parent(Y,X), masculin(X).
est-petite-fille(X,Y) :- est-grand-parent(Y,X), feminin(X).
est-oncle(X,Y) :- est-frere(X,Z), est-parent(Z,Y).
est-tante(X,Y) :- est-soeur(X,Z), est-parent(Z,Y).

est-demi-frere(X,Y) :- masculin(X), est-pere(Z,X), est-pere(Z,Y), est-mere(M1,X), est-mere(M2,Y), M1\==M2.
est-demi-frere(X,Y) :- masculin(X), est-mere(Z,X), est-mere(Z,Y), est-pere(P1,X), est-pere(P2,Y), P1\==P2.

est-demi-soeur(X,Y) :- feminin(X), est-pere(Z,X), est-pere(Z,Y), est-mere(M1,X), est-mere(M2,Y), M1\==M2.
est-demi-soeur(X,Y) :- feminin(X), est-mere(Z,X), est-mere(Z,Y), est-pere(P1,X), est-pere(P2,X), P1\==P2.

beau-frere(X,Y) :- est-femme(Z,Y), est-frere(X,Z).
beau-frere(X,Y) :- est-mari(Z,Y), est-frere(X,Z).
beau-frere(X,Y) :- est-soeur(Z,Y), est-mari(X,Z).

belle-soeur(X,Y) :- est-femme(Z,Y), est-soeur(X,Z).
belle-soeur(X,Y) :- est-mari(Z,Y), est-soeur(X,Z).
belle-soeur(X,Y) :- est-frere(Z,Y), est-femme(X,Z).

*4 Traduction d'�nonc�s*/

aime(marie,vin).
voleur(pierre).
aime(pierre,X) :- aime(X,vin).
vole(X,Y) :- voleur(X),aime(X,Y).




































