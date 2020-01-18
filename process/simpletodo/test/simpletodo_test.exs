defmodule SimpletodoTest do
  use ExUnit.Case
  doctest Simpletodo

  test "greets the world" do
    assert Simpletodo.hello() == :world
  end
end
