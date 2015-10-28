## Module Photons.Internal.Tagged

This module defines the `Tagged` profunctor

#### `Tagged`

``` purescript
newtype Tagged a b
  = Tagged b
```

##### Instances
``` purescript
instance taggedProfunctor :: Profunctor Tagged
instance taggedChoice :: Choice Tagged
```

#### `unTagged`

``` purescript
unTagged :: forall a b. Tagged a b -> b
```


