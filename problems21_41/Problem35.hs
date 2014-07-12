module Problem35 (primeFactors)
where

import Problem38

primeFactorsHelper :: Integral a => a -> [a] -> [a]
primeFactorsHelper _ [] = []
primeFactorsHelper 0 _ = []
primeFactorsHelper n primes@(p:ps) | n `rem` p == 0 = p : primeFactorsHelper (n `div` p) primes
                                   | otherwise = primeFactorsHelper n ps

primeFactors :: Integral a => a -> [a]
primeFactors n = primeFactorsHelper n (primeR 2 (floor $ sqrt $ fromIntegral (abs n)))

primeFactorsTest = primeFactors 315 == [3, 3, 5, 7]
