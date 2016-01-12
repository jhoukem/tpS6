
%Q1 
%contenu de x reprensente soit un tigre, soit une princesse
contenu(tigre).
contenu(princesse).

%Q2 X: porte 1 et Y: porte 2
pancarte1(tigre, Y) :- contenu(Y).
pancarte1(X,princesse) :- contenu(X).

pancarte2(princesse, Y) :- contenu(Y).

%Q3 Soit les deux pancartes sont vraies soit elles sont toutes les deux fausses
salle1(X,Y) :- pancarte1(X,Y), pancarte2(X,Y).
salle1(X,Y) :- not(pancarte1(X,Y)), not(pancarte2(X,Y)).

%Q4 affiche les réponses possibles, ici une seule existe.
%salle1(X,Y).
%X = Y, Y = princesse .

%Q5


%Q6

pancarte1_2(princesse, Y):- contenu(Y), Y=tigre.
pancarte2_2(X, Y):- contenu(X), contenu(Y), X\=Y.

salle2(X,Y) :- pancarte1_2(X,Y), not(pancarte2_2(X,Y)).
salle2(X,Y) :- pancarte2_2(X,Y), not(pancarte1_2(X,Y)).

%Q7
% salle2(X,Y).
%X = tigre,
%Y = princesse .

%Q8

%Q9 
%La deuxieme pancarte disait la vérité

%Q10
affiche :- salle2(X, Y), write('Porte 1 : '), write(X), write('\n'),
 write('Porte 2 : '), write(Y).


%Q11

contenu2(tigre).
contenu2(princesse).
contenu2(vide).

unique(X,Y,Z) :- contenu2(X), contenu2(Y), contenu2(Z), X\=Y, Y\=Z, Z\=X.

pancarte1_3(X,Y,Z) :- unique(X,Y,Z), Z=vide.
pancarte2_3(X,Y,Z) :- unique(X,Y,Z), X=tigre.
pancarte3_3(X,Y,Z) :- unique(X,Y,Z), Z=vide.

porte1(X) :- pancarte1_3(X,Y,Z), .
porte2 :- .
porte3 :- .


salle3(X,Y,Z) :- .

