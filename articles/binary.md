# How to use Data.Binary

## Basic usage for a data type.

enable the language extention.

```haskell
> :set -XDeriveGeneric
```

import binary package.

```haskell
> import Data.Binary
```

make a data type.

```haskell
> data MyFoo = MyFoo {a::Int, b::String} deriving (Generic, Show, Eq)
```

instanciate the type.

```haskell
> instance Binary MyFoo
```

make an record.

```haskell
> let x1 = MyFoo {a=2, b="foooo"}
> x1
MyFoo {a = 2, b = "foooo"}
```

serialize the record and write to a file.

```haskell
> Data.ByteString.Lazy.writeFile "memo/foooo.bin" $ encode x1
> :! ls -al memo/foooo.bin
-rw-r--r--  1 ogawanaoto  staff  21  6 27 18:22 memo/foooo.bin
```

deserialize from the file.

```haskell
x2 <- (Data.ByteString.Lazy.readFile "memo/foooo.bin" >>= return . decode :: IO MyFoo)
> x2
MyFoo {a = 2, b = "foooo"}
```

check equality.

```haskell
> x1 == x2
True
```

## direct use of the binary package

`haskell
> let a = putWord8 $ fromIntegral .ord $ 'a'
> let b = putWord8 $ fromIntegral .ord $ 'b'
> let c = putWord8 $ fromIntegral .ord $ 'c'
> Data.ByteString.Lazy.writeFile "memo/abc.bin" $ runPut (a >> b >> c)
> :! ls -al memo/abc.bin
-rw-r--r--  1 ogawanaoto  staff  3  6 27 18:43 memo/abc.bin
> :! hexdump memo/abc.bin
0000000 61 62 63
0000003
> abc <- (Data.ByteString.Lazy.readFile "memo/abc.bin" >>= return )
> :t abc
abc :: ByteString
> abc
"abc"
```
