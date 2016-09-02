defmodule Web.PageController do
  use Web.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def sample(conn, _params) do
    render conn, "sample.html"
  end

  def empty(conn, _params) do
    render conn, "empty.html"
  end
end
