-- Simple Program to Print Something
{-This is a block comment-}
{-Variables which are used to hold some data -}

home = 10
five = 5
something = "hello Something"

x=10
y=20
increment n = n + 1
hello name = "Hello" ++name

six = increment five

seven = increment (increment five)

incAndAdd x y = increment x + y

x +- y = (x+x) - (y+y)

sum3 num1 num2 num3 = num1 + num2 + num3

newincrement = sum3 1 2
 
printvalue = newincrement 3 --output 6

sumOf3 x y z =
  let a = x
      b = y
      c = z
  in  a + b + c

sumofnumbers = particularnumber + 10
            where particularnumber = 5 

-- uppercase letter , concrete type 

type Numbers = Int 

type Color = String        -- alias from earlier

redColor :: Color          -- type signature
redColor = "Red"           -- value definition

-- Sum Type
-- own type 
data Colors = Red | Blue | Green | Yellow
              deriving (Show,Eq)
-- alternate |
-- |  this defines maybe enum maybe all possible alternate values
--  count all possible values + sum  
-- data ColorName :: Colors
-- How do you define all possible values of ColorName 
-- so what do you do is maybe you count all and sum of all 

-- data Allcolors = MkRGB Int Int Int 
-- -- compound data of types
-- {-
--  MkRGB this stands for value constructor
--  int - first type
--  int - second type
--  int - third type
-- -}
-- magentaColor:: AllColors
-- magentaColor = MkRGB 255 0 255
-- Product Type - Compound Data of existing types
-- if you want to count all possible values of MagentaColor , maybe you can count all and product of all

-- Mix Sum type and Product Type
data Somecolors = SC_Red | SC_Blue | SC_Green | SC_Yellow | SC_MkRGB Int Int Int 
-- sum type + product type - adt 

blueColor::Somecolors
blueColor = SC_Blue

magenta::Somecolors
magenta = SC_MkRGB 255 0 255
-- Record is naming field in product type

data MRGB = MakeRGB{
    red :: Int 
    , blue :: Int
    , green :: Int
}

redCol::MRGB
redCol = MakeRGB{
    red = 255,
    blue = 0 ,
    green = 0
}

-- how we defined functions until now ??
{-

greetUser name = "Hello" ++name

-}


-- how do we define types to functions
-- -> this helps us defining types to functions

greetUser :: String -> String
greetUser name = "Hello " ++name


sumof3 :: Int -> Int -> Int -> Int
sumof3 x y z = x + y + z

supplygreenandblue :: Int -> Int -> Int -> Somecolors
supplygreenandblue r g b = SC_MkRGB r g b

-- parametric polymorphism in type signatures 
-- as simple as generics
-- name starting with upper case - concrete types
-- name starting with lower case - own types
-- variable - value of a given type
-- type represents another type
-- A type variable represents one type across the type signature (and function definition) 
-- in the same way a variable represent a value throughout the scope it's defined in


-- generics = add function x1,x2,x3 10 numbers which you want to add and that particular function takes
-- only 3 argument maybe so what you should do will you create a new function with 10 args -  not possible
-- hectic

-- function add Type T will be a int you will pass as many numbers as you want to and you can change 
-- the logic as needed

-- I only take concrete Int Values in this example maybe 
identityInt:: Int -> Int
identityInt x = x 

fiveno::Int
fiveno = identityInt 5 

-- a is a type variable that represents any one type
identity:: a -> a
identity x = x 

sevenno::Int
sevenno = identity 7 

true::Bool
true = identity true

{-


aa::Int 
bb::Bool
if we declare this , the first example wont fail

-}
-- it says one type variable is a , next type variable is b , but end result type should be of a 
const :: aa -> bb -> aa 
const x y = x

-- -- will fail because nothing in the type signature suggests that
-- -- `a` and `b` necessarily represent the same type
-- identity1 :: a -> b
-- identity1 x = x

-- -- will fail because we don't know if `a` is `Int`
-- identity2 :: a -> Int
-- identity2 x = x

-- -- will fail because we don't know if `a` is `Int`
-- identity3 :: Int -> a
-- identity3 x = x

-- composite functions - functions can be first class values, you can pass it to variables,
-- functions , 

{-


Global Type Inference 
if you dont pass anything, haskell determines for us 

-}

main :: IO ()
main = do
  putStrLn (hello "Haskell")      -- or any other test
  print  (sumOf3 1 2 3)