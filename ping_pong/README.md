PingPong
========

##Description
Two processes sending messages back and forth. Creates an infinite loop. The Ping process receives a pong and sends a ping to the Pong process, which in turns sends another pong message back to the Ping process.

##Usage
Start up an iex session:

    iex -S mix

Then start a loop in the iex session:

    > PingPong.start

You should see something like this printed out after you run the start function:

    Pong received a ping
    Ping received a pong
    Ping received a pong
    Pong received a ping
    Pong received a ping
    Ping received a pong
    Pong received a ping
    Ping received a pong
    ...

Use `^C` to quit.
