module Numeric.Probability.Example.Coin where

import qualified Numeric.Probability.Distribution as Dist
import Numeric.Probability.Distribution ((??), )
import Control.Monad (liftM2, replicateM)

type Coin = Int

type Probability = Rational
type Dist = Dist.T Probability

coin :: Dist Coin
coin = Dist.uniform [1..2]

-- | product of independent distributions
twoCoins :: Dist (Coin,Coin)
twoCoins = liftM2 (,) coin coin

coins :: Int -> Dist [Coin]
coins = flip replicateM coin


twoHeads :: Probability
twoHeads = (==(1,1)) ?? twoCoins

{- |
@heads p n@ computes the probability of getting
p heads (@>1@, @==2@, ...) when flipping n coins
-}
heads :: (Int -> Bool) -> Int -> Probability
heads p n = (p . length . filter (==1)) ?? coins n