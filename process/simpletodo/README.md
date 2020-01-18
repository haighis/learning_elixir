# Simpletodo 

## Process Basics, Create Processes, Message Passing with Processes, Pattern Matching

Elixir is a functional language, but Elixir programs are rarely structured around simple functions. Instead, Elixir’s key organizational concept is the process, an independent component (built from functions) that sends and receives messages. Programs are deployed as sets of processes that communicate with each other. This approach makes it much easier to distribute work across multiple processors or computers, and also makes it possible to do things like upgrade programs in place without shutting down the whole system.

Taking advantage of those features, though, means learning 1) learning the basics of a process 2) how to create processes (Simpletodo), 3) how to send messages among them (Simpletodo), and 4) how to apply the power of pattern matching to incoming messages. (Simpletodo)

### Process Basics

learning the basics of a process

Run iex by going to Terminal and run iex. iex is Interactive Elixir.

Before we get into process let's do the typical hello world. 

iex(1)> IO.puts "Hello world from Elixir"

iex itself is a process

Type self() and you will see the iex shell process identifier. 

iex(1)> self()
#PID<0.104.0>

### Message Passing with Processes

Send a message to current process in iex a couple of times

send(self(), :asdf)
send(self(), :asdf)

How many messages are there? Check the message queue length which is an indicator there are messages

Process.info(self(), :message_queue_len)

There should be two messages

View all the messages by running flush()

Process.info(self(), :message_queue_len)

There should be no messages

Send two more messages to ourself

send(self(), :asdf)
send(self(), :asdf)

The proper way to read the mailbox is with `receive end` which allows you to do something with the messages
Do this now in iex

iex(3)> receive do
...(3)> x -> x
...(3)> end

this will receive one of the messages, shows it rudimentlly as an atom to the screen, which we can verify by checking the message queue length
where it should be 1 Process.info(self(), :message_queue_len)

To see the message outputted let use Elixir IO.puts which will output to the screen with a custom message.

iex(5)> receive do                                                                                                                  ...(5)> msg -> IO.puts("Received #{msg}")                                                                                           ...(5)> end     

Process.info(self(), :message_queue_len)

Should be zero now

Doing this in interactive elixir is great to learn the syntax of an API methods as we get instant feedback before committing to the actual code in our code. Elixir has excellent documentation. See `https://hexdocs.pm/elixir/Process.html#content` for an example. As well using iex helps us determine the code we want to write before we commit to it in our program code files. 

https://www.oreilly.com/learning/playing-with-processes

### Pattern Matching