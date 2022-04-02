defmodule Bookmarker.Tags do
  @moduledoc """
  The Tags context
  """

  import Ecto.Query, warn: false
  alias Bookmarker.Repo
  alias Bookmarker.Tags.Tag

  def list_tags(), do: Repo.all(Tag)

  def get_tag!(id), do: Repo.get!(Tag, id)

  def create_tag(attrs \\ %{}) do
    %Tag{}
    |> Tag.changeset(attrs)
    |> Repo.insert()
  end

  def update_tag(%Tag{} = tag, attrs) do
    tag
    |> Tag.changeset(attrs)
    |> Repo.update()
  end

  def delete_tag(%Tag{} = tag), do: Repo.delete(tag)

  def change_tag(%Tag{} = tag, attrs \\ %{}), do: Tag.changeset(tag, attrs)
end
