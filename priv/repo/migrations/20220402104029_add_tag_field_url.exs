defmodule Bookmarker.Repo.Migrations.AddTagFieldUrl do
  use Ecto.Migration

  def change do
    create table(:tags, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :url_id, references(:urls, type: :binary_id, on_delete: :delete_all)

      timestamps()
    end
  end
end
