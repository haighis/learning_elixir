defmodule HttpRestClient.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(HttpRestClient.Scheduler, [])
    ]

    opts = [strategy: :one_for_one, name: HttpRestClient.Supervisor]
    Supervisor.start_link(children, opts)
  end
end