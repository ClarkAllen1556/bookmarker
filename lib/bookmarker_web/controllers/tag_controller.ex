defmodule BookmarkerWeb.TagController do
  use BookmarkerWeb, :controller

  alias Bookmarker.Tags
  alias Bookmarker.Tags.Tag

  action_fallback BookmarkerWeb.FallbackController

  def index(conn, _params) do
    render(conn, "index.json", tags: Tags.list_tags())
  end

  def show(conn, %{"id" => id}) do
    render(conn, "show.json", tag: Tags.get_tag!(id))
  end

  def create(conn, %{"tag" => tag_params}) do
    with {:ok, %Tag{} = tag} <- Tags.create_tag(tag_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.tag_path(conn, :show, tag))
      |> render("show.json", tag: tag)
    end
  end

  def update(conn, %{"id" => id, "tag" => tag_params}) do
    tag = Tags.get_tag!(id)

    with {:ok, %Tag{} = tag} <- Tags.update_tag(tag, tag_params) do
      render(conn, "show.json", tag: tag)
    end
  end

  def delete(conn, %{"id" => id}) do
    tag = Tags.get_tag!(id)

    with {:ok, %Tag{}} <- Tags.delete_tag(tag) do
      send_resp(conn, :no_content, "")
    end
  end
end
