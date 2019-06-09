defmodule Hello.Endpoint do
  
  use Plug.Router

  plug(:match)
  plug(:dispatch)
  plug(Plug.Parsers, parsers: [:json], json_decoder: Poison)

  get "/ping" do
    send_resp(conn, 200, Poison.encode!(%{response: "Pong!"}))
  end

  match _ do
    send_resp(conn, 404, "Page not found !!")
  end
end