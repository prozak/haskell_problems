-- in case x > y we will get infinite list, in case it is not desired x > y check should be added

range:: (Eq a, Enum a) => a -> a -> [a]
range x y | x == y = [y]
          | otherwise = x : range (succ x) y

rangeTest :: Int -> Int -> Bool
rangeTest x y | x == y = range x y == [x]
              | x < y = (take 10 $ range x y) == (take 10 $ [x..y])
              | x > y = True -- please see comment above
