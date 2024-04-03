defmodule KriosLite.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :string
      add :description, :string, null: true

      timestamps(type: :utc_datetime)
    end
    create index("categories",[:name], unique: true)
  end
end
