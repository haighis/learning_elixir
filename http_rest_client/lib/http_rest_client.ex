defmodule HttpRestClient do
  # Example global constant atom @table_name :someatom
  def run do
    # IO.puts "I received the message to start work - 1"
    case :ets.lookup :rest_url, :url do
      [] -> IO.puts "Not going to run as there is no url to open"
      _ -> IO.puts "There is a url to open"
            get_url() |> save_log
    end
  end

  def column_names do
    Enum.join(~w(Date StatusCode Url), ",")
  end

  def set_url(url) do
    :ets.insert :rest_url, {:url, url} 
    IO.puts url
  end

  def get_url do
    now = DateTime.to_string(%{DateTime.utc_now() | microsecond: {0, 0}})
    # get url from ets
    # Use pattern matching to get only the url value. 
    # In ETS rows are a keyword list {:key, ["my value"]}
    # So to pull out only the value you pattern match on just get the value
    url_to_load = 
      case :ets.lookup :rest_url, :url do
      [] -> IO.puts "No url to get"
      [{_key, url}] -> url 
    end

    IO.puts " url entereied #{url_to_load}" 
    response = HTTPoison.get!(url_to_load)  #"http://httparrot.herokuapp.com/get"
    %{body: body} = response
    [now,response.status_code,response.request_url] |> Enum.join(", ") #response.body,response.headers
  end

  def save_log(row) do
    filename = "log.csv"
    unless File.exists?(filename) do
      File.write!(filename, column_names() <> "\n")
    end
    File.write!(filename, row <> "\n", [:append])
  end
end