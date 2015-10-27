module Photons.Contains
  ( Contains
  , contains
  ) where

import Prelude

import Data.Profunctor
import Data.Profunctor.Strong
import Data.Set as S
import Data.Tuple

import Photons.Index.Class (IndexKey)
import Photons.Types (Lens(), LensP())

class (IndexKey m a) <= Contains m a where
  contains :: a -> LensP m Boolean

instance containsSet :: (Ord k) => Contains (S.Set k) k where
  contains x = lens (S.member x) \xs b -> if b then S.insert x xs else S.delete x xs

lens :: forall s t a b. (s -> a) -> (s -> b -> t) -> Lens s t a b
lens f g = dimap (f &&& id) (\(Tuple a b) -> g b a) <<< first
