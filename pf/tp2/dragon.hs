import Graphics.Gloss

main = animate (InWindow "Dragon" (500, 500) (0, 0)) white (dragonAnime (50,250) (450,250))

dragonAnime a b t = Line (dragon a b !! (round t `mod` 20))


--Q5 

pointAintercaler :: Point -> Point -> Point
pointAintercaler (x,y) (x',y') =  ((x+x')/2+(y'-y)/2 , (y+y')/2+(x-x')/2)

--Q6

pasDragon :: Path -> Path
pasDragon [] = []
pasDragon (x:[]) = [x]
pasDragon (x:x':xs) = x:pointAintercaler x x':pasDragonInv (x':xs)

pasDragonInv :: Path -> Path
pasDragonInv [] = []
pasDragonInv (x:[]) = [x]
pasDragonInv (x:x':xs) = x:pointAintercaler x' x:pasDragon (x':xs)

--Q7

dragon :: Point -> Point -> [Path]
dragon p p' = iterate pasDragon (p:p':[])
