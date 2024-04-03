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
        id: 1,
        name: "some name",
        sku: "some_sku"
      })
      |> KriosLite.Items.create_item()

    item
  end
end
