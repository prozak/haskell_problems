module Problem41
where

import Problem40

goldbachList :: Integral a => a -> a -> [(a, a)]
goldbachList n m | n < 3 = goldbachList 3 m
                 | m < n = goldbachList m n
                 | otherwise =
    let xs = [ x | x <- [n .. m], x `rem` 2 == 0]
      in map goldbach xs

goldbachList' :: Integral a => a -> a -> a -> [(a, a)]
goldbachList' n m l = filter (\(x, y) -> x > l && y > l) $ goldbachList n m

goldbachListTest =
    any id [test1, test2]
    where test1 = goldbachList 9 20 == [(3,7),(5,7),(3,11),(3,13),(5,13),(3,17)]
          test2 = goldbachList' 4 2000 50 == [(73,919),(61,1321),(67,1789),(61,1867)]
