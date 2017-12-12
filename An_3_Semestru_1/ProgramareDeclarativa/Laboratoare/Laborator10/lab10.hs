
-- Laboratory 10
-- Based on Real World Haskell, Chapter 5 and Chapter 6

--{-# LANGUAGE FlexibleInstances, TypeSynonymInstances #-}
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
renderJValue = undefined


        


type JSONError = String

class JSON a where
    toJValue :: a -> JValue
    fromJValue :: JValue -> Either JSONError a 

instance JSON JValue where
    toJValue = undefined
    fromJValue = undefined
    
    
    
instance JSON Bool where
    toJValue = JBool
    fromJValue (JBool b) = Right b
    fromJValue _ = Left "not a JSON boolean"
    



    
instance JSON Integer where
    toJValue = undefined
    fromJValue = undefined




    
--instance JSON String where
--    toJValue    = undefined
--   fromJValue  = undefined  


--instance (JSON a) => JSON [a] where
--    toJValue = undefined
--    fromJValue = undefined

-- instance (JSON a) => JSON [(String, a)] where
--    toJValue = undefined
--    fromJValue = undefined  

   
    
   
