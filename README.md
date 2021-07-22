# Exploration of probability Package for Haskell

This repo contains an exploration exercise of the probability package in Haskell. The package was developed by Martin Erwig and Steve Kollmansberger of Oregon State University. 

The documentation for the package can be found here: https://hackage.haskell.org/package/probability
The original paper for the package can be found here: http://web.engr.oregonstate.edu/~erwig/papers/PFP_JFP06.pdf

With the use of this package, we can leverage the advantages of Haskell to solve discrete probability problems with efficent and concise programs. I have explored the package contributing additions to the following files.

1) Monty Hall Problem with Additional Door: I modified the original Monty Hall problem by adding an additional door to the constructor. This file behaves exactly as outlined in the documentation. 

2) Coin Flip: I added a file that simulates the probability distributions of flipping a two sided coin. This file is based on the Dice program included in the package. 

## Set Up and Background

This repo contains two files that can be loaded by the user: "Coin.hs" and "MontyHallAdj.hs". In order to use these files, the probaility Package for Haskell from Hackage will need to be imported. I recommend using Cabal to import the package. 

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

In the probability Package, one of the files is Dice which replicates the uniform distribution of rolling dice or die. 





