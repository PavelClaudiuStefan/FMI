-- CIS 194, Spring 2015
--
-- Test cases for HW 01

module HW01Tests where

import HW01
import Testing

-- Exercise 1 -----------------------------------------

testLastDigit :: (Integer, Integer) -> Bool
testLastDigit (n, d) = lastDigit n == d

testDropLastDigit :: (Integer, Integer) -> Bool
testDropLastDigit (n, d) = dropLastDigit n == d

ex1Tests :: [Test]
ex1Tests = [ Test "lastDigit test" testLastDigit
             [(123, 3), (1234, 4), (5, 5), (10, 0), (0, 0)]
           , Test "dropLastDigit test" testDropLastDigit
             [(123, 12), (1234, 123), (5, 0), (10, 1), (0,0)]
           ]

-- Exercise 2 -----------------------------------------

testToRevDigits :: (Integer, [Integer]) -> Bool
testToRevDigits (n, d) = toRevDigits n == d

ex2Tests :: [Test]
ex2Tests = [ Test "toRevDigits test" testToRevDigits
            [(0, []), (123, [3, 2, 1]), ((-17), [])]
           ]

-- Exercise 3 -----------------------------------------

testDoubleEveryOther :: ([Integer], [Integer]) -> Bool
testDoubleEveryOther (n, d) = doubleEveryOther n == d

ex3Tests :: [Test]
ex3Tests = [ Test "doubleEveryOther test" testDoubleEveryOther
            [([], []), ([0, 0],[0, 0]), ([1, 2, 3, 4], [1, 4, 3, 8])]
           ]

-- Exercise 4 -----------------------------------------

testSumDigits :: ([Integer], Integer) -> Bool
testSumDigits (n, d) = sumDigits n == d

ex4Tests :: [Test]
ex4Tests = [ Test "sumDigits test" testSumDigits
            [([10, 11, 12], 6), ([], 0), ([19, 2, 10, 3], 16)]
           ]

-- Exercise 5 -----------------------------------------

testLuhn :: (Integer, Bool) -> Bool
testLuhn (n, d) = luhn n == d

ex5Tests :: [Test]
ex5Tests = [ Test "luhn test" testLuhn
            [(5594589764218858, True), (1234567898765432, False)]
           ]

-- Exercise 6 -----------------------------------------

testHanoi :: ((Integer, Peg, Peg, Peg), [Move]) -> Bool
testHanoi ((n, a, b, c), m) = hanoi n a b c == m

ex6Tests :: [Test]
ex6Tests = [ Test "hanoi test" testHanoi
            [
              ((0, "a", "b", "c"), []), ((1, "a", "b", "c"), [("a", "c")]), ((2, "a", "b", "c"), [("a","b"), ("a","c"), ("b","c")]),
              ((4, "a", "b", "c"), [("a","b"),("a","c"),("b","c"),("a","b"),("c","a"),("c","b"),("a","b"),("a","c"),("b","c"),("b","a"),("c","a"),("b","c"),("a","b"),("a","c"),("b","c")])
            ]
           ]

-- All Tests ------------------------------------------

allTests :: [Test]
allTests = concat [ ex1Tests
                  , ex2Tests
                  , ex3Tests
                  , ex4Tests
                  , ex5Tests
                  , ex6Tests
                  ]
