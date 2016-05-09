 
# The misanthropes are coming. 
# Suppose there is a row of some number, N, of houses in a new, initially empty development. 
# Misanthropes are moving into the development one at a time and selecting a house at random from those that have nobody in them and nobody living next door. 
# They keep on coming until no acceptable houses remain. 
# At most, one out of two houses will be occupied; at least one out of three houses will be. 

#But what’s the expected fraction of occupied houses as the development gets larger, that is, as N goes to infinity?

#create a matrix that simulates the conditions of the misanthrope problem. 
misanthrope <- function(N){
  house <- as.data.frame(matrix(0,2*N,N)) #make the matrix twice as long as wide so that we are sure that there are no gaps left where a misanthrope can move in 
  a <- sample(1:N,size=1) 
  house[1,a] <- 1 #first misanthrope moves in
  for(i in 1:(2*N-1)) {
    house[i+1, ] <- rep(house[i, ]) 
    a <- sample(1:N,size=1)
    if (a==1 & house[i+1,2] == 0) {house[i+1,a] <- 1 
    } else if (a==1 & house[i+1,2] == 1) {house[i+1,a] <- 0
    } else if (a==N & house[i+1,(N-1)] == 0) {house[i+1,N] <- 1 #if there are no neighbors, the misanthrope moves in
    } else if (a==N & house[i+1,(N-1)] == 1) {house[i+1,N] <- 0
    } else if (house[i+1,a+1] == 1 | house[i+1,a-1] == 1) {house[i+1,a] <- 0 
    } else {house[i+1,a] <- 1}
  } 
  return(sum(house[2*N, ] == 1)/N) #find the fraction occupied 
}

#run a simulation with houses N = 5 to 95 
a <- c(5:100)
results <- replicate(10,lapply(a, misanthrope)) #replicate each house N ten times 
output <- matrix(unlist(results), ncol = 10, byrow = TRUE)
Average_Occupied <- as.data.frame(cbind(apply(output, 1, mean))) #find the average fraction 
Average_Occupied$V2 <- c(5:100)
Average_Occupied

#find the median -> fraction occupied 
median(Average_Occupied$V1)

#plot the results 

library(ggplot2) 
hline <- geom_hline(yintercept = 0.4187672, color = "red", linetype = 2)
xlab <- xlab("Number of Houses")
ylab <- ylab("Percent of Occupied Houses")
title <- ggtitle("What Percent Occupied?")
q <- qplot(x = Average_Occupied$V2, y = Average_Occupied$V1, geom = c("line", "point"), ylim = c(0.35,0.475)) 
q + title + xlab + ylab + hline


#post script - the correct answer is 0.432 -> increase the number of simulations + replications 
#would love suggestions on ways to improve this script - email anastasiakaiser@gmail.com
