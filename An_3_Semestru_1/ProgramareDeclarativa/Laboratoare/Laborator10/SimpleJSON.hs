-- Based on Real World Haskell, Chapter 5 and Chapter 6

module SimpleJSON
    (
      JValue(..)
    , getString
    , getInteger
    , getBool
    , getObject
    , getArray
    , isNull
    ) where

import Data.Either


data JValue = JString String
            | JNumber Integer
            | JBool Bool
            | JNull
            | JObject [(String, JValue)]
            | JArray [JValue]
              deriving (Eq, Ord, Show)



getInteger :: JValue -> Either String Integer
getInteger (JNumber n) = Right n
getInteger  _ = Left "Not a JNumber"


-- define accessor functions using the above example

getString    = undefined


getBool  = undefined



getObject  = undefined



getArray  = undefined


-- define isNull as a predicate that asserts that its argument is JNull 
isNull = undefined




