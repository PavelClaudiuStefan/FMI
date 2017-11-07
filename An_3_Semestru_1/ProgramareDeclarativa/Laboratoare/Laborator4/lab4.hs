-- Declarative Programming
-- Lab 4



import Data.Char
import Data.List
import Test.QuickCheck


-- 1.
rotate :: Int -> [Char] -> [Char]
rotate _ "" = ""
rotate n (x:xs)
    | n > 0 && n <= (length (x:xs)) = rotate (n-1) (xs ++ [x])
    | n == 0                        = (x:xs)
    | otherwise                     = error "Numarul e in afara limitelor"

-- 2.
prop_rotate :: Int -> String -> Bool
prop_rotate k str = rotate (l - m) (rotate m str) == str
                        where l = length str
                              m = if l == 0 then 0 else k `mod` l

-- 3. 
makeKey :: Int -> [(Char, Char)]
makeKey n = zip alphabet (rotate n alphabet)
                where alphabet = [ch | ch <- ['A'..'Z']]

-- 4.
--lookUp 'B' [('A', 'F'), ('B', 'G'), ('C', 'H')] 
lookUp :: Char -> [(Char, Char)] -> Char
lookUp ch [] = ch
lookUp ch ((key, value):xs)
    | ch == key = value
    | otherwise = lookUp ch xs

-- 5.
encipher :: Int -> Char -> Char
encipher 0 ch = ch
encipher n ch
    | isDigit ch         = ch
    | n > 0 && ch == 'Z' = encipher (n-1) 'A'
    | n > 0              = encipher (n-1) (succ ch)
    | otherwise          = ch

-- 6.
normalize :: String -> String
normalize "" = ""
normalize (x:xs)
    | isAlpha x && isLower x = (toUpper x) : (normalize xs)
    | isAlpha x || isDigit x = x : (normalize xs)
    | otherwise              = normalize xs 

-- 7.
encipherStr :: Int -> String -> String
encipherStr n str
    | n >= 0    = [encipher n ch | ch <- (normalize str)]
    | otherwise = [encipher n' ch | ch <- (normalize str), let n' = (length str) + n]

-- 8.
reverseKey :: [(Char, Char)] -> [(Char, Char)]
reverseKey [] = []
reverseKey ((a, b):xs) = (b, a):(reverseKey xs) 

-- 9.
decipher :: Int -> Char -> Char
decipher 0 ch = ch
decipher n ch
    | isDigit ch         = ch
    | n > 0 && ch == 'A' = decipher (n-1) 'Z'
    | n > 0              = decipher (n-1) (pred ch)
    | otherwise          = ch

decipherStr :: Int -> String -> String
decipherStr n str
    | n >= 0    = [decipher n ch | ch <- str]
    | otherwise = [decipher n' ch | ch <- str, let n' = (length str) + n]

-- 10.
prop_cipher :: Int -> String -> Property
prop_cipher n str = n >= 0 ==> normalize str == decipherStr n (encipherStr n (normalize str))

-- 11.
contains :: String -> String -> Bool
contains _ "" = True
contains "" _ = False
contains str1 str2
    | isPrefixOf str2 str1 = True
    | otherwise            = contains (tail str1) str2

-- 12.
candidates :: String -> [(Int, String)]
candidates "" = []
candidates str = [(i, decryptedStr) | i <- [1..26],
                    let decryptedStr = (decipherStr i str), (contains decryptedStr "THE") || (contains decryptedStr "AND")]



-- Optional Material

-- 13.
splitEachFive :: String -> [String]
splitEachFive "" = []
splitEachFive str
    | length str >= 5 = [take 5 str] ++ splitEachFive (drop 5 str)
    | otherwise       = [str ++ replicate (5 - length str) 'X']

-- 14.
prop_transpose :: String -> Bool
prop_transpose str = transpose (transpose (splitEachFive str)) == splitEachFive str

-- 15.
encrypt :: Int -> String -> String
encrypt n str = concat (transpose (splitEachFive (encipherStr n str)))

-- 16.
splitEachN :: String -> [String]
splitEachN str = splitEachN' (div (length str) 5) str

splitEachN' :: Int -> String -> [String]
splitEachN' _ "" = []
splitEachN' n str
    | length str >= n = [take n str] ++ splitEachN' n (drop n str)
    | otherwise       = [str]

decrypt :: Int -> String -> String
decrypt n str =  decipherStr n (concat (transpose (splitEachN str)))

-- Testing
prop_crypt :: Int -> String -> Property
prop_crypt n str = n >= 0 ==> (normalize str) ++ (replicate nrx (decipher n 'X')) == decrypt n (encrypt n str)
                        where nrx = if rem (length (normalize str)) 5 > 0 then 5 - rem (length (normalize str)) 5 else 0


-- Challenge (Optional) (Optional TM) (Optional v2.0) (Optional ^ 2)

-- 17.
countFreqs :: String -> [(Char, Int)]
countFreqs str = [(ch, nr) | ch <- ['A'..'z'], let nr = length (filter (==ch) str), nr > 0]

-- 18
freqDecipher :: String -> [String]
freqDecipher str = [decrypt n str | (ch, nr) <- (countFreqs str), let n = (ord ch) - (ord 'E'), nr > 1]
