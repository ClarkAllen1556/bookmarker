defmodule Bookmarker.Bookmarks.Url do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "urls" do
    field :is_archived, :boolean, default: false
    field :is_read, :boolean, default: false
    field :note, :string
    field :title, :string
    field :url, :string
    has_many :tag, Bookmarker.Tags.Tag

    timestamps()
  end

  @doc false
  def changeset(url, attrs) do
    url
    |> cast(attrs, [:title, :url, :note, :is_read, :is_archived])
    |> validate_required([:url])
  end
end
