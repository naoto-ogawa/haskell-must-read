# Protocol Buffer Tutorial on Haskell.

## Make a difinition

```sh
$ nvim memo/person.proto
```

##  Generate haskell files

```sh
$ .cabal-sandbox/bin/hprotoc -I memo/ -d ./src/ memo/*.proto
Loading filepath: "/Users/foo/protocolbuffer/memo/person.proto"
All proto files loaded
Haskell name mangling done
Recursive modules resolved
./src/MemoPerson/Person.hs
./src/MemoPerson/Person/PhoneNumber.hs
./src/MemoPerson/Person/PhoneType.hs
./src/MemoPerson.hs
Processing complete, have a nice day.
```

## Make some code

```haskell
{-# LANGUAGE ScopedTypeVariables #-}

module MyProtoBuf where 

import Data.Sequence 
import Text.ProtocolBuffers
import Text.ProtocolBuffers.Header 
import qualified Data.ByteString.Lazy as BL
import MemoPerson.Person
import MemoPerson.Person.PhoneType
import MemoPerson.Person.PhoneNumber

main = do
   putStrLn "*****  protocol buffer sample start!"
   putStrLn $ messagePutText per1
   -- output
   putStrLn "***** writing to the file...."
   BL.writeFile "abc.b" $ messagePut per1
   -- input
   putStrLn "***** reading from the file...."
   binary <- BL.readFile "abc.b"
   case messageGet binary of
      Left msg -> putStrLn msg 
      Right ((p :: Person),_) -> putStrLn $ messagePutText p
   where 
     pn1 = PhoneNumber (uFromString "03-9999-9999") (Just WORK)
     pn2 = PhoneNumber (uFromString "03-9999-0000") (Just MOBILE)
     per1 = Person (uFromString "あああ") 2 (Just (uFromString "mymail@example.com")) (fromList [pn1, pn2])
```

## Run the code

```sh
*MyProtoBuf> main
*****  protocol buffer sample start!
name: "\227\129\130\227\129\130\227\129\130"
id: 2
email: "mymail@example.com"
phone {
  number: "03-9999-9999"
  type: WORK
}
phone {
  number: "03-9999-0000"
  type: MOBILE
}
***** writing to the file....
***** reading from the file....
name: "\227\129\130\227\129\130\227\129\130"
id: 2
email: "mymail@example.com"
phone {
  number: "03-9999-9999"
  type: WORK
}
phone {
  number: "03-9999-0000"
  type: MOBILE
}
*MyProtoBuf>
```

## Check the binary file.

```sh
$ hexdump -C abc.b
00000000  0a 09 e3 81 82 e3 81 82  e3 81 82 10 02 1a 12 6d  |...............m|
00000010  79 6d 61 69 6c 40 65 78  61 6d 70 6c 65 2e 63 6f  |ymail@example.co|
00000020  6d 22 10 0a 0c 30 33 2d  39 39 39 39 2d 39 39 39  |m"...03-9999-999|
00000030  39 10 02 22 10 0a 0c 30  33 2d 39 39 39 39 2d 30  |9.."...03-9999-0|
00000040  30 30 30 10 00                                    |000..|
00000045
$
```


