%Ajouter readme pour convention (pas obligatoire)

%trie polynome par exposant decroisant
trier_polynome([],[]).
trier_polynome([X,L1],L2) :-
	trier_polynome()

%afficher
%modifier pour X=1
ecrire_monome([0,_]).
ecrire_monome([X,Y]) :-
	write(X),
	write("X^"),
	write(Y),
	write(" ").

%Afficher premier sans le + devant
%Egalement ne pas afficher ^1 par exemple
afficher([]).
afficher([X|L]) :-
	ecrire_monome(X),
	afficher(L).

% simplifier
% enlever monomes avec 0
% simplifier(P)

% Evaluation
% Derivation
% Somme
% Soustraction
% Produit

% :- op(600, yfx, '*').
% :- op(605, yfx, '+').
% :- op(610, yfx, '-').
% :- op(615, fx, 'simpl').
% :- op(615, fx, 'deri').
% :- op(620, fx, 'est').

% :- op(600, yfx, '*').
% :- op(600, yfx, '+').
% :- op(600, yfx, '-').
% :- op(600, yfx, ['simpl', 'deri']).
% :- op(600, yfx, 'est').
