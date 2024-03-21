defmodule KriosLite.ItemsTest do
  use KriosLite.DataCase

  alias KriosLite.Items

  describe "items" do
    alias KriosLite.Items.Item

    import KriosLite.ItemsFixtures

    @invalid_attrs %{name: nil, category: nil, sku: nil, unit_of_measure: nil, cost: nil, price: nil, barcode: nil}

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Items.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Items.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{name: "some name", category: "some category", sku: "some sku", unit_of_measure: "some unit_of_measure", cost: 120.5, price: 120.5, barcode: "some barcode"}

      assert {:ok, %Item{} = item} = Items.create_item(valid_attrs)
      assert item.name == "some name"
      assert item.category == "some category"
      assert item.sku == "some sku"
      assert item.unit_of_measure == "some unit_of_measure"
      assert item.cost == 120.5
      assert item.price == 120.5
      assert item.barcode == "some barcode"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Items.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{name: "some updated name", category: "some updated category", sku: "some updated sku", unit_of_measure: "some updated unit_of_measure", cost: 456.7, price: 456.7, barcode: "some updated barcode"}

      assert {:ok, %Item{} = item} = Items.update_item(item, update_attrs)
      assert item.name == "some updated name"
      assert item.category == "some updated category"
      assert item.sku == "some updated sku"
      assert item.unit_of_measure == "some updated unit_of_measure"
      assert item.cost == 456.7
      assert item.price == 456.7
      assert item.barcode == "some updated barcode"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Items.update_item(item, @invalid_attrs)
      assert item == Items.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Items.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Items.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Items.change_item(item)
    end
  end
end
