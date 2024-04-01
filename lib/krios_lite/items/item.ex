defmodule KriosLite.Items.Item do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:sku, :string, []}
  @derive {Phoenix.Param, key: :sku}
  schema "items" do
    field(:name, :string)

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:sku, :name])
    |> validate_required([:sku, :name])
  end
end
