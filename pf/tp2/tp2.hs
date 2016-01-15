--Q1

alterne :: [a] -> [a]
alterne [] = []
alterne (x:[]) = [x]
alterne (x:_:xs) = x:alterne xs

--Q2

combine :: (a->b->c)->[a]->[b]->[c]
combine f [] xs = []
combine f xs [] = []
combine f (x:xs) (x':xs') = f x x' : combine f xs xs'

--Q3

pasPascal :: [Integer] -> [Integer]
pasPascal xs = zipWith (+) (0:xs) (xs ++ [0]) 

--Q4

pascal :: [[Integer]]
pascal = iterate pasPascal [1]

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

--Q8

dragonOrdre :: Point -> Point -> Int -> Path
dragon p p' 0 = pasDragon p:p':[]
dragon p p' n = pasDragon (dragon p p' (n-1))

--Q9





