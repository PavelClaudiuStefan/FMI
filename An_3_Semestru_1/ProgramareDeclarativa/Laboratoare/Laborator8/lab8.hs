-- Informatics 1 Functional Programming
-- Tutorial 8
--

import System.Random


-- Importing the keymap module

import KeymapTree


-- Type declarations

type Barcode = String
type Product = String
type Unit    = String

type Item    = (Product,Unit)

type Catalogue = Keymap Barcode Item


-- A little test catalog

testDB :: Catalogue
testDB = fromList [
 ("0265090316581", ("The Macannihav'nmor Highland Single Malt", "75ml bottle")),
 ("0903900739533", ("Bagpipes of Glory", "6-CD Box")),
 ("9780201342758", ("Thompson - \"Haskell: The Craft of Functional Programming\"", "Book")),
 ("0042400212509", ("Universal deep-frying pan", "pc"))
 ]


-- Exercise 1

longestProductLen :: [(Barcode, Item)] -> Int
longestProductLen list = maximum [length product | (_, (product, _)) <- list]

dots :: Int -> String
dots nr = concat $ replicate (nr+3) "."

formatLine :: Int -> (Barcode, Item) -> String
formatLine nr (barcode, (product, unit)) = barcode ++ "..." ++ product ++ dots (nr - length product) ++ unit

showCatalogue :: Catalogue -> String
showCatalogue catalogue = concat [(formatLine nr x) ++ "\n" | x <- toList catalogue, let nr = longestProductLen $ toList catalogue]

-- Exercise 2
maybeToList :: Maybe a -> [a]
maybeToList Nothing  = []
maybeToList (Just a) = [a]

listToMaybe :: [a] -> Maybe a
listToMaybe []  = Nothing
listToMaybe list = Just (head list)

catMaybes :: [Maybe a] -> [a]
catMaybes []           = []
catMaybes ((Nothing):xs) = catMaybes xs
catMaybes ((Just x):xs)  = x : catMaybes xs

-- Exercise 3

getItems :: [Barcode] -> Catalogue -> [Item]
getItems barcodes catalogue = [item | (barcode, item) <- toList catalogue, elem barcode barcodes]






-- Input-output ------------------------------------------

readDB :: IO Catalogue
readDB = do dbl <- readFile "database.csv"
            let db = fromList (map readLine $ lines dbl)
            putStrLn (size db >= 0 `seq` "Done")
            return db

readLine :: String -> (Barcode,Item)
readLine str = (a,(c,b))
    where
      (a,str2) = splitUpon ',' str
      (b,c)    = splitUpon ',' str2

splitUpon :: Char -> String -> (String,String)
splitUpon _ "" = ("","")
splitUpon c (x:xs) | x == c    = ("",xs)
                   | otherwise = (x:ys,zs)
                   where
                     (ys,zs) = splitUpon c xs

getSample :: Catalogue -> IO Barcode
getSample db = do g <- newStdGen
                  return $ fst $ toList db !! fst (randomR (0,size db - 1) g)