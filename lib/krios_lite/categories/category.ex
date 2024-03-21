defmodule KriosLite.Categories.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field(:name, :string)
    field(:description, :string)

    timestamps(type: :utc_datetime)
    has_many(:items, KriosLite.Items.Item)
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:id, :name, :description])
    |> validate_required([:name, :description])
    |> unique_constraint(:name)
  end
end
