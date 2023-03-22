/* exo 1*/
duree(1).
duree(2).

transport(rome, 350).
transport(londre, 300).
transport(tunis, 450).

prixSemaine(rome, hotel, 1800 ).
prixSemaine(rome, chambreHabitant, 1300 ).
prixSemaine(rome, camping,880 ).
prixSemaine(londre, hotel,1500 ).
prixSemaine(londre, chambreHabitant,1200 ).
prixSemaine(londre, camping, 500).
prixSemaine(tunis, hotel, 1000).
prixSemaine(tunis, chambreHabitant,500 ).
prixSemaine(tunis, camping, 300).

voyage(V,D,H,S):- transport(V,P1), prixSemaine(V,H,P2), duree(D), S is (P1 + P2*D).
voyage_economique(V,D,H,S,SMAX) :- voyage(V,D,H,S), S < SMAX.

/* exo 2*/

homme(benoit, grande, blonds, jeune).
homme(viet,moyenne,chatains,vieux).
homme(arthur,petite,bruns,mur).
homme(maxime,petite,roux,jeune).

femme(victorine, petite, blonds, mur).
femme(laurine, grande, bruns,jeune).
femme(channel, moyenne, chatains, mur).
femme(marine, moyenne,roux,vieux).

gout(N,M,L,S)
gout(benoit, pop, policier,tennis).
gout(viet, jazz, aventure, jogging).
gout(arthur,classique, science-fiction, natation).
gout(maxime, jazz,science-fiction,tennis).

gout(victorine, pop, policier,tennis).
gout(laurine, jazz, aventure, jogging).
gout(laurine,classique, science-fiction, natation).
gout(marine, jazz,science-fiction,tennis).

recherche(viet, grande, bruns, jeune).
recherche(victorine, petit, chatains, vieux).
recherche(maxime,moyenne,roux,vieux).
recherche(channel, grande,blonds,jeune).

convientPhysiquement(X,Y) :-  homme(X,T1,C1,A1),femme(Y,_,_,_), recherche(Y,T1,C1,A1).
convientPhysiquement(X,Y) :- femme(X,T1,C1,A1)