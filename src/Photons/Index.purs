module Photons.Index where

import Prelude

-- import Data.Identity (Identity(..))
-- import Data.Map as M
-- import Data.Maybe (maybe, Maybe(..))
-- import Data.Set as S
-- import Data.StrMap as SM

import Photons.Index.Class (IndexKey, IndexValue)
import Photons.Types (TraversalP())

class (IndexKey m a, IndexValue m b) <= Index m a b where
  ix :: a -> TraversalP m b

-- instance indexArr :: (Eq e) => Index (e -> a) e a where
--   ix e a2fa e2a = (\a e' -> if e == e' then a else e2a e') <$> a2fa (e2a e)

-- instance indexMaybe :: Index (Maybe a) Unit a where
--   ix _ _    Nothing  = pure Nothing
--   ix _ a2fa (Just a) = Just <$> a2fa a

-- instance indexIdentity :: Index (Identity a) Unit a where
--   ix _ a2fa (Identity a) = Identity <$> a2fa a

-- instance indexArray :: Index (Array a) Number a where
--   ix n _    as | n < 0 = pure as
--   ix _ _    []         = pure []
  -- ix 0 a2fa (a:as)     = a2fa a <#> \a' -> a':as
  -- ix n a2fa (a:as)     = (:) a <$> ix (n - 1) a2fa as

-- instance indexSet :: (Ord a) => Index (S.Set a) a Unit where
--   ix a u2fu s = if S.member a s then pure $ S.insert a s else pure s

-- instance indexMap :: (Ord k) => Index (M.Map k v) k v where
--   ix k v2fv m = M.lookup k m # maybe (pure m) \v ->
--     (\v' -> M.insert k v' m) <$> v2fv v

-- instance indexStrMap :: Index (SM.StrMap v) String v where
--   ix str v2fv sm = SM.lookup str sm # maybe (pure sm) \v ->
--     (\v' -> SM.insert str v' sm) <$> v2fv v
