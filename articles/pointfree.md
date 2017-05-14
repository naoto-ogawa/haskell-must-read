# Point Free Stype

## How to

```haskell
(1)
foo x =  ... x ...
|                             
|  rewrite to push x to the last position (2-1 or 2-2).
|
(2-1)
foo x = (...) x
|   ^         ^
|  remove the variable x.
|
(2-2)
foo x = (\x -> (...)) x
|   ^     ^           ^             
|  remove the variable x.
|
(4)
foo   = (...)
```

## Example -- One Variable

```haskell
*Main> filter (\x -> x > 5) [1..10]
[6,7,8,9,10]
```

```haskell
*Main> filter (\x -> 5 < x) [1..10]
[6,7,8,9,10]
```

```haskell
*Main> filter (\x -> (<) 5 x) [1..10]
[6,7,8,9,10]
```

```haskell
*Main> filter ((<) 5) [1..10]
[6,7,8,9,10]
*Main>
```

## Example -- Two Variables

```haskell
*Main> zipWith (\x y -> x * y) [1,2,3] [4,5,6]
[4,10,18]
```

```haskell
*Main> zipWith (\x y -> (*) x y) [1,2,3] [4,5,6]
[4,10,18]
```

```haskell
*Main> zipWith ((*)) [1,2,3] [4,5,6]
[4,10,18]
```

```haskell
*Main> zipWith (*) [1,2,3] [4,5,6]
[4,10,18]
```

## Common Rewrite Patterns

```haskell
g $ f x
```

This is not equals to ```(g $ f) x```, so you can't remove this ```x```. Instead, we can rewrite as follows:

```haskell
g (f x)
```

In the above expression, however, we can't remove x, because x is in parentheses. You will notice that the expression is the definition of function composition, so we rewrite as follows: 

```haskell
(g . f) x
```  

then, we have

```haskell
g . f
```  

## Resources

 * http://stackoverflow.com/questions/14350871/pointfree-or-library-function-for-applying-two-functions-to-single-input
 * http://pointfree.io

--


