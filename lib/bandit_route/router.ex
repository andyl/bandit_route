defmodule BanditRoute.Router do
  use Plug.Router
  plug :match
  plug :dispatch

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
