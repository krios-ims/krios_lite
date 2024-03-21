defmodule KriosLite.ItemsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `KriosLite.Items` context.
  """

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        barcode: "some barcode",
        category: "some category",
        cost: 120.5,
        name: "some name",
        price: 120.5,
        sku: "some sku",
        unit_of_measure: "some unit_of_measure"
      })
      |> KriosLite.Items.create_item()

    item
  end
end
