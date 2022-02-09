# tris-flutter

## Disclamer
This is a school project.

## Getting started
It aims to recreate the famous Tris game with flutter. 


It has been divided into two classes: 


    -main.dart: the main class containing the startpage 
    -Tris.dart: the class containing the game and all its mechanisms 

Initially it is projected in a startpage containing two buttons:


    -PLAY vs FRIEND: allows you to play against a friend
    -PLAY vs AI: allows you to play against a simple artificial intelligence


The widgets are MaterialUI type.

## Development
Initially the structure of the Tic-tac-toe has been created, that is 3 rows centrally aligned.


Each row contains 3 cells each initially empty and with custom borders to recreate the standard structure of the game. Each cell is initially empty and is registered with a unique number for each of them and its value is contained in an array *scheme*. When you click on one of them the text will be modified according to the value of the variable *turn*, which will change every time you click (if it is X it will change to O and vice versa).


The check in case of a win is done every time a cell is clicked through a check of the array *scheme* to see if it has win situations. If any is found the game is blocked allowing the user to reset through or return to the startpage through the respective icons.

### Artificial Intelligence
The ai of the project is a simple artificial intelligence that detecting the click on any cell by the user will randomly choose a cell (that has not already been clicked) and modify it as if a person had clicked on it. 


## Conclusions
The project allows you to play either against a friend or against an ai at the game of tic-tac-toe.


