module Photons.Lens.Void where

import Prelude (const)

import Data.Void (Void(), absurd)

import Photons.Lens (LensP(), lens)

-- | There is everything in `Void`.
devoid :: forall a. LensP Void a
devoid = lens absurd const
