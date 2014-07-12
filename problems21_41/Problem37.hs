module Problem37 (phiImproved)
where

import Problem36
import Problem34

phiImproved m = foldr (\(v, c) res -> res * (v - 1) * (v ^ (c - 1))) 1 $ primeFactorsMult m

phiImprovedTest m | m < 1 = True
                  | otherwise = phiImproved m == phi m
