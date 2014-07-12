module Problem24 (diffSelect)
where

import System.Random

diffSelect :: Int -> Int -> IO [Int]
diffSelect n m = do
    g <- newStdGen
    let inx = randomRs (1, m) g
    return $ take n inx

diffSelectTest = True
