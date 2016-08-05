#======================================================#
#====== FREE THROW PROBLEM======#

#======================================================#

# Author: Anastasia Kaiser (anastasiakaiser@gmail.com)
# http://fivethirtyeight.com/features/will-the-neurotic-basketball-player-make-his-next-free-throw/

# A basketball player is in the gym practicing free throws. He makes his first shot, then misses his second. This player tends to get inside his own head a little bit, so this isn’t good news. Specifically, the probability he hits any subsequent shot is equal to the overall percentage of shots that he’s made thus far. (His neuroses are very exacting.) His coach, who knows his psychological tendency and saw the first two shots, leaves the gym and doesn’t see the next 96 shots. The coach returns, and sees the player make shot No. 99. What is the probability, from the coach’s point of view, that he makes shot No. 100?

number_made_total <- 0
number_makes_99th <- 0 
new_ratio <- 0

for (i in 1:10000) {
  
loops <- 2
number_made <- 1 
takes_shot <- 0
prob_100th <- 0

while(loops < 99){
  
  loops <- loops + 1
  number_made <- number_made + takes_shot
  ratio <- number_made / (loops - 1)
  takes_shot <- rbinom(1,1,ratio)
}
if (takes_shot == 1) #because we only want those instances in which he makes his 99th shot
  
  {number_makes_99th <- number_makes_99th + 1
  number_made_total <- number_made + number_made_total}
}

number_made_total / (99*number_makes_99th)







