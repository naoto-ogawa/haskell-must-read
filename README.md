# haskell-must-read
must-read articles, papers, QAs and so on.

## for all

* http://stackoverflow.com/questions/10753073/whats-the-theoretical-basis-for-existential-types/10753957#10753957
** Explain why "Existential" of ExistentialQuantification extension means "Unviversal" of for all.
* https://en.wikibooks.org/wiki/Haskell/Existentially_quantified_types
* http://iveselov.info/posts/2012-08-30-existential-types.html

## Point Free Style

* http://stackoverflow.com/questions/17585649/composing-function-composition-how-does-work
** (.) . (.)

## Function Application vs Function Composition

*  https://www.haskell.org/tutorial/functions.html
> Function application has higher precedence than any infix operator
```haskell
a b . c d
--->
OK --> (a b) . (c d)
NG -->  a (b . c) d
```

## Type Familly

### Injectivity
* http://stackoverflow.com/questions/36268734/type-families-causes-ambiguous-variable-erroro


## Monad

### MonadBaseControl
* http://stackoverflow.com/questions/11694299/what-is-monadbasecontrol-for
* http://www.yesodweb.com/book/monad-control

## GHC

### GHC-mod
* http://stackoverflow.com/questions/30518927/how-to-avoid-main-is-not-defined-in-module-main-when-using-syntastic

## Cabal

### How to configure for testing
* http://blog.pangyanhan.com/haskell/2013-12-22-cabal-installing-test-dependencies.html



# Servant-must-read

## How to do ..
* Access Request Headers
  * http://stackoverflow.com/questions/36307378/how-can-i-get-access-to-http-headers-in-servant

