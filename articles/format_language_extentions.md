
# Format language extentions in VIM.

## A sample language extention.

```haskell
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE PackageImports #-}
{-# LANGUAGE RankNTypes #-}
```

## 1st Try

We type

```sh
:'<,'>Tabularize /
```

We have

```haskell
{-#   LANGUAGE   DataKinds                    #-}
{-#   LANGUAGE   DeriveFunctor                #-}
{-#   LANGUAGE   FlexibleContexts             #-}
{-#   LANGUAGE   GeneralizedNewtypeDeriving   #-}
{-#   LANGUAGE   OverloadedStrings            #-}
{-#   LANGUAGE   TypeOperators                #-}
{-#   LANGUAGE   PackageImports               #-}
{-#   LANGUAGE   RankNTypes                   #-}
```

## 2nd Try

If we read the Tabular [doc](https://raw.githubusercontent.com/godlygeek/tabular/master/doc/Tabular.txt), we find an example ```:Tabularize /,/r0```. So we type 

```
:'<,'>Tabularize / /r0
```

We have

```haskell
{-# language                  datakinds #-}
{-# language              derivefunctor #-}
{-# language           flexiblecontexts #-}
{-# language generalizednewtypederiving #-}
{-# language          overloadedstrings #-}
{-# language              typeoperators #-}
{-# language             packageimports #-}
{-# language                 rankntypes #-}
```

### 3rd Try

We will notice ```r``` in r0 stands for right. So we type

```sh
:'<,'>Tabularize / /l0
```

We have

```haskell
{-# LANGUAGE DataKinds                  #-}
{-# LANGUAGE DeriveFunctor              #-}
{-# LANGUAGE FlexibleContexts           #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE OverloadedStrings          #-}
{-# LANGUAGE TypeOperators              #-}
{-# LANGUAGE PackageImports             #-}
{-# LANGUAGE RankNTypes                 #-}
```



