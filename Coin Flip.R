# Consider a hot new bar game. It’s played with a coin, between you and a friend, on a number line stretching from negative infinity to positive infinity. (It’s a very, very long bar.) You are assigned a winning number, the negative integer -X, and your friend is assigned his own winning number, a positive integer, +Y. A marker is placed at zero on the number line. Then the coin is repeatedly flipped. Every time the coin lands heads, the marker is moved one integer in a positive direction. Every time the coin lands tails, the marker moves one integer in a negative direction. You win if the coin reaches -X first, while your friend wins if the coin reaches +Y first. (Winner keeps the coin.)
# 
# How long can you expect to sit, flipping a coin, at the bar? Put another way, what is the expected number of coin flips in a complete game?

coin_flip <- function(N){
running_tally <- 0
loops <- 0

while (running_tally < N & running_tally > -N){
a <- sample(c('H','T'),size=1)
if (a == 'H') {running_tally = running_tally - 1
} else if (a == 'T') {running_tally = running_tally + 1}
loops <- loops + 1
}
return(loops)
}

coin_flip(3)

sim <- replicate(100,coin_flip(N = 100))
print(sim) 

#so it looks like we're going to infinity here...let's plot this out to understand the pattern of the series

a <- c(1:100)
results <- replicate(100, lapply(a, coin_flip))
                     
output <- matrix(unlist(results), ncol = 100, byrow = TRUE)

Average_Loops <- as.data.frame(cbind(apply(output, 2, mean))) #find the average # of loops 
Average_Loops$V2 <- c(1:100)

#plot the results 

ggplot(data=Average_Loops, aes(y=Average_Loops$V1, x=Average_Loops$V2)) +
  geom_point() +
  xlab("Number Required to Win Game") +
  ylab("Mean Number of Flips (Out of 100 Simulations)")
                  
#it looks like an exponentital function with x^2 or (-x)^2

