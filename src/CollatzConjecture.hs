module CollatzConjecture (collatz) where

calculateSteps :: (Integer, Integer) -> (Integer, Integer)
calculateSteps (number, step) =
  case (number, step) of
    (1, _) -> (number, step)
    (_, _) ->
      if number `mod` 2 == 0 then
        calculateSteps (number `div` 2, step+1)
      else
        calculateSteps ((number*3) + 1, step+1)
        

collatz :: Integer -> Maybe Integer
collatz n 
  | n < 1 = Nothing
  | otherwise = Just stepNumber
  where 
    res = calculateSteps (n, 0)
    stepNumber = snd res