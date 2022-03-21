defmodule Bookmarker.Repo.Migrations.CreateUrls do
  use Ecto.Migration

  def change do
    create table(:urls, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :url, :string
      add :note, :string
      add :is_read, :boolean, default: false, null: false
      add :is_archived, :boolean, default: false, null: false

      timestamps()
    end
  end
end
