module Pangram (isPangram) where

import Data.Char (toLower)

allChars :: String
allChars = ['a'..'z']


isPangram :: String -> Bool
isPangram text = 
    all (\x -> x `elem` loweredTxt) allChars
    where 
        loweredTxt = map toLower text