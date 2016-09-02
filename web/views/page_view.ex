defmodule Web.PageView do
  use Web.Web, :view

  def render("random.json", %{data: data}) do
    data
  end
end
