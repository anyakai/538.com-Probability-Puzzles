#======================================================#
#====== CAR SIMULATION ======#
#======================================================#

# Author: Anastasia Kaiser (anastasiakaiser@gmail.com)
# http://fivethirtyeight.com/features/how-many-cars-will-get-stuck-in-traffic/
  
# There is a very long, straight highway with some number of cars (N) placed somewhere along it, randomly. 
# The highway is only one lane, so the cars can’t pass each other. 
# Each car is going in the same direction, and each driver has a distinct positive speed at which she prefers to travel. 
# Each preferred speed is chosen at random. 
# Each driver travels at her preferred speed unless she gets stuck behind a slower car, in which case she remains stuck behind the slower car. 
# On average, how many groups of cars will eventually form? (A group is one or more cars travelling at the same speed.)
# 
# For example, if the car in the very front happens to be slowest, there will be exactly one group — everybody will eventually pile up behind the slowpoke. If the cars happen to end up in order, fastest to slowest, there will be N groups — no car ever gets stuck behind a slower car.

# generate a string of 10 
# loop through and reconcile 
# count distinct 
# rinse, repeat 

cars <- function(N){

c <- sample(N, size=N, replace=FALSE)
loops <- 0

while (loops < 10*N){ #go through enough iterations such that "fast cars" become stuck

for (i in 1:(N-1)) { 
  
  if (c[i] > c[i+1]) {
    c[i] <- c[i+1]
  } 
  }
  loops <- loops + 1
}
return(length(unique(c)))
}

mean(replicate(10, cars(N=1000)))

#It looks like the solution increases with respect to N. Let's plot it. 

a <- c(5:100)
results <- replicate(100,lapply(a, cars))
output <- matrix(unlist(results), ncol = 10, byrow = TRUE)
Average_Stuck <- as.data.frame(cbind(apply(output, 1, mean))) #find the average fraction 
Average_Stuck$V2 <- c(5:100)


library(ggplot2) 
xlab <- xlab("Number of Cars")
ylab <- ylab("Number of Groups")
title <- ggtitle("How Many Groups?")

q <- qplot(x = Average_Stuck$V2, y = Average_Stuck$V1, 
           geom = c("line", "point"))
q + title + xlab + ylab 

ggplot(data=Average_Stuck, aes(x=Average_Stuck$V2, 
                               y=Average_Stuck$V1)) + geom_smooth() + xlab("Number of Cars") + ylab("Number of Groups") + ggtitle("How Many Groups?")
  
  