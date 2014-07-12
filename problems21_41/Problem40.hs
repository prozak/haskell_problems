module Problem40 (goldbach)
where

import Problem38

goldbachHelper n [] _ = error "goldbach: result not found"
goldbachHelper n (p:ps) psR = if elem (n - p) psR then (p, n - p) else goldbachHelper n ps psR

goldbach :: Integral a => a -> (a, a)
goldbach n | n < 3 || n `rem` 2 /= 0 = error "goldbach: positive even number greater then 2 expected"
           | otherwise =
  let ps = primeR 2 n
    in goldbachHelper n ps (reverse ps)

goldbachTest = goldbach 28 == (5, 23)
