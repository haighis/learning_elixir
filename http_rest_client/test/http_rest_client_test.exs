defmodule HttpRestClientTest do
  use ExUnit.Case
  doctest HttpRestClient

  test "greets the world" do
    assert HttpRestClient.hello() == :world
  end
end
