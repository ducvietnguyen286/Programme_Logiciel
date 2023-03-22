
%____________________________%
%__Projet Program Logique____%
%__Duc Viet NGUYEN___________%
%__Master 2 - 2021-2022______%
%____________________________%


% support predicat-------------------------------------------------------------------------------------------------------------------
% Reverse List
reverseList([],[]):-!.
reverseList([X|L1],L2):-
	reverseList(L1,L3),
	append(L3,[X],L2).

%upprimer l'atome s'il existe dans liste par X
deleteX(_,[],[]):-!.
deleteX(X,[[X1|_]|L1],L2):-
	X1 =:= X,
	deleteX(X,L1,L2),!.
deleteX(X,[[X1|Y]|L1],[[X1|Y]|L2]):-
	deleteX(X,L1,L2).

%supprimer l'atome s'il existe dans liste par Y
deleteY(_,[],[]):-!.
deleteY(Y,[[_,Y1]|L1],L2):-
	Y1 =:= Y,
	deleteY(Y,L1,L2),!.
deleteY(Y,[[X,Y1]|L1],[[X,Y1]|L2]):-
	deleteY(Y,L1,L2).

% Le tri décroissant des atomes de la liste
triBulle(L, T) :-
	echange(L, L1),!,
	triBulle(L1, T).
triBulle(T,T).

/*Example: 
?- triBulle([[2,1],[3,5],[4,6],[3,6],[2,1],[4,7],[2,-1]], T).
T = [[4, 7], [4, 6], [3, 6], [3, 5], [2, 1], [2, 1], [2, -1]].
*/

% Echanger 2 atomes
echange([[X1,Y1],[X2,Y2]|R], [[X2,Y2],[X1,Y1]|R]) :-
	Y1<Y2.
echange([[X,Z]|R], [[X,Z]|R1]) :-
	echange(R,R1).

%--------------------------------------------------------PREMIERE PARTIE------------------------------------------------------------

ecrireForm([]):-!.
ecrireForm([X,Y]):-
	Y =:= 0,
	write(X),!.
	
ecrireForm([X,Y]):-
	Y =:= 1,
	X =:= 1,
	write('x'),!.	
ecrireForm([X,Y]):-
	Y =:= 1,
	X =:= (-1),
	write('- x'),!.
ecrireForm([X,Y]):-
	Y =:= 1,
	write(X),
	write('x'),!.
	
ecrireForm([X,Y]):-
	X =:= 1,
	write('x^'),
	write(Y),!.

ecrireForm([X,Y]):-
	X =:= (-1),
	write('-x^'),
	write(Y),!.

ecrireForm([X,Y]):-
	write(X),
	write('x^'),
	write(Y).

%Write symbol plus
ecrirePlus([]).
ecrirePlus([[X,_]|_]):-
	X>0,
	write(' + ').
ecrirePlus(_):-
	write(' ').


afficherInv([]).
afficherInv([[X|Y]|L]):-
	ecrireForm([X|Y]),
	ecrirePlus(L),
	afficherInv(L).

%--afficher un polynome(BONUS)------------------------------------------
/*Affiche les polynômes triés avec décroissant de l'exposant de "x" et retire les mononômes dits à coefficients.*/

/* j'effectue un tri décroissant des atomes de la liste pour afficher le monôme avoir l'exposant le plus élevé au exposant le plus petit. 
Ensuite, je simplifie ce monôme. Après, je supprimer tous les monômes à coefficient nul dans la liste .
J’utilise prédicat ecrireForm([X,Y]) pour afficher chaque monôme. J’utilise prédicat ecrirePlus(L) pour décider afficher symbole "+" ou pas.*/

afficher(L):-
	triBulle(L, L1),
	simplifier(L1,L3),
	deleteX(0,L3,L2),
	afficherInv(L2).
/*example:  
?- afficher([[1,3],[2,2],[3,7],[2,4],[7,0],[-5,3],[3,3]]).
3x^7 + 2x^4 -x^3 + 2x^2 + 7
?- afficher([[1.5,0],[-1,1],[0,2],[3.5,3]]).
3.5x^3 - x + 1.5
*/

%simplifier un atom----------------------------------------------------
simplt(_,[],0):-!.
simplt(Y,[[X,Y]|L],V):-
	simplt(Y,L,S1),
	V is S1+X,!.
simplt(Y,[_|L],V):-
	simplt(Y,L,V).

% Simplifier un polynome-----------------------------------------------
/*J’utilise prédicat simplt(Y,L,V) pour calculer la somme (V) de tous les monômes à coefficient qui a le même l'exposant dans la liste. 
Je créer L2 avec Y et V. Apres je supprime tous les monômes qui a le même l'exposant. */

simplifier([],[]):-!.
simplifier([[X1,Y]|L1],[[X2,Y]|L2]):-
	simplt(Y,L1,X),
	X2 is X1+X,
	deleteY(Y,L1,L),
	simplifier(L,L2).
/* Example: 
simplifier([[2,3],[2,2],[2,4],[-6,3],[3,3]],L).
L = [[-1, 3], [2, 2], [2, 4]].
*/
%calcul a couple
calCouple(M,[X,Y],R):-
	R1 is (M^Y),
	R is (X*R1).

%--Evaluation un polynome---------------------------------------------
/*R est résultat d'application M dans le polynôme L.*/
evaluation(_,[],0):-!.
evaluation(M,[X|L],R):-
	calCouple(M,X,R1),
	evaluation(M,L,R2),
	R is R2+R1.
/*Example:
?- evaluation(2.4,[[-1.5,0],[1,1],[0,2],[3,3]],R).
R = 42.372.
evaluation(3,[[-1.5,0],[1,1],[0,2],[3,3]],R).
R = 82.5.
*/
%Derivation----------------------------------------------------------
%derivation a couple
deriCouple([X1,Y1],[X,Y]):-
	X is X1*Y1,
	Y is Y1-1.

%derivation of polynôme
/*trouver la derivation de chaque monome et mettre dans la liste L2.*/
derivation([],[]):-!.
derivation([X|L1],[Y|L2]):-
	deriCouple(X,Y),
	derivation(L1,L2).
/*exaxmple: 
?- derivation([[2,3],[2,2],[2,4],[-6,3],[3,3]],L).
L = [[6, 2], [4, 1], [8, 3], [-18, 2], [9, 2]].
*/
%somme---------------------------------------------------------------
/*Faire simplifier la liste L3 avec append(L1,L2,L3)*/
somme(L1,L2,L):-
	append(L1,L2,L3),
	simplifier(L3,L).

/*example:
?- somme([[-1.5,0],[1,1],[0,2],[3,3]],[[1,0],[-1,1],[2,2],[-1,3]],P).
P = [[-0.5, 0], [0, 1], [2, 2], [2, 3]].
*/

%Soustraction--------------------------------------------------------

%multiple-1
multipleMoinsUn([],[]):-!.
multipleMoinsUn([[X1,Y]|L1],[[X,Y]|L2]):-
	X is (X1*(-1)),
	multipleMoinsUn(L1,L2).

%soustraction 2 polynome
/*Je fais L4 est X*(-1) et [X,Y]|L2. Apres je fais simplifier la liste L3 avec
append( L1,L4,L3).*/
soustraction(L1,L2,L):-
	multipleMoinsUn(L2,L3),
	append(L1,L3,L4),
	simplifier(L4,L).

/*example:
?- soustraction([[2,3],[2,2],[2,4]],[[-6,3],[3,3]],L).
L = [[5, 3], [2, 2], [2, 4]].
*/
%Produit-------------------------------------------------------------
%multiple a couple with a list
multCouple(_,[],[]):-!.
multCouple([X,Y],[[X1,Y1]|L1],[[X2,Y2]|L2]):-
	X2 is X*X1,
	Y2 is Y+Y1,
	multCouple([X,Y],L1,L2).

%--produit 2 polynome--
/*Je fais multiple chaque monomes avec L2 par multCouple([X,Y],L2,L3). 
Après je fais append tous les résultats, je recevois L4. Je fais simplifier(L4,L).*/
produit([],_,[]):-!.
produit([X|L1],L2,P):-
	multCouple(X,L2,S),
	produit(L1,L2,P1),
	append(S,P1,P2),
	simplifier(P2,P).

%--------------------------------------------------------SECONDE PARTIE (redéfinition des opérateurs)------------------------------------------------------------

/*J’ai défini operateur « est » au début. Apres je définis tous les autres opérateur avec « est » . */

:-op(1200, xfx, est).
est(P,A) :- P==A.

:-op(700, fx, [simp, deri]).
est(Y,simp(A)) :- simplifier(A,Y).
est(Y,deri(A)) :- derivation(A,Y).

:-op(600, yfx, -).
est(Y,-(A,B)) :- soustraction(A,B,Y).

:-op(500, yfx, +).
est(Y,+(A,B)) :- somme(A,B,Y).

:-op(400, yfx, '*').
est(Y,*(A,B)) :- produit(A,B,Y). 

/* Example:
?- P est [[1,0],[-1,1],[0,2],[2,3]]+[[-1,0],[2,1],[3,2]].
P = [[0, 0], [1, 1], [3, 2], [2, 3]]
?- P est [[1,0],[-1,1],[0,2],[2,3]]-[[-1,0],[2,1],[3,2]].
P = [[2, 0], [-3, 1], [-3, 2], [2, 3]]
?- P est [[-1.5,0],[1,1],[0,2],[3,3]] * [[1,0],[-1,1],[2,2],[-1,3]].
P = [[-1.5, 0], [2.5, 1], [-4.0, 2], [6.5, 3], [-4, 4], [6, 5], [-3, 6]]
?- produit([[-1.5,0],[1,1],[0,2],[3,3]],[[1,0],[-1,1],[2,2],[-1,3]],Poly7).
Poly7 = [[-1.5, 0], [2.5, 1], [-4.0, 2], [6.5, 3], [-4, 4], [6, 5], [-3, 6]].
P est simp [[2,3],[2,2],[2,4],[-6,3],[3,3]].
P = [[-1, 3], [2, 2], [2, 4]] 
*/