defmodule KriosLite.CategoriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `KriosLite.Categories` context.
  """

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        name: "some_category",
        description: "some description"
      })
      |> KriosLite.Categories.create_category()

    category
  end
end
