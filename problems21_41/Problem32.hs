module Problem32 (myGcd)
where

myGcd :: Integral a => a -> a -> a
myGcd 0 0 = 0
myGcd 0 y | y < 0 = -y
          | otherwise = y
myGcd x 0 | x < 0 = -x
          | otherwise = x
myGcd x y =
    let divident = x `div` y
        rem = x - divident * y
      in if rem == 0
           then
             if y < 0 then (-y) else y
           else
             myGcd y rem

myGcdTest :: Integral a => a -> a -> Bool
myGcdTest x y = myGcd x y == gcd x y
