defmodule BookmarkerWeb.UrlController do
  use BookmarkerWeb, :controller

  alias Bookmarker.{Bookmarks, Repo}
  alias Bookmarker.Bookmarks.Url

  action_fallback BookmarkerWeb.FallbackController

  def index(conn, _params) do
    urls =
      Bookmarks.list_urls()
      |> Repo.preload(:tags)

    render(conn, "index.json", urls: urls)
  end

  def create(conn, %{"url" => url_params}) do
    with {:ok, %Url{} = url} <- Bookmarks.create_url(url_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.url_path(conn, :show, url))
      |> render("show.json", url: url)
    end
  end

  def show(conn, %{"id" => id}) do
    url = Bookmarks.get_url!(id)
    render(conn, "show.json", url: url)
  end

  def update(conn, %{"id" => id, "url" => url_params}) do
    url = Bookmarks.get_url!(id)

    with {:ok, %Url{} = url} <- Bookmarks.update_url(url, url_params) do
      render(conn, "show.json", url: url)
    end
  end

  def delete(conn, %{"id" => id}) do
    url = Bookmarks.get_url!(id)

    with {:ok, %Url{}} <- Bookmarks.delete_url(url) do
      send_resp(conn, :no_content, "")
    end
  end
end
