%Q1
longueur([], 0). 
longueur([_|Q], N) :- longueur(Q, N1), N is N1 + 1.

%Q2
somme([], 0). 
somme([X|Q], N) :- somme(Q, N1), N is N1 + X.

%Q3

membre(_, []) :- false.
membre(Y, [X|_]) :- Y==X.
membre(Y, [_|Q]) :- membre(Y, Q).

%Q4 
ajoute_en_tete(X,Y,[X|Y]).

%Q5
ajoute_en_queue(X,[],[X]).
ajoute_en_queue(X,[Y|Q],[Y|Z]):- ajoute_en_queue(X,Q,Z).

%Q6
extraire_tete([],[],[]).
extraire_tete([],[],[]).
extraire_tete([],[],[]).

%Q7
concatene([X],[],X).
