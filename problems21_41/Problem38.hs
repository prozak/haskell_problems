module Problem38 (primeR)
where

import Problem31

primeR :: Integral a => a -> a -> [a]
primeR n m | n < 0 || m < 0 = error "primeR: positive numbers expected"
           | otherwise = filter isPrime [n..m]

primeRTest = primeR 10 20 == [11,13,17,19]
