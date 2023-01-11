{-# OPTIONS_GHC -Wno-incomplete-patterns #-}
module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map, fromList, insert, findWithDefault)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

initialMap :: Map Nucleotide Int
initialMap = Data.Map.fromList [(A, 0), (C, 0), (G, 0), (T, 0)]

charToNucleotide :: Char -> Either String Nucleotide
charToNucleotide c
    | c == 'A' = Right A
    | c == 'C' = Right C
    | c == 'G' = Right G
    | c == 'T' = Right T
    | otherwise = Left "error"

updateNucleotideMap :: Nucleotide -> Map Nucleotide Int -> Map Nucleotide Int
updateNucleotideMap n m =
    insert n (currNumber + 1) m
    where
        currNumber = Data.Map.findWithDefault 0 n m

nucleotidesToMap :: Map Nucleotide Int -> [Nucleotide] -> Map Nucleotide Int
nucleotidesToMap  m []  = m
nucleotidesToMap  m (x:xs)  = 
    nucleotidesToMap  updatedMap xs
    where
        updatedMap = updateNucleotideMap x m
    

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts [] = Right initialMap
nucleotideCounts s =
    fmap (nucleotidesToMap  initialMap) nucleotides 
    where
        nucleotides = sequence $ map charToNucleotide s