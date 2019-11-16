defmodule HttpUrlTest.Scheduler do
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
    HttpUrlTest.run()
    schedule_work()
    {:noreply, state}
  end

  @thirty_seconds 30000

  defp schedule_work do
    # sends every 30 seconds
    Process.send_after(self(), :work, @thirty_seconds)
  end
end