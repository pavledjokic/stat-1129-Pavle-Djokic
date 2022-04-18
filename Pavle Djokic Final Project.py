#!/usr/bin/env python
# coding: utf-8

# In[205]:


class Player:
    def __init__(self, name, score):
        self.name = name
        self.score = score
def checkname(name):
    while not name.isalpha():
            name = input("I'm sorry, your name must be a string or an alphabet. Please try again: ")
    return name
def checkmove(move):
    valid = 0
    while not (valid == 1):
        if (move == "rock"):
            valid = 1
        elif (move == "scissors"):
            valid = 1
        elif (move == "paper"):
            valid = 1
        else:
            valid = 0
            move = input("I'm sorry, that is not a valid move. Please try again: ").lower()
    return move
def result(input1, input2):
    if (input1 == "rock"):
        if (input2 == "rock"):
            print("This round is a draw.")
            return "NA"
        elif (input2 == "paper"):
            print(p2.name + " Won this round!")
            return "p2"
        elif (input2 == "scissors"):
            print(p1.name + " Won this round!")
            return "p1"
    elif (input1 == "paper"):
        if (input2 == "rock"):
            print(p1.name + " Won this round!")
            return "p1"
        elif (input2 == "paper"):
            print("This round is a draw.")
            return "NA"
        elif (input2 == "scissors"):
            print(p2.name + " Won this round!")
            return "p2"
    elif (input1 == "scissors"):
        if (input2 == "rock"):
            print(p2.name + " Won this round!")
            return "p2"
        elif (input2 == "paper"):
            print(p1.name + " Won this round!")
            return "p1"
        elif (input2 == "scissors"):
            print("This round is a draw.")
            return "NA"
    print()
def scorekeeper(input):
    if (input == "p1"):
        p1.score += 1
    elif (input == "p2"):
        p2.score += 1
    print("\nThe score is:\n" + p1.name + ": " + str(p1.score) + "\n" + p2.name + ": " + str(p2.score)+ "\n")
    if (p1.score == 2):
        print("Congratulations " + p1.name + "! You won the game of Rock, Paper, Scissors!!")
    if (p2.score == 2):
        print("Congratulations " + p2.name + "! You won the game of Rock, Paper, Scissors!!")

   


# In[ ]:


answer = 'y'
while(answer == 'y') or (answer == 'yes'):
    print("\nWelcome to the game of Rock, Paper, Scissors!\n")
    p1name = checkname(input("Player 1: Enter your name: "))
    p1 = Player(p1name, 0)
    print()
    p2name = checkname(input("Player 2: Enter your name: "))
    p2 = Player(p2name, 0)
    print()

    while (p1.score < 2) and (p2.score < 2):
        p1move = input(p1name + ": Enter your move: ").lower()
        p1move = checkmove(p1move)
        print()
        p2move = input(p2name + ": Enter your move: ").lower()
        p2move = checkmove(p2move)
        print()
        roundwin = result(p1move, p2move)
        scorekeeper(roundwin)

    input("\nWant to play again? Type 'Yes' to continue: ").lower()


# In[ ]:




