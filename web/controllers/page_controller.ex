defmodule Web.PageController do
  use Web.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def sample(conn, _params) do
    render conn, "sample.html"
  end

  def chat(conn, _params) do
    render conn, "chat.html"
  end

  def random(conn, _params) do
    render conn, data: Enum.map(1..6, fn(_) -> :rand.uniform(100) end)
  end
end
