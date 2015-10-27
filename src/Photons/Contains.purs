module Photons.Contains where

import Prelude

-- import Data.Set (Set(), delete, insert, member)

import Photons.Index.Class (IndexKey)
import Photons.Types (LensP())

class (IndexKey m a) <= Contains m a where
  contains :: a -> LensP m Boolean

-- instance containsSet :: (Ord k) => Contains (Set k) k where
--   contains k f s =
--     (\b -> if b then insert k s else delete k s) <$> f (member k s)
