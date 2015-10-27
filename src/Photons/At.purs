module Photons.At where

import Prelude

-- import Data.Identity (runIdentity, Identity(..))
-- import Data.Map as M
import Data.Maybe (Maybe(..), maybe)
-- import Data.Set as S
-- import Data.StrMap as SM

import Photons.Index (Index)
import Photons.Types (LensFP())

class (Index m a b) <= At m a b where
  at :: a -> LensFP m (Maybe b)

-- instance atIdentity :: At (Identity a) Unit a where
--   at _ ma2fMa i@(Identity a) = maybe i Identity <$> ma2fMa (Just a)

-- instance atMaybe :: At (Maybe a) Unit a where
--   at _ = ($)

-- instance atSet :: (Ord v) => At (S.Set v) v Unit where
--   at v mu2fMu s = go <$> mu2fMu s'
--     where s' = if S.member v s then Just unit else Nothing
--           go Nothing  = maybe s (\_ -> S.delete v s) s'
--           go (Just _) = S.insert v s

-- instance atMap :: (Ord k) => At (M.Map k v) k v where
--   at k mv2fMv m = go <$> mv2fMv m'
--     where
--       m' = M.lookup k m
--       go Nothing  = maybe m (\_ -> M.delete k m) m'
--       go (Just v) = M.insert k v m

-- instance atStrMap :: At (SM.StrMap v) String v where
--   at k mv2fMv sm = go <$> mv2fMv sm'
--     where
--       sm' = SM.lookup k sm
--       go Nothing  = maybe sm (\_ -> SM.delete k sm) sm'
--       go (Just v) = SM.insert k v sm
