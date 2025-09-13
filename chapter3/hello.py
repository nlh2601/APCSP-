# Nathanael
# 12/27/25
# python mini lab

from cs50 import get_string
from cs50 import get_int
# imports cs50 functions

print("hello world")
name = get_string("Enter your name: ")
height = get_int("Enter your height (in inches): ")
birthday = get_int("Enter your birthday month: ")
age = get_int("Enter your age: ")
word = get_string("Enter a word: ")
# asks questions using cs50 functions
while age < 0:
    age = get_int("Enter your age: ")
# prevents negative numbers
sheight = f"{height/67}"
# turns the int into a string
print("Hello, "+name+"!")
# prints name as a string
print("You are "+sheight+" Jihos tall")
# prints height as a string
if abs(2-birthday) == 0:
    print("Wow, your birthday is this month!")
elif abs(2-birthday) <= 4:
    print("Wow, your birthday is close!")
elif abs(2-birthday) > 4:
    print("Wow, your birthday is quite a bit away")
# uses the absolute value function to get the positive number of the subtraction and checks if its =0, >4 or <=4 and responds accordingly
if age < 18:
    print("Wow, you're a child")
if age >= 18:
    print("Wow, you're an adult")
# checks if age is above or = to 18 or below
print("Your word is spelled like this: ")
for x in word:
    print(x)
# loops through every letter using x (can be any variable)
# its like i++ in C but you dont need to put that
