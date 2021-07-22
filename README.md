# Exploration of probability Package for Haskell

This repo contains an exploration exercise of the probability package in Haskell. The package was developed by Martin Erwig and Steve Kollmansberger of Oregon State University. 

The documentation for the package can be found here: https://hackage.haskell.org/package/probability
The original paper for the package can be found here: http://web.engr.oregonstate.edu/~erwig/papers/PFP_JFP06.pdf

With the use of this package, we can leverage the advantages of Haskell to solve discrete probability problems with efficent and concise programs. I have explored the package contributing additions to the following files.

1) Monty Hall Problem with Additional Door: I modified the original Monty Hall problem by adding an additional door to the constructor. This file behaves exactly as outlined in the documentation. 

2) Coin Flip: I added a file that simulates the probability distributions of flipping a two sided coin. This file is based on the Dice program included in the package. 

## Set Up and Background

This repo contains two files that can be loaded by the user: "Coin.hs" and "MontyHallAdj.hs". In order to use these files, the probaility Package for Haskell from Hackage will need to be imported. I recommend using Cabal to import the package and set up the GHCI environment. 

The foundation of this package leverages the use of Monads. Independent events can be modeled by simply the product of two probabilities, but for events where one event depends on another.. 

## Monty Hall Problem

A popular problem in probability theory is called the "Monty Hall Problem". In this problem, a contestant is 

#### Additional Doors

As mentioned in the original paper, it was very easy to change the distribution of the game. This was done by simply adding another door to the "Door" constructor. 

```
data Door = A | B | C | D
            deriving (Eq,Ord,Show)

doors :: [Door]
doors = [A,B,C,D]
```
With the additional door, the game  
 
## Coin Flip

In the probability Package, one of the programs included is Dice which replicates the uniform distribution of rolling dice or die. I used this template to create a similar program, but for flipping a coin. As with the Dice program, a uniform distribution is applied in the constructor. Instead of modeling six sides, we simply model the two sides of a coin, with 1 being Heads and 2 being Tails. 

```
coin :: Dist Coin
coin = Dist.uniform [1..2]
```

```
twoHeads :: Probability
twoHeads = (==(1,1)) ?? twoCoins
```


```
ghci> twoHeads
1 % 4
```



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

