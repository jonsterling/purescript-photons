module Photons.At where

import Prelude

import Data.Identity (runIdentity, Identity(..))
import Data.Map as M
import Data.Maybe (Maybe(..), maybe)
import Data.Set as S
import Data.StrMap as SM
import Data.Tuple

import Photons.Index (Index)
import Photons.Types (LensP(), Lens())
import Data.Profunctor
import Data.Profunctor.Strong

class (Index m a b) <= At m a b where
  at :: a -> LensP m (Maybe b)

lens :: forall s t a b. (s -> a) -> (s -> b -> t) -> Lens s t a b
lens f g = dimap (f &&& id) (\(Tuple a b) -> g b a) <<< first

instance atIdentity :: At (Identity a) Unit a where
  at _ = lens (Just <<< runIdentity) (flip maybe Identity)

instance atMaybe :: At (Maybe a) Unit a where
  at _ = lens id \_ -> id

instance atSet :: (Ord v) => At (S.Set v) v Unit where
  at x = lens get (flip update)
    where
      get xs =
        if S.member x xs
           then Just unit
           else Nothing
      update Nothing = S.delete x
      update (Just _) = S.insert x

instance atMap :: (Ord k) => At (M.Map k v) k v where
  at k =
    lens (M.lookup k) \m ->
      maybe (M.delete k m) \v -> M.insert k v m

instance atStrMap :: At (SM.StrMap v) String v where
  at k =
    lens (SM.lookup k) \m ->
      maybe (SM.delete k m) \ v -> SM.insert k v m
