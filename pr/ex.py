import random
def number_guess():
    random.seed(900)
    randy = random.randint(1,100)
    randy2 = random.randint(1,100)
    if randy2 == randy:
        print("Correct")
    elif randy2 > randy:
        print("Too High")
    else:
        print("Too Low")
number_guess()