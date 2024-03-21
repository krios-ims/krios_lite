defmodule KriosLiteWeb.ItemController do
  use KriosLiteWeb, :controller

  alias KriosLite.Items
  alias KriosLite.Items.Item
  alias KriosLite.Categories

  def index(conn, _params) do
    items = Items.list_items()
    render(conn, :index, items: items)
  end

  def new(conn, _params) do
    changeset = Items.change_item(%Item{})
    categories = Categories.list_categories()
    render(conn, :new, changeset: changeset, categories: categories)
  end

  def create(conn, %{"item" => item_params, "category" => category_params}) do
    item_params = Map.put(item_params, "category", category_params)

    case Items.create_item(item_params) do
      {:ok, item} ->
        conn
        |> put_flash(:info, "Item created successfully.")
        |> redirect(to: ~p"/items/#{item}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    item = Items.get_item!(id)
    render(conn, :show, item: item)
  end

  def edit(conn, %{"id" => id}) do
    item = Items.get_item!(id)
    changeset = Items.change_item(item)
    categories = Categories.list_categories()
    render(conn, :edit, item: item, changeset: changeset, categories: categories)
  end

  def update(conn, %{"id" => id, "item" => item_params}) do
    item = Items.get_item!(id)

    case Items.update_item(item, item_params) do
      {:ok, item} ->
        conn
        |> put_flash(:info, "Item updated successfully.")
        |> redirect(to: ~p"/items/#{item}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, item: item, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    item = Items.get_item!(id)
    {:ok, _item} = Items.delete_item(item)

    conn
    |> put_flash(:info, "Item deleted successfully.")
    |> redirect(to: ~p"/items")
  end
end
