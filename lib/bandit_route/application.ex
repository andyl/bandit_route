defmodule BanditRoute.Application do

  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Bandit, plug: BanditRoute.Router}
    ]

    opts = [strategy: :one_for_one, name: BanditRoute.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
