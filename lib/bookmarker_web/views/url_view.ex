defmodule BookmarkerWeb.UrlView do
  use BookmarkerWeb, :view

  alias BookmarkerWeb.{UrlView, TagView}

  def render("index.json", %{urls: urls}) do
    %{data: render_many(urls, UrlView, "url.json")}
  end

  def render("show.json", %{url: url}) do
    %{data: render_one(url, UrlView, "url.json")}
  end

  def render("url.json", %{url: url}) when is_list(url.tags) do
    %{
      id: url.id,
      title: url.title,
      url: url.url,
      note: url.note,
      is_read: url.is_read,
      is_archived: url.is_archived,
      tags: render_many(url.tags, TagView, "tag.json")
    }
  end

  def render("url.json", %{url: url}) do
    %{
      id: url.id,
      title: url.title,
      url: url.url,
      note: url.note,
      is_read: url.is_read,
      is_archived: url.is_archived,
      tags: []
    }
  end
end
