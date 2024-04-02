defmodule KriosLite.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items, primary_key: false) do
      add :sku, :string, primary_key: true
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
