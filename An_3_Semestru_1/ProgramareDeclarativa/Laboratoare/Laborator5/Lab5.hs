-- Informatics 1 - Functional Programming 
-- Declarative Programming 
-- Lab 5

import Data.Char
import Data.List
import Test.QuickCheck



-- 1. Map
-- a. (4 simboluri)
uppers :: String -> String
uppers = map toUpper

-- b. (7 simboluri)
doubles :: [Int] -> [Int]
doubles = map (2*)

-- c. (10 simboluri)
penceToPounds :: [Int] -> [Float]
penceToPounds = map $ \x -> fromIntegral x / 100

-- d. (11 simboluri)
uppers' :: String -> String
uppers' str = [toUpper ch | ch <- str]

-- (8 simboluri)
prop_uppers :: String -> Bool
prop_uppers str = uppers str == uppers' str



-- 2. Filter
-- a. (4 simboluri)
alphas :: String -> String
alphas = filter isAlpha

-- b. (8 simboluri)
rmChar ::  Char -> String -> String
rmChar ch = filter (/=ch)

-- c. (8 simboluri)
above :: Int -> [Int] -> [Int]
above nr = filter (>nr)

-- d. (13 simboluri)
unequals :: [(Int,Int)] -> [(Int,Int)]
unequals = filter $ \(x,y) -> x /= y

-- e. (15 simboluri)
rmCharComp :: Char -> String -> String
rmCharComp ch str = [c | c <- str, c /= ch]

-- (11 simboluri)
prop_rmChar :: Char -> String -> Bool
prop_rmChar ch str = rmChar ch str == rmCharComp ch str



-- 3. Comprehensions vs. map & filter
-- a. 
upperChars :: String -> String
upperChars s = [toUpper c | c <- s, isAlpha c]

-- (7 simboluri)
upperChars' :: String -> String
upperChars' = map toUpper . filter isAlpha

prop_upperChars :: String -> Bool
prop_upperChars s = upperChars s == upperChars' s

-- b. 
largeDoubles :: [Int] -> [Int]
largeDoubles xs = [2 * x | x <- xs, x > 3]

-- (13 simboluri)
largeDoubles' :: [Int] -> [Int]
largeDoubles' = map (*2) . filter (>3)

prop_largeDoubles :: [Int] -> Bool
prop_largeDoubles xs = largeDoubles xs == largeDoubles' xs 

-- c.
reverseEven :: [String] -> [String]
reverseEven strs = [reverse s | s <- strs, even (length s)]

-- (11 simboluri)
reverseEven' :: [String] -> [String]
reverseEven' = map reverse . filter (even.length)

prop_reverseEven :: [String] -> Bool
prop_reverseEven strs = reverseEven strs == reverseEven' strs



-- 4. Foldr
-- a.
productRec :: [Int] -> Int
productRec []     = 1
productRec (x:xs) = x * productRec xs

-- (7 simboluri)
productFold :: [Int] -> Int
productFold = foldr (*) 1

prop_product :: [Int] -> Bool
prop_product xs = productRec xs == productFold xs

-- b.  (16 simboluri)
andRec :: [Bool] -> Bool
andRec [] = True
andRec (x:xs) = x && andRec xs


-- (7 simboluri)
andFold :: [Bool] -> Bool
andFold = foldr (&&) True

prop_and :: [Bool] -> Bool
prop_and xs = andRec xs == andFold xs 

-- c.  (17 simboluri)
concatRec :: [[a]] -> [a]
concatRec [] = []
concatRec (x:xs) = x ++ concatRec xs

-- (8 simboluri)
concatFold :: [[a]] -> [a]
concatFold = foldr (++) []

prop_concat :: [String] -> Bool
prop_concat strs = concatRec strs == concatFold strs

-- d.  (17 simboluri)
rmCharsRec :: String -> String -> String
rmCharsRec "" str = str
rmCharsRec (x:xs) str = rmChar x $ rmCharsRec xs str

-- (6 simboluri)
rmCharsFold :: String -> String -> String
rmCharsFold = flip $ foldr rmChar

prop_rmChars :: String -> String -> Bool
prop_rmChars chars str = rmCharsRec chars str == rmCharsFold chars str



type Matrix = [[Int]]


-- 5
-- a. (10 simboluri)
uniform :: [Int] -> Bool
uniform list = all (==head list) list

-- b. (	 simboluri)
valid :: Matrix -> Bool
valid matrix = not (null matrix) && not (null $ head matrix) &&
               uniform (map length matrix)

-- 6.
myZipWith f xs ys = [f x y | (x, y) <- zip xs ys]

myZipWith' f xs ys = map (uncurry f) $ zip xs ys

-- 7.  (22 simboluri + 19 simboluri)  cu tot cu tratarea erorilor
-- v1
plusMRec :: Matrix -> Matrix -> Matrix
plusMRec [] _          = []
plusMRec _ []          = []
plusMRec (x:xs) (y:ys) = zipWith (+) x y : (plusM  xs ys)

-- v2
plusMList :: Matrix -> Matrix -> Matrix
plusMList xs ys = [zipWith (+) x y | (x, y) <- zip xs ys]

-- v3
plusM :: Matrix -> Matrix -> Matrix
plusM xs ys
    | length xs /= length ys                   = error "Different number of rows"
    | (length $ head xs) /= (length $ head ys) = error "Different number of columns"
    | not (valid xs && valid ys)               = error "Matrices are not valid"
    | otherwise                                = zipWith (zipWith (+)) xs ys

-- 8. (23 simboluri + 15 simboluri)  cu tot cu tratarea erorilor
dot :: [Int] -> [Int] -> Int
dot xs ys = sum $ zipWith (*) xs ys

timesM :: Matrix -> Matrix -> Matrix
timesM [] _ = []
timesM _ [] = []
timesM xs ys
    | not (valid xs && valid ys)    = error "Matrices are not valid"
    | length (head xs) /= length ys = error "Number of columns /= number of rows"
    | otherwise                     = [dot (head xs) y | y <- transpose ys] : timesM (tail xs) ys

