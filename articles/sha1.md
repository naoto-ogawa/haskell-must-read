# How to Crypto in Haskell 

## Package

http://hackage.haskell.org/package/cryptonite

cf. The cryptohash package is deprecated.


## install

```sh
$ cabal install cryptonite
Warning: The package list for 'hackage.haskell.org' is 35 days old.
Run 'cabal update' to get the latest list of available packages.
Resolving dependencies...
Notice: installing into a sandbox located at
foo/.cabal-sandbox
Configuring foundation-0.0.9...
Building foundation-0.0.9...
Installed foundation-0.0.9
Configuring memory-0.14.5...
Building memory-0.14.5...
Installed memory-0.14.5
Configuring cryptonite-0.23...
Building cryptonite-0.23...
Installed cryptonite-0.23
Updating documentation index
foo/.cabal-sandbox/share/doc/x86_64-osx-ghc-8.0.1/index.html
```

## How to make SHA1 

```haskell
*Main> import qualified Data.ByteString.Char8 as B8
*Main B8> import qualified Data.ByteArray as DBA
*Main B8 DBA> import qualified Crypto.Hash as H

*Main B8 DBA H> H.hash $ B8.pack "The quick brown fox jumps over the lazy dog" :: H.Digest H.SHA1
2fd4e1c67a2d28fced849ee1bb76e7391b93eb12

*Main B8 DBA H> DBA.length (H.hash $ B8.pack "The quick brown fox jumps over the lazy dog" :: H.Digest H.SHA1)
20

*Main B8 DBA H>
```

## Misc

```haskell
*Main B8 DBA H> H.hashBlockSize H.SHA1
64

*Main B8 DBA H> H.hashDigestSize H.SHA1
20
```


