defmodule Hello.Application do
  
  use Application

  def start(_type, _args) do
    children = [
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: Hello.Endpoint,
        options: [port: Application.get_env(:hello, :port)]
      )
    ]

    opts = [strategy: :one_for_one, name: Hello.Supervisor]
    Supervisor.start_link(children, opts)
  end
end