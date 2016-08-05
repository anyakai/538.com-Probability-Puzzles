#A video game requires you to slay monsters to collect gems. 
#Every time you slay a monster, it drops one of three types of gems: 
  #a common gem, an uncommon gem or a rare gem. 

#The probabilities of these gems being dropped are in the ratio of 3:2:1 
# — three common gems for every two uncommon gems 
#for every one rare gem, on average. If you slay monsters until you have at least one of each of the three types of gems, 
#how many of the most common gems will you end up with, on average?

#keep dropping gems until you have all, count how many common 


import random 

Total_Count_Common = 0
X = 10000

for i in range(1,X):

    Count_Common = 0
    Common = False
    Uncommon = False
    Rare = False
    
    while (Common == False or Uncommon == False or Rare == False):
        num = random.randint(1,6)

        if 1 <= num <= 3:
            Common = True
            Count_Common += 1 
        elif 4 <= num <= 5:
            Uncommon = True
        else:
            Rare = True
    
    Total_Count_Common += Count_Common
    Solution = float(Total_Count_Common) / float(X)

print(Solution)
    