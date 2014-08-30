ProcessChain
============

##Description
Thousands of processes arranged in a loop passing messages around the loop. Demonstrates the efficiency of the Erlang VM’s ligtweight process creation and message passing.

##Usage
Start up an iex session:

    iex -S mix

Then start a loop in the iex session:

    > processes = 100 # Number of processes in chain
    > loops = 10 # Number of times the message should be sent around the chain
    > message = :test # The messsage to send
    > ProcessChain.start(processes, loops, message)

`start_timed` does the same thing but times to looping function:

    > ProcessChain.start_timed(processes, loops, message)

You should see something like this printed out after you run the start function:

    Sending message `test`!
    Got message `test`!
    :ok
