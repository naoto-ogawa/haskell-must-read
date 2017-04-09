# haskell-must-read
must-read articles, papers, QAs and so on.

## for all

* http://stackoverflow.com/questions/10753073/whats-the-theoretical-basis-for-existential-types/10753957#10753957
** Explain why "Existential" of ExistentialQuantification extension means "Unviversal" of for all.
* https://en.wikibooks.org/wiki/Haskell/Existentially_quantified_types

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
* http://stackoverflow.com/questions/36268734/type-families-causes-ambiguous-variable-error

