defmodule MyProcess do
  def start do
    accepting_messages(0)
  end

  def accepting_messages(state) do
    receive do
      {:hello, message} ->
        IO.puts "Hello, #{message}"
        accepting_messages(state)
      _ ->
        IO.puts "I handle the default message when there is no pattern matched"
        accepting_messages(state)
    end
  end
end