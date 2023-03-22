/*exo1*/
/*unique*/
horsDe(_,[]).
horsDe(X,[T|Q]) :- X\==T, horsDe(X,Q).

unique(X, [X|Q]) :- horsDe(X,Q).
unique(X,[T|Q]) :- unique(X,Q), X \== T.

%prefixe
prefixe([],_).
prefixe([X|L],[X,L1]) :- prefixe(L,L1).	