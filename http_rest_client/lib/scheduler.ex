defmodule HttpRestClient.Scheduler do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, %{})
  end

  def init(state) do
    :ets.new(:rest_url, [:ordered_set, :public, :named_table])
    :ets.insert :rest_url, {:url, "http://www.google.com"} 
    handle_info(:work, state)
    {:ok, state}
  end

  def handle_info(:work, state) do
    HttpRestClient.run()
    schedule_work()
    {:noreply, state}
  end

  @ten_seconds 30000

  defp schedule_work do
    # sends in 6 hours
    Process.send_after(self(), :work, @ten_seconds)
    #Process.send_after(self(), :work, 6 * 60 * 60 * 1000)
  end
end