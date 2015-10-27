-- | This module defines functions for working with getters.

module Photons.Getter
  ( (^.)
  , view
  , to
  , module Photons.Types
  ) where

import Prelude ((<<<))

import Data.Const (Const(..), getConst)
import Data.Functor.Contravariant (Contravariant, cmap)
import Data.Profunctor.Star (Star(..), runStar)

import Photons.Types (Getter(), GetterP())

infixl 8 ^.

-- | View the focus of a `Getter`.
view :: forall s t a b. Getter s t a b -> s -> a
view l s = getConst (runStar (l (Star Const)) s)

-- | Synonym for `view`, flipped.
(^.) :: forall s t a b. s -> Getter s t a b -> a
(^.) s l = view l s

-- | Convert a function into a getter.
to :: forall s a f. (Contravariant f) => (s -> a) -> GetterP s a
to f p = Star (cmap f <<< runStar p <<< f)
