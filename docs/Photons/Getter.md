## Module Photons.Getter

This module defines functions for working with getters.

#### `view`

``` purescript
view :: forall s t a b. Getter s t a b -> s -> a
```

View the focus of a `Getter`.

#### `(^.)`

``` purescript
(^.) :: forall s t a b. s -> Getter s t a b -> a
```

_left-associative / precedence 8_

Synonym for `view`, flipped.

#### `to`

``` purescript
to :: forall s a f. (Contravariant f) => (s -> a) -> GetterP s a
```

Convert a function into a getter.


