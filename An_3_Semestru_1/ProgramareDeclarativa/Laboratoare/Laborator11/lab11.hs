data Dom a =  Empty
            | Full
            | Ran a a
            | (Dom a) :|: (Dom a)
            | (Dom a) :&: (Dom a)
            deriving Show

exemplu :: Dom Int
exemplu = (((Ran 1 3) :|: (Ran 2 4)) :&: ((Ran 3 5) :&: Empty))


instance (Ord a) => Eq (Dom a) where
	Empty == Empty         = True
	Full == Full           = True
	(Ran x y) == (Ran x y) = True
	(Ran x y) == (Ran y x) = True
	-- etc.

  

exists :: a -> Dom a -> Bool
exists _ Empty                 = False
exists _ Full                  = True
exists x (Ran a b)             = a <= x && x <= b
exists x ((Dom a) :|: (Dom b)) = exists x (Dom a) || exists x (Dom b)
exists x ((Dom a) :&: (Dom b)) = exists x (Dom a) && exists x (Dom b)