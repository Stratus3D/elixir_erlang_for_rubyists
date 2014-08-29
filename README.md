#Elixir: The Power of Erlang for Rubyists

Stratus3D

##Introduction
Code used for the demos in my "Elixir: The Power of Erlang for Rubyists" talk. Code samples used in the slides during the talk are stored in `.ex` files in the `code_samples/` directory. Each demo is also stored in it's own directory.

##Demos
###Ping Pong
Two processes sending messages back and forth. Creates an infinite loop.

###ProcessChain
Thousands of processes arranged in a loop passing messages around the loop. Demonstrates the efficiency of the Erlang VM’s ligtweight process creation and message passing.

###Tennis
Two processes sending messages back and forth to simulate a simple tennis match. When a player loses the process dies and sends the winner a message.
