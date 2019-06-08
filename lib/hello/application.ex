defmodule Hello.Application do
  use Application
  alias Hello.Endpoint

  def start(_type, _args),
    do: Supervisor.start_link(children(), opts())

  defp opts do
    [
      strategy: :one_for_one,
      name: Hello.Supervisor
    ]
  end

  defp children do
    [
      Endpoint
    ]
  end
end