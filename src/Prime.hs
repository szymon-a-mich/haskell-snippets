module Prime (nth) where

-- I didn't come up with this solution by myself, but I really liked its simplicity
-- and the way it takes advantage of haskell lazy evaluation

nth :: Int -> Maybe Integer
nth n
  | n < 1 = Nothing
  | otherwise = Just $ primes !! (n-1)

primes :: [Integer]  
primes = 
    sieve [2..]
    where
        sieve [] = [] 
        sieve (p:xs) = p: sieve [x | x <- xs, x `mod` p /= 0] 