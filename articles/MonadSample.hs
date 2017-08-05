module MonadExample where

import Control.Monad.Reader
import Control.Monad.Writer
import Control.Monad.State
import Control.Monad.Identity
import Control.Monad.IO.Class

import Data.Char


main = do
  putStrLn "Monad Examples"

{-

     <------->         => Context
     |       |
     Monad   A   X
     |       |   |
     |       |   +-----=> type of a value produced by monadic operations ; usually somtehing "returned", that is, a  bindable value.
     |       |  
     |       +---------=> type of a value handled in  monadic operations ; "contexted value"
     |
     +---------------- => specify operations in this context 

     
     Monad A X and Monad A Y can be composable
     ^^^^^^^       ^^^^^^^
           |             |
           ---------------

     Monad A X and Monad B Y cannot be composable
     ^^^^^^^       ^^^^^^^
           |             |
           ---------------


-}

--
-- Reader
--

reader1 :: Reader [Int] Int  -- This reader monad handle list of int, and then produced int value
reader1 = do
  e <- ask                   -- type of e is [Int]
  return $ length e

reader2 :: Reader [Int] Char
reader2 = do
  e <- ask
  return $ chr $ head e
  
reader3 :: Reader [Int] [Int]
reader3 = do
  e <- ask
  return $ map (*2) e

reader123 :: Reader [Int] String
reader123 = do
  r1 <- reader1
  r2 <- reader2
  r3 <- reader3
  return $ (show r1) ++ " / " ++ (show r2) ++ " / " ++ (show r3)

--
-- Writer 
--

writer1 :: Writer String Int   -- This writer monad handle string, and then produced int value
writer1 = do
  tell "111"                   -- tell :: [Char] -> WriterT String Identity ()
  return 1

writer2 :: Writer String Char
writer2 = do
  tell "222"
  return 'a'
  
writer3 :: Writer String [Int]
writer3 = do
  tell "333"
  return []

writer123 :: Writer String String
writer123 = do
  r1 <- writer1
  r2 <- writer2
  r3 <- writer3
  return $ (show r1) ++ " / " ++ (show r2) ++ " / " ++ (show r3)

--
-- State
--

state1 :: State Int Int -- This state monad handle int, and then produced int value
state1 = do
  s1 <- get             -- 
  put (s1+1)
  return 1

state2 :: State Int Char
state2 = do
  s1 <- get
  put (s1+1)
  return 'a'
  
state3 :: State Int [Int]
state3 = do
  s1 <- get
  put (s1+1)
  return []

state123 :: State Int String
state123 = do
  r1 <- state1
  r2 <- state2
  r3 <- state3
  return $ (show r1) ++ " / " ++ (show r2) ++ " / " ++ (show r3)

{-
> runState state1 1
(1,2)
> runState state2 1
('a',2)
> runState state3 1
([],2)
> runState state123 1
("1 / 'a' / []",4)
-}


--
-- Identity
--

identity1 :: Identity Int -- This state monad handle nothing, and then produced int value
identity1 = do 
  return 1

identity2 :: Identity Char
identity2 = do 
  return 'a'

identity3 :: Identity [Char] 
identity3 = do 
  return ['a','b']

identity123 :: Identity String
identity123 = do
  r1 <- identity1
  r2 <- identity2
  r3 <- identity3
  return $ (show r1) ++ " , " ++ (show r2) ++ " , " ++ (show r3)

