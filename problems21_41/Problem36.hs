module Problem36 (primeFactorsMult)
where

import Problem38

primeFactorsMultHelper :: Integral a => a -> [a] -> (a, a) -> [(a, a)]
primeFactorsMultHelper _ [] pair = [pair]
primeFactorsMultHelper 0 _ pair = [pair]
-- n - number, p - prime, v - value, c - count
primeFactorsMultHelper n primes@(p:ps) pair@(v, c)| n `rem` p == 0 =
    if v == p
    then
        primeFactorsMultHelper (n `div` p) primes (v, c + 1)
    else
        pair : primeFactorsMultHelper (n `div` p) primes (p, 1)
                                   | otherwise = primeFactorsMultHelper n ps pair

primeFactorsMult :: Integral a => a -> [(a, a)]
primeFactorsMult n = tail $ primeFactorsMultHelper n (primeR 2 n) (0, 0)

primeFactorsMultTest = primeFactorsMult 315 == [(3,2),(5,1),(7,1)]
