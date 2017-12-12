-- Informatics 1 - Functional Programming
-- Lab week tutorial part II
--
--

import           Data.Char
import           PicturesSVG
import           Test.QuickCheck



-- Exercise 8:

pic1 :: Picture
pic1 = undefined

pic2 :: Picture
pic2 = undefined


-- Exercise 9:
-- a)

emptyRow :: Picture
emptyRow = undefined

-- b)

otherEmptyRow :: Picture
otherEmptyRow = undefined

-- c)

middleBoard :: Picture
middleBoard = undefined

-- d)

whiteRow :: Picture
whiteRow = undefined

blackRow :: Picture
blackRow = undefined

-- e)

populatedBoard :: Picture
populatedBoard = undefined



-- Functions --

twoBeside :: Picture -> Picture
twoBeside x = beside x (invert x)


-- Exercise 10:

twoAbove :: Picture -> Picture
twoAbove x = undefined

fourPictures :: Picture -> Picture
fourPictures x = undefined
