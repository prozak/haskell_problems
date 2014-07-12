module Problem31 (isPrime)
where

isPrimeHelper :: Integral a => a -> a -> Bool
isPrimeHelper n 1 = True
isPrimeHelper n m = (n `rem` m /= 0) && isPrimeHelper n (m - 1)

isPrime :: Integral a => a -> Bool
isPrime 1 = False
isPrime 2 = True
isPrime n | n < 1 = error "isPrime: natural number expected (1..)"
          | n `rem` 2 == 0 = False
          | otherwise = isPrimeHelper n (floor $ sqrt $ fromIntegral n)

isPrimeTest =
    all (\f -> f) [test1, test2, test3, test4]
    where test1 = isPrime 1 == False
          test2 = isPrime 7 == True
          test3 = isPrime 10 == False
          test4 = isPrime 2 == True
