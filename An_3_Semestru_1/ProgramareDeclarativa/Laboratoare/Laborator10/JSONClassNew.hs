-- # LANGUAGE FlexibleInstances, TypeSynonymInstances #

-- Laboratory 10
-- Based on Real World Haskell, Chapter 5 and Chapter 6

module JSONClassNew
    (
      JSON(..)
    , JValue(..)
    , JAry(..)
    , JObj(..)
    ) where
    
import Data.Either
import Data.List 
import Test.QuickCheck

-- Exercise 6

newtype MyString = MyStr {
      fromMyStr :: String
    } deriving (Eq, Ord, Show)

newtype JObj a = JObj {
      fromJObj :: [(String, a)]
    } deriving (Eq, Ord, Show)

newtype JAry a  = JAry {
      fromJAry :: [a]
    } deriving (Eq, Ord, Show)
    

data JValue = JString MyString
            | JNumber Integer
            | JBool Bool
            | JNull
            | JObject (JObj JValue)   -- was [(String, JValue)]
            | JArray  (JAry JValue)             -- was [JValue]
              deriving (Eq, Ord, Show)
              
--  :t  JAry [JString "a", JString "b"]
--  :t  JArray (JAry [JString "a", JString "b"])
    
result1 :: JValue
result1 = (JObject (JObj [("foo", JNumber 1), ("bar", JBool False)]))

result2 :: JValue
result2 = JObject (JObj [
  ("query", JString (MyStr "awkward squad haskell")),
  ("estimatedCount", JNumber 3920),
  ("moreResults", JBool True),
  ("results", JArray (JAry [
     JObject (JObj [
      ("title", JString (MyStr "Simon Peyton Jones: papers")),
      ("snippet", JString (MyStr "Tackling the awkward ...")),
      ("url", JString (MyStr "http://.../marktoberdorf/"))
     ])]))
  ])

  
renderJValue :: JValue -> String
renderJValue (JNumber n) = show n
renderJValue (JString (MyStr n)) = n
renderJValue (JObject (JObj n)) = "{" ++ renderJObject n ++ "}"
renderJValue (JArray (JAry n)) = "[" ++ renderJArray n ++ "]"
renderJValue (JBool n) = show n
renderJValue (JNull) = ""

renderJObject :: [(String, JValue)] -> String
renderJObject [] = "" 
renderJObject ((a,b):xs) = if(not(renderJObject(xs) == "")) then a ++ " : " ++ renderJValue(b) ++ ", " ++ renderJObject(xs) else a ++ " : " ++ renderJValue(b) ++ renderJObject(xs)

renderJArray :: [JValue] -> String
renderJArray [] = ""
renderJArray (x:xs) = if(not(renderJArray(xs) == "")) then renderJValue x ++ ", " ++ renderJArray(xs) else renderJValue x ++ renderJArray(xs)

-- Exercise 7

class JSON a where
    toJValue :: a -> JValue

instance JSON Bool where
    toJValue = JBool
    
instance JSON Integer where
    toJValue = JNumber
    
instance JSON MyString where
    toJValue a = JString (MyStr (fromMyStr a))

instance (JSON a) => JSON (JAry a) where
    toJValue a = JArray (JAry (map toJValue (fromJAry a)))

instance (JSON a) => JSON (JObj a) where
    toJValue x = JObject (JObj (map (\(key, val) -> (key, toJValue val)) (fromJObj x)))

