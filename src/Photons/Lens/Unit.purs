module Photons.Lens.Unit where

import Prelude

import Photons.Lens (LensP(), lens)

-- | There is a `Unit` in everything.
united :: forall a. LensP a Unit
united = lens (const unit) const
