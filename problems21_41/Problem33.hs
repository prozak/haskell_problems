module Problem33 (coprime)
where

import Problem32
import Problem35

coprime :: Integral a => a -> a -> Bool
coprime x y = myGcd x y == 1

coprimeTest :: Integral a => a -> a -> Bool
coprimeTest x y | coprime x y = not $ any (\prime -> x `rem` prime == 0) (primeFactors y)
                | otherwise = True
