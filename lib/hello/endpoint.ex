defmodule Hello.Endpoint do
  use Plug.Router

  require Logger
  
  plug(Plug.Logger, log: :debug)
  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Poison
  )

  plug(:dispatch)

  forward("/bot", to: Hello.Router)

  defp config, do: Application.fetch_env(:hello, __MODULE__)

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]}
    }
  end

  def start_link(_opts) do
    with {:ok, [port: port] = config} <- config() do
      Logger.info("Starting server at http://localhost:#{port}/")
      Cowboy2.http(__MODULE__, [])
    end
  end

  match _ do
    send_resp(conn, 404, "Requested page not found!")
  end
end