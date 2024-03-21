defmodule KriosLite.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add(:name, :string)
      add(:description, :string)

      timestamps(type: :utc_datetime)
    end

    create table(:items) do
      add(:sku, :string)
      add(:name, :string)
      add(:category_id, references(:categories, on_delete: :delete_all), null: false)
      add(:unit_of_measure, :string)
      add(:cost, :float)
      add(:price, :float)
      add(:barcode, :string)

      timestamps(type: :utc_datetime)
    end

    create(unique_index(:items, [:sku]))

    create(unique_index(:categories, [:name]))
  end
end
