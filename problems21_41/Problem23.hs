import System.Random

rnd_select_helper :: [a] -> [Int] -> Int -> [a]
rnd_select_helper xs idxs n = map ((!!) xs) (take n idxs)

rnd_select :: [a] -> Int -> IO [a]
rnd_select xs n = do
    g <- newStdGen
    let inx = randomRs (0, length xs - 1) g
    return $ rnd_select_helper xs inx n

rnd_select_helperTest :: Bool
rnd_select_helperTest =
    all id [test1, test2, test3]
    where
        test1 = rnd_select_helper [1] [0] 1 == [1]
        test3 = rnd_select_helper [1] [0] 0 == []
        test2 = rnd_select_helper [] [] 0 == ([]::[Int])
