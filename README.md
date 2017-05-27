# haskell-must-read
must-read articles, papers, QAs and so on.

## String

* Untangling Haskell's Strings
 * https://mmhaskell.com/blog/2017/5/15/untangling-haskells-strings


## for all

* http://stackoverflow.com/questions/10753073/whats-the-theoretical-basis-for-existential-types/10753957#10753957
** Explain why "Existential" of ExistentialQuantification extension means "Unviversal" of for all.
* https://en.wikibooks.org/wiki/Haskell/Existentially_quantified_types
* http://iveselov.info/posts/2012-08-30-existential-types.html

## Point Free Style

* (.) . (.)
  * http://stackoverflow.com/questions/17585649/composing-function-composition-how-does-work
  * http://austinrochford.com/posts/2013-10-21-generalized-composition-in-haskell.html 

## Function Application vs Function Composition

*  https://www.haskell.org/tutorial/functions.html
> Function application has higher precedence than any infix operator
 ** Examples
```haskell
a b . c d
--->
OK --> (a b) . (c d)
NG -->  a (b . c) d
```
```haskell
> gcd 5 (5^2)
5
> gcd 5 5^2
25
> (gcd 5 5)^2
```
```haskell
let f = undefined :: Char -> Char
let g = undefined :: Char -> Char
let z x = g (f x)    --> OK
let z x = g $ f x    --> OK
let z x = g . f x    --> NG
let z x = (g . f) x  --> OK
let z   = g . f      --> OK
```

## Type Familly

### Injectivity
* http://stackoverflow.com/questions/36268734/type-families-causes-ambiguous-variable-erroro


## Monad

### Application of Monad
* http://blog.aloni.org/posts/extending-monads-for-debugging-in-haskell/

### MonadBaseControl
* http://stackoverflow.com/questions/11694299/what-is-monadbasecontrol-for
* http://www.yesodweb.com/book/monad-control




## Language extentions

### DataKind, PolyKinds
* http://www.konn-san.com/prog/2013-advent-calendar.html


## GHC

### GHC-mod
* http://stackoverflow.com/questions/30518927/how-to-avoid-main-is-not-defined-in-module-main-when-using-syntastic

## Cabal

### How to configure for testing
* http://blog.pangyanhan.com/haskell/2013-12-22-cabal-installing-test-dependencies.html

## TypeCheck
* Debug Log
  * http://stackoverflow.com/questions/30442003/unreadable-quickcheck-log-file-after-a-test-routine

## Language
* Namespace Conflict
  * http://stackoverflow.com/questions/42846194/ambiguous-interface



# Servant-must-read

## articles
* Servant, Type Families, and Type-level Everything A look at advanced GHC features used in Servant
 * https://arow.info/blog/posts/2015-07-10-servant-intro.html
* Implementing a minimal version of haskell-servant
 * https://www.well-typed.com/blog/2015/11/implementing-a-minimal-version-of-haskell-servant
* Passing a DB connection to handlers in Servant
 * http://oleg.fi/gists/posts/2017-03-03-servant-and-db.html
* Error Handling
 * [servant-checked-exceptions](https://functor.tokyo/blog/2017-05-10-servant-checked-exceptions)
## Useful QA
* [Docs explaining how to actually create a full combinator (ex. one to create/store a DB connection)](https://github.com/haskell-servant/servant/issues/704#issuecomment-283396827)
## migration guide
* to 0.7
 * https://github.com/klappvisor/haskell-telegram-api/issues/21


## How to do ..
* Access Request Headers
  * http://stackoverflow.com/questions/36307378/how-can-i-get-access-to-http-headers-in-servant


# Haskell Quote Unquote 
* Type 
  * A Type is a kind of label that every expression has.
  * A Type is an invariant condition. 
  * :: is pronounced "has type"
* Kind
  * a kind is a type of types
* Boxed And UnBoxed 
  * Boxed  means that values of that type are represented by a pointer to a heap object.
  * An unboxed type, however, is represented by the value itself, no pointers or heap allocation are involved.
* Covariant and Contravariant
  * Intuitively, a covariant type is produced, and a contravariant type is consumed.
  * If a function type a -> b appears in a covariant position, then a is in a contravariant position and b is in a covariant position. 
  * If a function type a -> b appears in a contravariant position, then a is in a covariant position and b is in a contravariant position.
* Ad hoc Parametricity
  * The purpose of " => x" is to constrain the set of possible types that the x type variable can take.
* Type classes
  * Type classes group different types with a common interface.
  * you can think of a type class as a way to group sets of types that support the same operations.
  * Typeclasses are Haskell’s version of interfaces (in languages like Golang or Java).
* data
  * is [d]efined [a] [t]ype [a]nd (values)
    * Note that you can defined a type without values.



