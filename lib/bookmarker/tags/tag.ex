defmodule Bookmarker.Tags.Tag do
  use Ecto.Schema
  import Ecto.Changeset
  # import Ecto.Repo

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "tags" do
    field :name, :string
    belongs_to :url, Bookmarker.Bookmarks.Url, foreign_key: :url_id, type: :binary_id

    timestamps()
  end

  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:name, :url_id])
    |> cast_assoc(:url)
    |> validate_required([:name])
  end
end
