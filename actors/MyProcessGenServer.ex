defmodule MyProcessGenServer do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, 0, name: __MODULE__)
  end

  ## Public API

  def hello(message) do
    GenServer.call(__MODULE__, {:hello, message})
  end

  def counter do
    GenServer.call(__MODULE__, :counter)
  end

  ## GenServer callbacks

  def init(start_counter) do
    {:ok, start_counter}
  end

  def handle_call({:hello, message}, _from, state) do
    IO.puts "Hello, #{message}"
    {:reply, :noproc, state}
  end

  def handle_call(:counter, _from, state) do
    new_state = state + 1
    IO.puts "New state is #{new_state}"
    {:reply, :noproc, new_state}
  end
end