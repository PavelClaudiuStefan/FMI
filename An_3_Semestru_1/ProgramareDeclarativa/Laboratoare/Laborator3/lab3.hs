-- Declarative Programming
-- Lab 3
--

import Data.Char
import Data.List
import Test.QuickCheck



-- 1. halveEvens

-- List-comprehension version
halveEvens :: [Int] -> [Int]
halveEvens xs = [div x 2| x <- xs, even x]

-- Recursive version
halveEvensRec :: [Int] -> [Int]
halveEvensRec [] = []
halveEvensRec (x:xs)
    | even x     = (div x 2) : (halveEvensRec xs)
    | otherwise  = (halveEvensRec xs)

                      

-- Mutual test
prop_halveEvens :: [Int] -> Bool
prop_halveEvens x
    | (halveEvens x) == (halveEvensRec x) = True
    | otherwise = False



-- 2. inRange

-- List-comprehension version
inRange :: Int -> Int -> [Int] -> [Int]
inRange lo hi xs = [x | x <- xs, x >= lo, x <= hi]

-- Recursive version
inRangeRec :: Int -> Int -> [Int] -> [Int]
inRangeRec lo hi [] = []
inRangeRec lo hi (x:xs)
    | x <= hi, x >= lo = x : (inRangeRec lo hi xs)
    | otherwise = inRangeRec lo hi xs

-- Mutual test
prop_inRange :: Int -> Int -> [Int] -> Bool
prop_inRange lo hi xs
    | (inRange lo hi xs) == (inRangeRec lo hi xs) = True
    | otherwise = False



-- 3. sumPositives: sum up all the positive numbers in a list

-- List-comprehension version
countPositives :: [Int] -> Int
countPositives xs = sum [1 | x <- xs, x > 0]

-- Recursive version
countPositivesRec :: [Int] -> Int
countPositivesRec [] = 0
countPositivesRec (x:xs)
    | x > 0 = 1 + (countPositivesRec xs)
    | otherwise = (countPositivesRec xs)

-- Mutual test
prop_countPositives :: [Int] -> Bool
prop_countPositives xs
    | (countPositives xs) == (countPositivesRec xs) = True
    | otherwise = False



-- 4. pennypincher

-- Helper function
discount :: Int -> Int
discount x = round((fromIntegral x) * 0.9)

-- List-comprehension version
pennypincher :: [Int] -> Int
pennypincher xs = sum [discount x | x <- xs, (discount x) <= 19900]

-- Recursive version
pennypincherRec :: [Int] -> Int
pennypincherRec [] = 0
pennypincherRec (x:xs)
    | (discount x) <= 19900 = (discount x) + (pennypincherRec xs)
    | otherwise = pennypincherRec xs

-- Mutual test
prop_pennypincher :: [Int] -> Bool
prop_pennypincher xs
    | (pennypincher xs) == (pennypincherRec xs) = True
    | otherwise = False



-- 5. sumDigits

-- List-comprehension version
multDigits :: String -> Int
multDigits "" = 1
multDigits str = product [if (isDigit x) then (digitToInt x) else 1 | x <- str]

-- Recursive version
multDigitsRec :: String -> Int
multDigitsRec "" = 1
multDigitsRec (x:xs)
    | isDigit x = (digitToInt x) * (multDigitsRec xs)
    | otherwise = multDigitsRec xs

-- Mutual test
prop_multDigits :: String -> Bool
prop_multDigits str    
    | (multDigits str) == (multDigitsRec str) = True
    | otherwise = False



-- 6. capitalise

-- List-comprehension version
capitalise :: String -> String
capitalise "" = ""
capitalise str = [if i == 0 then (toUpper (str!!i)) else (toLower (str!!i)) | i <- [0..(length str) - 1]]

-- Recursive version
toLowerString :: String -> String
toLowerString "" = ""
toLowerString (x:xs) = (toLower x) : (toLowerString xs)

capitaliseRec :: String -> String
capitaliseRec (x:xs) = (toUpper x) : (toLowerString xs)

-- Mutual test
prop_capitalise :: String -> Bool
prop_capitalise str
    | (capitalise str) == (capitaliseRec str) = True
    | otherwise = False



-- 7. title

-- List-comprehension version
title :: [String] -> [String]
title [] = []
title str = [if (i == 0 || length (str!!i) > 3) then (capitalise (str!!i)) else toLowerString(str!!i) | i <- [0..(length str) - 1]]

-- Recursive version
titleRecHelper :: [String] -> [String]
titleRecHelper [] = []
titleRecHelper (x:xs)
    | length x > 3 = (capitaliseRec) x : (titleRecHelper xs)
    | otherwise = (toLowerString x) : (titleRecHelper xs)

titleRec :: [String] -> [String]
titleRec [] = []
titleRec (x:xs) = (capitaliseRec x) : (titleRecHelper xs)

-- mutual test
prop_title :: [String] -> Bool
prop_title str
    | (title str) == (titleRec str) = True
    | otherwise = False
