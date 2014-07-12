module Problem34 (phi)
where

import Problem33

phiHelper x 1 res = res + 1
phiHelper x n res | coprime x n = phiHelper x (n - 1) (res + 1)
                  | otherwise = phiHelper x (n - 1) res

phi :: Integral a => a -> a
phi 1 = 1 
phi x | x < 1 = error "phi: input should be natural"
      | otherwise = phiHelper x (x - 1) 0

phiTest = phi 10 == 4
