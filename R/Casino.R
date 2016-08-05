#======================================================#
#====== CASINO GAME ======#
#======================================================#

# Author: Anastasia Kaiser (anastasiakaiser@gmail.com)

#Suppose a casino invents a new game that you must pay $250 to play. The game works like this: The casino draws random numbers between 0 and 1, from a uniform distribution. It adds them together until their sum is greater than 1, at which time it stops drawing new numbers. You get a payout of $100 each time a new number is drawn.
#For example, suppose the casino draws 0.4 and then 0.7. Since the sum is greater than 1, it will stop after these two draws, and you receive $200. If instead it draws 0.2, 0.3, 0.3, and then 0.6, it will stop after the fourth draw and you will receive $400. Given the $250 entrance fee, should you play the game?

#generate a string of random numbers between 0 and 1 
#add them up and see if they're greater than one -> keep looping until they are and count how many numbers it took before you went bust

games <- rep(0,10000)

for (i in 1:10000) {

d <- 0
loops <- 0 
while(d <= 1) {
  loops = loops+1
  d <- d + runif(1)
}
games[i] <- loops
}
mean(games)

#2.7178


#Yes, you should play because your expected winnings are $20 ($270 on average - $250 fee)

