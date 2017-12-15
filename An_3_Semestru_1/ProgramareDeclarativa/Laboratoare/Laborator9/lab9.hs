-- Informatics 1 - Functional Programming 
-- Tutorial 9
--


import LSystem
import Test.QuickCheck

-- Exercise 1

-- 1a. split
split :: Command -> [Command]
split (Sit :#: r) = split r
split (c :#: r)   = [c] ++ split r
split Sit         = []
split c           = [c]

-- 1b. join
join :: [Command] -> Command
join []         = Sit
join (c : tail) = c :#: join tail

-- 1c  equivalent
equivalent :: Command -> Command -> Bool
equivalent c1 c2 = (split c1) == split c2

-- 1d. testing join and split
prop_split_join = True

prop_split = True


-- Exercise 2
-- 2a. copy
copy :: Int -> Command -> Command
copy 1 c = c
copy n c = join ((split c) ++ (split (copy (n-1) c)))

-- 2b. pentagon
pentagon :: Distance -> Command
pentagon d = copy 5 (Go d :#: Turn 72)

-- 2c. polygon
polygon :: Distance -> Int -> Command
polygon d n = copy n (Go d :#: Turn (360 / (fromIntegral n)))



-- Exercise 3
-- spiral
spiral :: Distance -> Int -> Distance -> Angle -> Command
spiral side 1 step angle = Go side :#: Turn angle
spiral side n step angle = Go side :#: Turn angle :#: (spiral (side+step) (n-1) step angle)


-- Exercise 4
-- optimise
optimise :: Command -> Command
optimise (Sit :#: c) = optimise c
optimise (c :#: Sit) = optimise c
optimise (Go d1 :#: Go d2) = Go (d1+d2)
optimise (Turn a1 :#: Turn a2) = Turn (a1+a2)
optimise (c :#: Sit :#: c2) = optimise (c :#: c2)
optimise (Go d1 :#: Go d2 :#: c) = optimise (Go (d1+d2) :#: c)
optimise (Turn a1 :#: Turn a2 :#: c) = optimise (Turn (a1+a2) :#: c)
optimise c = c



-- L-Systems

-- 5. arrowhead
arrowhead :: Int -> Command
arrowhead x  =  f x
  where
  f 0      = GrabPen red :#: Go 10
  f x      = g (x-1) :#: p :#: f (x-1) :#: p :#: g (x-1)
  g 0      = GrabPen blue :#: Go 10
  g x      = f (x-1) :#: n :#: g (x-1) :#: n :#: f (x-1)
  n        = Turn 60
  p        = Turn (-60)

-- 6. snowflake
snowflake :: Int -> Command
snowflake x  =  f x :#: n :#: n :#: f x :#: n :#: n :#: f x :#: n :#: n
  where
  f 0      = GrabPen blue :#: Go 10
  f x      = f (x-1) :#: p :#: f (x-1) :#: n :#: n :#: f (x-1) :#: p :#: f (x-1)
  n        = Turn 60
  p        = Turn (-60)


-- 7. hilbert
hilbert :: Int -> Command
hilbert x = l x
    where
    f 0      = GrabPen black :#: Go 10
    f x      = GrabPen black :#: Go 10
    l 0      = GrabPen black
    l x      = p :#: r (x-1) :#: f (x-1) :#: n :#: l (x-1) :#: f (x-1) :#: l (x-1) :#: n :#: f (x-1) :#: r (x-1) :#: p
    r 0      = GrabPen black
    r x      = n :#: l (x-1) :#: f (x-1) :#: p :#: r (x-1) :#: f (x-1) :#: r (x-1) :#: p :#: f (x-1) :#: l (x-1) :#: n
    n        = Turn 90
    p        = Turn (-90)


main :: IO ()
main = display (Go 30 :#: Turn 120 :#: Go 30 :#: Turn 120 :#: Go 30)
