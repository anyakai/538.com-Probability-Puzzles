#title: 'Solving the Monster Gem Problem'
#author: 'Anastasia Kaiser'
#date: '30 May 2016'

#http://fivethirtyeight.com/features/can-you-slay-the-puzzle-of-the-monsters-gems/

#A video game requires you to slay monsters to collect gems. 
#Every time you slay a monster, it drops one of three types of gems: 
  #a common gem, an uncommon gem or a rare gem. 

#The probabilities of these gems being dropped are in the ratio of 3:2:1 
# — three common gems for every two uncommon gems 
#for every one rare gem, on average. If you slay monsters until you have at least one of each of the three types of gems, 
#how many of the most common gems will you end up with, on average?

k <- 0 
for(i in 1:1000) {
  
  HaveISeenCommon = FALSE
  Semi_Common = FALSE
  Rare = FALSE
  Number_Common <- 0
  loops <- 0
  
  while (!HaveISeenCommon | !Semi_Common | !Rare) {
    loops = loops + 1
    c <- sample(1:6,size=1)
    if (c <= 3) {
      HaveISeenCommon = TRUE
      Number_Common <- Number_Common + 1
    } else if (c <= 5) {
      Semi_Common = TRUE
    } else {
      Rare = TRUE
    }
  }
  
  k <- k + Number_Common 

}

answer <- k / 1000
print(answer)

