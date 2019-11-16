# Compile a Program from iex
- Run iex 
- Execute `c("MyProcessGenServer.ex")`

# Using the program
- Start the program `MyProcessGenServer.start_link(0)`
- Run hello world `MyProcessGenServer.hello("world")`

TODO

- update state to be stored in ets with a table so that the counter is stored when actors f/ail.
