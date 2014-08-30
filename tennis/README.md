Tennis
======

## Desciption
Two processes sending messages back and forth to simulate a simple tennis match. When a player loses the process dies and sends the winner a message.

##Player Skill Algorithm
The player skill algorithm computes the players ability to return the ball. It takes into account the spin of the shot, the skill of the player, and also a randomly generated number to determine whether the player can return the ball. Code is stored in the Skill module.

##Usage
Start up an iex session:

    iex -S mix

Then start a tennis match in the iex session:

    > skill1 = 0.9 # Skill of player 1
    > skill2 = 0.8 # Skill of player 2
    > Tennis.start(skill1, skill2)

You should see something like this printed out after you run the start function:

    {#PID<0.100.0>, #PID<0.101.0>}
    [Player 1] Serving ball with 0.9 spin
    [Player 2] Returned ball to Player 1 with 0.364 spin
    [Player 1] Returned ball to Player 2 with 0.572 spin
    [Player 2] Returned ball to Player 1 with 1 spin
    [Player 1] Returned ball to Player 2 with 0.355 spin
    [Player 2] Missed ball
    [Player 1] Player 2 failed to return the ball. I win!!!
