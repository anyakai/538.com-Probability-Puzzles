
#http://fivethirtyeight.com/features/can-you-solve-the-puzzle-of-the-baseball-division-champs/

#Assume you have a sport (let’s call it “baseball”) in which 
#each team plays 162 games in a season. Assume you have a 
#division of five teams (call it the “AL East”) where each team
#is of exact equal ability. Specifically, each team has a 50 percent 
#chance of winning each game. What is the expected value of the number 
#of wins for the team that finishes in first place?

results <- matrix(0,5,162)

#for each element i in matrix 'results', loop through and assign an L or W

m <- 1:5
n <- 1:162


season <- function(X) 
  {
  for (i in 1:5)
  { for (j in 1:162) 
    {
      results[i,j] <- sample(c('W','L'),size=1)
  } 
}
  wins_one <- length(which(results[1, ] == 'W'))
  wins_two <- length(which(results[2, ] == 'W'))
  wins_three <- length(which(results[3, ] == 'W'))
  wins_four <- length(which(results[4, ] == 'W'))
  wins_five <- length(which(results[5, ] == 'W'))
  
  return(max(wins_one, wins_two, wins_three, wins_four, wins_five))
}

a <- replicate(10000,season(x))
mean(a) 

#the expected value of the number 
#of wins for the team that finishes in first place is 88.3996 



