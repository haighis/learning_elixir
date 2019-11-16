# HttpUrlTest

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `http_rest_client` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:http_rest_client, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/http_rest_client](https://hexdocs.pm/http_rest_client).

ETS - Insert a key value
:ets.insert :rest_url, {:url, ["testurl"]} 

ETS - Lookup by key

:ets.lookup :rest_url, :url