-- Informatics 1 - Functional Programming
-- Lab week tutorial part II
--
--

import           Data.Char
import           PicturesSVG
import           Test.QuickCheck
import           Data.List.Split


-- Exercise 1
-- write the correct type and the definition for
isFENChar :: Char -> Bool
isFENChar ch = elem (toLower ch) ['r', 'n', 'b', 'q', 'k', 'p', '/'] || isDigit ch


-- Exercise 2.a
-- write a recursive definition for
besideList :: [Picture] -> Picture
besideList pictures = if length pictures == 1
                       then head pictures
                      else
                       beside (head pictures) (besideList (tail pictures))                      

-- Exercise 2.c
-- write the correct type and the definition for
toClear :: Int -> Picture
toClear n = besideList (replicate n clear) 

-- Exercise 3
-- write the correct type and the definition for
fenCharToPicture :: Char -> Picture
fenCharToPicture 'r' = rook
fenCharToPicture 'n' = knight
fenCharToPicture 'b' = bishop
fenCharToPicture 'q' = queen
fenCharToPicture 'k' = king
fenCharToPicture 'p' = pawn
fenCharToPicture 'R' = rook
fenCharToPicture 'N' = knight
fenCharToPicture 'B' = bishop
fenCharToPicture 'Q' = queen
fenCharToPicture 'K' = king
fenCharToPicture 'P' = pawn
fenCharToPicture ch = if isDigit ch
                       then toClear (digitToInt ch)
                      else
                       Empty
                      

-- Exercise 4
-- write the correct type and the definition for
isFenRow :: [Char] -> Bool
isFenRow row = if (length row) > 8
                 then False
               else
                   null (filter (not.isFENChar) row)

-- Exercise 6.a
-- write a recursive definition for
fenCharsToPictures :: String -> [Picture]
fenCharsToPictures str = if length str == 1 then fenCharToPicture(head str) : []
                          else  [fenCharToPicture (head str)] ++ (fenCharsToPictures (tail str))

-- Exercise 6.b
-- write the correct type and the definition of
fenRowToPicture :: [Char] -> Picture
fenRowToPicture str = if isFenRow str then besideList (fenCharsToPictures str)
                      else Empty

-- Exercise 7
-- write the correct type and the definition of
mySplitOn :: String -> [[Char]]
mySplitOn str = splitOn "/" str

-- Exercise 8.a
-- write a recursive definition for
fenRowsToPictures :: [String] -> [Picture]
fenRowsToPictures str = if length str == 1 then fenRowToPicture(head str) : []
                          else  [fenRowToPicture (head str)] ++ (fenRowsToPictures (tail str))


-- Exercise 8.b
-- write the correct type and the definition of
aboveList :: [Picture] -> Picture
aboveList pictures = if length pictures == 1
                       then head pictures
                      else
                       above (head pictures) (aboveList (tail pictures))

-- Exercise 8.c
-- write the correct type and the definition of
fenToPicture :: String -> Picture
fenToPicture str = aboveList (fenRowsToPictures (mySplitOn str))


-- Exercise 9.0
--Empty board functions

emptyRow :: Picture
emptyRow = repeatH 4 (beside whiteSquare blackSquare)

otherEmptyRow :: Picture
otherEmptyRow = flipV emptyRow

middleBoard :: Picture
middleBoard = above (above emptyRow otherEmptyRow) (above emptyRow otherEmptyRow)

emptyBoard :: Picture
emptyBoard = above middleBoard middleBoard

-- Exercise 9
-- write the correct type and the definition of
chessBoard :: String -> Picture
chessBoard str = over (fenToPicture str) emptyBoard 

-- Exercise 10
-- write the correct type and definition of
-- allowedMoved
