defmodule KriosLite.Items.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field(:sku, :string)
    field(:name, :string)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:sku, :name])
    |> unique_constraint(:sku)
    |> validate_format(:sku, ~r/^[^\s]+$/, message: "SKU cannot have spaces")
    |> validate_required([:sku])
  end
end
