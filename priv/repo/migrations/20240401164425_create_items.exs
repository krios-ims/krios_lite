defmodule KriosLite.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :sku, :string
      add :name, :string, null: true

      timestamps(type: :utc_datetime)
    end
    create index("items",[:sku], unique: true)

  end
end
