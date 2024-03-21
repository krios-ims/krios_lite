defmodule KriosLite.Items.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field(:name, :string)
    field(:sku, :string)
    field(:unit_of_measure, :string)
    field(:cost, :float)
    field(:price, :float)
    field(:barcode, :string)

    timestamps(type: :utc_datetime)
    belongs_to(:categories, KriosLite.Categories.Category, foreign_key: :category_id)
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:sku, :name, :category_id, :unit_of_measure, :cost, :price, :barcode])
    |> validate_required([:sku, :name, :unit_of_measure, :cost, :price, :barcode])
    |> unique_constraint(:sku)
  end
end
