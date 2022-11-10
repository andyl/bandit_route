#!/usr/bin/env elixir

Mix.install([
  {:plug, "~> 1.14"},
  {:bandit, "~> 0.5"}
])

defmodule Router do

  use Plug.Router
  plug :match
  plug :dispatch

  def run do
    Bandit.start_link(plug: Router)
    Process.sleep(100)
    IO.puts("Ctrl-C to exit")
    Process.sleep(:infinity)
  end

  get "/" do
    conn
    |> send_resp(200, "HELLO")
    |> halt
  end

  match _ do
    conn
    |> send_resp(404, "Not found")
  end

end

Router.run()

