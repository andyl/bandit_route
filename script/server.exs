#!/usr/bin/env elixir

Mix.install([
  {:bandit, "~> 0.5"}
])

defmodule Router do
  use Plug.Router
  plug Plug.Logger
  plug :match
  plug :dispatch

  def run do
    Bandit.start_link(plug: Router)
    Process.sleep(:infinity)
  end

  get "/" do
    send_resp(conn, 200, "HELLO")
  end

  match _ do
    send_resp(conn, 404, "Not found")
  end
end

Router.run()

