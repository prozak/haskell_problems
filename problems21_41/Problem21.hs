module Problem21 (insertAt)
where

insertAt:: a -> [a] -> Int -> [a]
insertAt t [] 1 = [t]
insertAt t [] n = error "Position is out of bounds"
insertAt t (x:xs) 1 = t : x : xs
insertAt t (x:xs) n = x : insertAt t xs (n - 1)

insertAtTest :: [Char] -> Bool
insertAtTest [] = insertAt 'c' [] 1 == "c"
insertAtTest xs = all (\f -> f xs) [test1, test2, test3]
    where
        test1 xs = (head $ reverse $ insertAt 'c' xs (length xs + 1)) == 'c'
        test2 xs = (head $ insertAt 'c' xs 1) == 'c'
        test3 xs = let pos = length xs `div` 2 + 1 in
                     (take pos $ insertAt 'c' xs pos) == (take (pos - 1) xs ++ "c")
