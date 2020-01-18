#https://www.akitaonrails.com/2015/11/22/observing-processes-in-elixir-the-little-elixir-otp-guidebook
defmodule Simpletodo do
@moduledoc """

  Simpletodo module demonstrates message passing with an Elixir Process called Simpletodo

  2) how to create processes (Simpletodo), 3) how to send messages among them (Simpletodo), and 4) how to apply the power of pattern matching to incoming messages. (Simpletodo)

  iex -S mix

  
  """

  @doc """
  Start Simpletodo
apid = Node.spawn_link(:alice@localhost, fn -> Simpletodo.start end)   

send apid, {:add, "buy bacon"}

  ## Examples

      Use spawn function to "spawn" new Simpletodo processes.
      - from Elixir Kernel module 
      iex> pid = spawn fn -> Simpletodo.start end

      To send a message to Simpletodo
      iex> send pid, {:add, "buy bacon"}
      iex> send pid, {:add, "buy eggs"}

      Lets see the process mailbox to look at the messages. 
      Send a message to Simpletodo that we don't match on. send pid, {:test, "i am a random message "} 
      Run :oberserver.start, find the process by looking for pid value as whatever outputted on screen.
      You see Elixir.Simpletodo and then go to Process info by right clicking on the process, then messages.
      You will see i am a random message 
      Because we matched/process the :add message, then these messages are read 
      when doing a send pid, {:add, "buy bacon"}

  """

  @doc """
  simpletodo main entry point. Call this function to start simpletodo    
  """
  def start do
    do_todo([]) # Initialize with an empty list
  end

  defp do_todo(state) do
    receive do
      {:add, message} ->
        IO.puts "You have a new Todo: #{message} \n"
        new_state = [ message | state ]        
        
        IO.puts new_state |> Enum.join(", ")
        do_todo(new_state)
      # _ -> # Default, will match all messages. Comment out so we can use :observer.start to visualize processes easily
      #   IO.puts "What?"
      #   do_todo(state)
    end
  end
end