defmodule Bookmarker.Repo.Migrations.AddTagsTable do
  use Ecto.Migration

  def change do
    create table(:tags, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :url_id, references("urls", type: :binary_id)

      timestamps()
    end
  end
end
