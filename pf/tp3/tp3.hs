
data Arbre coul val = ArbreVide | Noeud coul val (Arbre coul val) (Arbre coul val) deriving Show

arbreTest :: (Num a,Num b) => Arbre a b
arbreTest = Noeud 10 5 (Noeud 10 3 (Noeud 10 1 ArbreVide ArbreVide) (Noeud 10 4 ArbreVide ArbreVide)) (Noeud 10 7 (Noeud 10 6 ArbreVide ArbreVide) (Noeud 10 8 ArbreVide ArbreVide))

mapArbre :: (a -> b -> (c,d)) -> Arbre a b-> Arbre c d
mapArbre f ArbreVide = ArbreVide
mapArbre f (Noeud coul val gauche droite) = Noeud coul' val' (mapArbre f gauche) (mapArbre f droite)
						where (coul',val') = (f coul val) 


