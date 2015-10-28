-- | This module defines types for working with lenses.

module Photons.Types
  ( module Photons.Types
  , module Photons.Internal.Exchange
  , module Photons.Internal.Market
  , module Photons.Internal.Shop
  , module Photons.Internal.Tagged
  , module Photons.Internal.Wander
  ) where

import Data.Const (Const())
import Data.Maybe.First (First())
import Data.Profunctor (Profunctor)
import Data.Profunctor.Choice (Choice)
import Data.Profunctor.Star (Star())
import Data.Profunctor.Strong (Strong)

import Photons.Internal.Exchange (Exchange(..))
import Photons.Internal.Market (Market(..))
import Photons.Internal.Shop (Shop(..))
import Photons.Internal.Tagged (Tagged(..), unTagged)
import Photons.Internal.Wander (Wander, wander)

-- | A general-purpose Photons.
type Optic p s t a b = p a b -> p s t
type OpticP p s a = Optic p s s a a

-- | A generalized isomorphism.
type Iso s t a b = forall p. (Profunctor p) => Optic p s t a b
type IsoP s a = Iso s s a a

type AnIso s t a b = Optic (Exchange a b) s t a b
type AnIsoP s a = AnIso s s a a

-- | A lens.
type Lens s t a b = forall p. (Strong p) => Optic p s t a b
type LensP s a = Lens s s a a

type ALens s t a b = Optic (Shop a b) s t a b
type ALensP s a = ALens s s a a

-- | A prism.
type Prism s t a b = forall p. (Choice p) => Optic p s t a b
type PrismP s a = Prism s s a a

type APrism s t a b = Optic (Market a b) s t a b
type APrismP s a = APrism s s a a

-- | A traversal.
type Traversal s t a b = forall p. (Wander p) => Optic p s t a b
type TraversalP s a = Traversal s s a a

-- | A getter.
type Getter s t a b = Fold a s t a b
type GetterP s a = Getter s s a a

-- | A setter.
type Setter s t a b = Optic Function s t a b
type SetterP s a = Setter s s a a

-- | A review.
type Review s t a b = Optic Tagged s t a b
type ReviewP s a = Review s s a a

-- | A fold.
type Fold r s t a b = Optic (Star (Const r)) s t a b
type FoldP r s a = Fold r s s a a
