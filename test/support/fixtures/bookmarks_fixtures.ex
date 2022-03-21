defmodule Bookmarker.BookmarksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Bookmarker.Bookmarks` context.
  """

  @doc """
  Generate a url.
  """
  def url_fixture(attrs \\ %{}) do
    {:ok, url} =
      attrs
      |> Enum.into(%{
        is_archived: true,
        is_read: true,
        note: "some note",
        title: "some title",
        url: "some url"
      })
      |> Bookmarker.Bookmarks.create_url()

    url
  end
end
