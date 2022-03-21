defmodule Bookmarker.BookmarksTest do
  use Bookmarker.DataCase

  alias Bookmarker.Bookmarks

  describe "urls" do
    alias Bookmarker.Bookmarks.Url

    import Bookmarker.BookmarksFixtures

    @invalid_attrs %{is_archived: nil, is_read: nil, note: nil, title: nil, url: nil}

    test "list_urls/0 returns all urls" do
      url = url_fixture()
      assert Bookmarks.list_urls() == [url]
    end

    test "get_url!/1 returns the url with given id" do
      url = url_fixture()
      assert Bookmarks.get_url!(url.id) == url
    end

    test "create_url/1 with valid data creates a url" do
      valid_attrs = %{is_archived: true, is_read: true, note: "some note", title: "some title", url: "some url"}

      assert {:ok, %Url{} = url} = Bookmarks.create_url(valid_attrs)
      assert url.is_archived == true
      assert url.is_read == true
      assert url.note == "some note"
      assert url.title == "some title"
      assert url.url == "some url"
    end

    test "create_url/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bookmarks.create_url(@invalid_attrs)
    end

    test "update_url/2 with valid data updates the url" do
      url = url_fixture()
      update_attrs = %{is_archived: false, is_read: false, note: "some updated note", title: "some updated title", url: "some updated url"}

      assert {:ok, %Url{} = url} = Bookmarks.update_url(url, update_attrs)
      assert url.is_archived == false
      assert url.is_read == false
      assert url.note == "some updated note"
      assert url.title == "some updated title"
      assert url.url == "some updated url"
    end

    test "update_url/2 with invalid data returns error changeset" do
      url = url_fixture()
      assert {:error, %Ecto.Changeset{}} = Bookmarks.update_url(url, @invalid_attrs)
      assert url == Bookmarks.get_url!(url.id)
    end

    test "delete_url/1 deletes the url" do
      url = url_fixture()
      assert {:ok, %Url{}} = Bookmarks.delete_url(url)
      assert_raise Ecto.NoResultsError, fn -> Bookmarks.get_url!(url.id) end
    end

    test "change_url/1 returns a url changeset" do
      url = url_fixture()
      assert %Ecto.Changeset{} = Bookmarks.change_url(url)
    end
  end
end
