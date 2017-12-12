{-# LANGUAGE FlexibleInstances, TypeSynonymInstances #-}

-- Laboratory 10
-- Based on Real World Haskell, Chapter 5 and Chapter 6

module JSONClassNew
    (
      JSON(..)
    , JValue(..)
 --   , JAry(..)
    , JObj(..)
    ) where
    
import Data.Either
import Data.List 
import Test.QuickCheck



-- Exercise 6

newtype JObj a = JObj {
      fromJObj :: [(String, a)]
    } deriving (Eq, Ord, Show)

-- newtype JAry a  = ...



data JValue = JString String
            | JNumber Integer
            | JBool Bool
            | JNull
            | JObject (JObj JValue)   -- was [(String, JValue)]
      --    | JArray  ...             -- was [JValue]
              deriving (Eq, Ord, Show)
              
--  :t  JAry [JString "a", JString "b"]
--  :t  JArray (JAry [JString "a", JString "b"])

    

    
{- result1 :: JValue
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

-}

  
renderJValue :: JValue -> String
renderJValue = undefined              


-- Exercise 7


class JSON a where
    toJValue :: a -> JValue



    

-- instance (JSON a) => JSON (JAry a) where
    


-- instance (JSON a) => JSON (JObj a) where
   

   


  
    
   
