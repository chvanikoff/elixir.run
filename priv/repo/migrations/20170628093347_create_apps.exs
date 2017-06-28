defmodule ER.Repo.Migrations.CreateApps do
  use Ecto.Migration

  def change do
    create table(:apps) do
      add :name, :string
      add :demo_url, :string
      add :source_url, :string
      add :image_url, :string
      add :description, :text
      add :status, :string

      timestamps()
    end

    create unique_index(:apps, [:name])
    create unique_index(:apps, [:demo_url])
    create unique_index(:apps, [:source_url])
    create unique_index(:apps, [:image_url])
  end
end

