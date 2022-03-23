defmodule Bookmarker.Tags.Tag do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Repo

  schema "tags" do
    field :name, :string
    belongs_to :url, Bookmarker.Bookmarks.Url

    timestamps()
  end

  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:name])
    |> cast_assoc(:url, with: &Bookmarker.Bookmarks.Url.changeset/2)
    |> validate_required([:name, :url])
  end
end
