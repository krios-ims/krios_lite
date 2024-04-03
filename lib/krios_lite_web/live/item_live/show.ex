defmodule KriosLiteWeb.ItemLive.Show do
  use KriosLiteWeb, :live_view

  alias KriosLite.Items

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:item, Items.get_item!(id))}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    item = Items.get_item!(id)

    {:ok, _} = Items.delete_item(item)

    {:noreply,
     socket
     |> push_navigate(to: "/items")}
  end

  defp page_title(:show), do: "Show Item"
  defp page_title(:edit), do: "Edit Item"
end
