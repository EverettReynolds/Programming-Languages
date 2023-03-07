import datetime

file = open("unixtimestamp.txt")

for timestamp in file:
    print(timestamp)
    #epoch = int(timestamp)
    #human = datetime.fromtimestamp(int(epoch))
    #print("Epoch time:",epoch,"Converted time:",human)