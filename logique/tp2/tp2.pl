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
extraire_tete([X|L], X, L).

%Q7
concatene([], List, List).
concatene([Head|Tail], List, [Head|Rest]) :- concatene(Tail, List, Rest).

%Q8
retourne([], L, L).
retourne([X|Q], L, A) :- retourne(Q, [X|L], A).

%Q9
insert_trie(X,[],[X]).
insert_trie(X,[Y|L],[X,Y|L]) :- X=<Y.
insert_trie(X,[Y|L],[Y|L1]) :- X>Y, insert_trie(X,L,L1).

%Q10
tri_insert([],[]).
tri_insert([X|L],LT) :- tri_insert(L,L1), insert_trie(X,L1,LT).

%Q11
divise([],[],[]).
divise([X],[X],[]).
divise([X,Y|L],[X|L1],[Y|L2]) :- divise(L,L1,L2).

%Q12
fusion([],L,L).
fusion(L,[],L).
fusion([X|L1],[Y|L2],[X|L]) :- X=<Y, fusion(L1,[Y|L2],L).
fusion([X|L1],[Y|L2],[Y|L]) :- X>Y, fusion([X|L1],L2,L).

%Q13
tri_fusion([],[]).
tri_fusion([X],[X]).
tri_fusion([X,Y|L],T3) :- divise([X,Y|L],L1,L2), tri_fusion(L1,T1), tri_fusion(L2,T2), fusion(T1,T2,T3).

%Q14
balance(_,[],[],[]).
balance(P,[X|T],[X|U1],U2) :- P>X, balance(P,T,U1,U2).
balance(P,[X|T],U1,[X|U2]) :- P=<X, balance(P,T,U1,U2).

%Q15
tri_rapide([],[]).
tri_rapide([P|L],T) :- balance(P,L,L1,L2), tri_rapide(L1,T1), tri_rapide(L2,T2), concatene(T1,[P|T2],T).

%Q16
est_vide([]).

%Q17
ajoute_ensemble(X,E1,E2) :- membre(X,E1), !, E2=E1.
ajoute_ensemble(X,E1,E2) :- ajoute_en_queue(X,E1,E2).

%Q18
sous_ensemble([], _).
sous_ensemble([T|Q],L) :- membre(T, L), sous_ensemble(Q, L).


%Q19
union([H|T],[],[H|T]).     
union([],[H|T],[H|T]).    
union([H|T], SET2, RESULT) :- membre(H,SET2), union(T,SET2,RESULT).    
union([H|T], SET2, [H|RESULT]) :- not(membre(H,SET2)), union(T,SET2,RESULT).

%Q20
intersect([], _, []).
intersect([H1|T1], L2, [H1|Res]) :- membre(H1, L2), intersect(T1, L2, Res).
intersect([_|T1], L2, Res) :- intersect(T1, L2, Res).

%Q21
diff([], _, []) :- !.
diff([A|C], B, D) :- membre(A, B), !, diff(C, B, D).
diff([A|B], C, [A|D]) :- diff(B, C, D).
