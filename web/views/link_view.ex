defmodule Web.LinkView do
  use Web.Web, :view

  def links_json(links) do
    Poison.encode! render_many(links, Web.LinkView, "link.json")
  end

  def render("show.json", %{link: link}) do
    %{data: render_one(link, Web.LinkView, "link.json")}
  end

  def render("link.json", %{link: link}) do
    %{
    	id: link.id,
      host: link.host,
      path: link.path
    }
  end
end
