# Exploration of probability Package for Haskell

This repo contains an exploration exercise of the probability package in Haskell. The package was developed by Martin Erwig and Steve Kollmansberger of Oregon State University. 

The documentation for the package can be found here: https://hackage.haskell.org/package/probability
The original paper for the package can be found here: http://web.engr.oregonstate.edu/~erwig/papers/PFP_JFP06.pdf

With the use of this package, we can leverage the advantages of Haskell to solve discrete probability problems with efficent and concise programs. I have explored the package contributing additions to the following files.

1) Monty Hall Problem with Additional Door: I modified the original Monty Hall problem by adding an additional door to the constructor. This file behaves exactly as outlined in the documentation. 

2) Coin Flip: I added a file that simulates the probability distributions of flipping a two sided coin. This file is based on the Dice program included in the package. 

## Set Up and Background

This repo contains two files that can be loaded by the user: "Coin.hs" and "MontyHallAdj.hs". In order to use these files, the probaility Package for Haskell from Hackage will need to be imported. I recommend using Cabal to import the package and set up the ghci environment. 

The package models probabilitistic events as collection of all possible values as "Dist". This newtype can  be thought of as a sample space of some probabilistic event. Independent events can be modeled by simply the product of two probabilities which is done by a lifting function in the package. For events that are not independent, the package leverages the use of Monads. For example, if event b depends on event a, where the first event a is of type "Dist", event b is a function of type "a -> Dist b" which is simply a bind operation where "Dist" is a monad. With the use of monads, modeling probablistic events where the state changes (selections dependent on previous seletions) is possible. 

## Monty Hall Problem

A popular problem in probability theory is called the "Monty Hall Problem". In this problem, a contestant on a game show picks a door out of a number of doors (the traditional problem is three doors). Behind one of these doors is a car  and the behind the rest of the others are goats. The game show host then reveals one of the doors that the contestant has not picked and reveals a goat. The contestant then has the opportunity to pswap for another door. The contestant is also given the choice to switch the door he has chosen. Should the contestant switch?  

The answer to this problem is yes. 

#### Additional Doors

As mentioned in the original paper, it was very easy to change the distribution of the game. This was done by simply adding another door to the "Door" constructor. 

```
data Door = A | B | C | D
            deriving (Eq,Ord,Show)

doors :: [Door]
doors = [A,B,C,D]
```
With the additional door, the game choices changes to 
 
## Coin Flip

In the probability Package, one of the programs included is Dice which replicates the uniform distribution of rolling dice or die. I used this template to create a similar program, but for flipping a coin. As with the Dice program, a uniform distribution is applied in the constructor. Instead of modeling six sides of a dice, we simply model the two sides of a coin, with 1 being Heads and 2 being Tails as per below. 

```
coin :: Dist Coin
coin = Dist.uniform [1..2]
```
Similar to the Dice program, we can call for the probaility of "twoHeads" which isn't too interesting but demonstrates the functionality of the program. As seen from the code below, we can see that "twoHeads" is part of the class "Probability". The implementation draws on twoCoins, which is of class "Dist" which we defined earlier. We simply set, these two Coins to "1" which is Heads; of course it would be exactly the same if we want Tails. The probability is then simply done with a lifting function and is just the product of the two, which we see when running ghci is 1/4 (1/2 * 1/2). 

```
twoHeads :: Probability
twoHeads = (==(1,1)) ?? twoCoins

-- | product of independent distributions
twoCoins :: Dist (Coin,Coin)
twoCoins = liftM2 (,) coin coin
```
```
ghci> twoHeads
1 % 4
```
Things get more interesting when we look at "heads". This program will output the probality of getting a certain number of heads (or tails) given a number of coin flips. The underlying code uses "length" and "filter" from prelude, as well as our created class "coins". As per the example below, the probablity of getting an outcome of at least 2 heads from flipping 4 coins is 11 / 16. 

```
{- |
@heads p n@ computes the probability of getting
p heads (@>1@, @==2@, ...) when flipping n coins
-}
heads :: (Int -> Bool) -> Int -> Probability
heads p n = (p . length . filter (==1)) ?? coins n
```
```
ghci> heads (>=2) 4
11 % 16

```
