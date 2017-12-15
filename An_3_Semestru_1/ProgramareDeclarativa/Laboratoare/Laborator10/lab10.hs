
-- Laboratory 10
-- Based on Real World Haskell, Chapter 5 and Chapter 6

{-# LANGUAGE FlexibleInstances, TypeSynonymInstances #-}
-- read more about LANGUAGE Extensions https://wiki.haskell.org/Language_extensions

import SimpleJSON
import Data.Either
import Data.List 
import Test.QuickCheck

result1 :: JValue
result1 = (JObject [("foo", JNumber 1), ("bar", JBool False)])


result2 :: JValue
result2 = JObject [
  ("query", JString "awkward squad haskell"),
  ("estimatedCount", JNumber 3920),
  ("moreResults", JBool True),
  ("results", JArray [
     JObject [
      ("title", JString "Simon Peyton Jones: papers"),
      ("snippet", JString "Tackling the awkward ..."),
      ("url", JString "http://.../marktoberdorf/")
     ]])
  ]


  
renderJValue :: JValue -> String
renderJValue (JNumber x) = show x
renderJValue (JString x) = x
renderJValue (JObject x) = "{" ++ renderJObject x ++ "}"
renderJValue (JArray x)  = "[" ++ renderJArray x ++ "]"
renderJValue (JBool x)   = show x
renderJValue JNull       = ""

renderJObject :: [(String, JValue)] -> String
renderJObject []                = ""
renderJObject ((k, v):xs) 
    | not(renderJObject xs == "") = k ++ ": " ++ renderJValue v ++ ", " ++ renderJObject xs
    | otherwise                   = k ++ ": " ++ renderJValue v

renderJArray :: [JValue] -> String
renderJArray []                = ""
renderJArray (x:xs)
    | not(renderJArray xs == "") = renderJValue x ++ ", " ++ renderJArray xs
    | otherwise                  = renderJValue x

        

type JSONError = String

class JSON a where
    toJValue :: a -> JValue
    fromJValue :: JValue -> Either JSONError a 

instance JSON JValue where
    toJValue v = v
    fromJValue v = Right v
    --fromJValue _ = Left "not a JSON value"
    

    
instance JSON Bool where
    toJValue = JBool
    fromJValue (JBool b) = Right b
    fromJValue _ = Left "not a JSON boolean"
    
    
instance JSON Integer where
    toJValue = JNumber
    fromJValue (JNumber a) = Right a
    fromJValue _ = Left "not a JSON integer"

    
instance JSON String where
    toJValue = JString
    fromJValue (JString a) = Right a
    fromJValue _ = Left "not a JSON string"


instance (JSON a) => JSON [a] where
    toJValue = undefined
    fromJValue = undefined

instance (JSON a) => JSON [(String, a)] where
    toJValue = undefined
    fromJValue = undefined  
