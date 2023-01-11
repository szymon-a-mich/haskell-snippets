import Test.Hspec
import Data.Map

import DNA
import Prime
import CollatzConjecture
import Pangram


initialMap :: Map Nucleotide Int
initialMap = Data.Map.fromList [(A, 0), (C, 0), (G, 0), (T, 0)]


updatedMap :: Map Nucleotide Int
updatedMap = Data.Map.fromList [(A, 4), (C, 1), (G, 0), (T, 0)]


main :: IO ()
main = hspec $ do

-- DNA
  describe "nucleotideCounts" $ do
    it "returns error for wrong input" $ do
        nucleotideCounts "XXX" `shouldBe` (Left "error")

    it "returns initial map for empty strings" $ do
        nucleotideCounts "" `shouldBe` (Right initialMap)

    it "returns updated map for correct input" $ do
        nucleotideCounts "AACAA" `shouldBe` (Right updatedMap)
-- Prime
    describe "nth prime" $ do
        it "returns Nothing for 0" $ do
            nth 0 `shouldBe` (Nothing)
        it "returns 17 for 7th" $ do
            nth 7 `shouldBe` (Just 17)
    
-- Collatz
    describe "Collatz" $ do
        it "returns Just for less than 1" $ do
            collatz 1 `shouldBe` (Just 0 :: Maybe Integer)
        
-- Pangram
    describe "Pangram" $ do
        it "return false for not for pangram" $ do
            isPangram "AAAA" `shouldBe` False
        it "return true for for pangram" $ do
            isPangram "Pack my box with five dozen liquor jugs." `shouldBe` True
    