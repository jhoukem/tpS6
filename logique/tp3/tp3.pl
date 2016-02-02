:-use_module(library(clpfd)).

%1
printline([]) :-  writeln('|').
printline([H|T]) :- integer(H), write('|'), write(H), printline(T).
printline([H|T]) :- H='_', write('|'), write(' '), printline(T).


%2
print([]):-!.
print([H|T]):- printline(H), print(T).

grille([[_,_,_,_,_,_,_,_,_],
        [_,_,_,_,_,3,_,8,5],
        [_,_,1,_,2,_,_,_,_],
        [_,_,_,5,_,7,_,_,_],
        [_,_,4,_,_,_,1,_,_],
        [_,9,_,_,_,_,_,_,_],
        [5,_,_,_,_,_,_,7,3],
        [_,_,2,_,1,_,_,_,_],
        [_,_,_,_,4,_,_,_,9]]).


%3
bonnelongueur([],0).
bonnelongueur([_|T],S):- bonnelongueur(T,S1), S is S1+1.

%4
bonnetaille([],0).
bonnetaille([X],S):- bonnelongueur(X,S).
bonnetaille([_|T],S):- bonnelongueur(_,S), bonnetaille(T,S).

%5
verifier([]).
verifier(L):- L ins 1..9, all_distinct(L).

verifie([]).
verifie([H|T]):- verifier(H), verifie(T).

%6
eclate([],[],[]).
eclate([H|T],[H2|T2],[[H|H2]|L]):- eclate(T,T2,L).

%7
transp([],L)

