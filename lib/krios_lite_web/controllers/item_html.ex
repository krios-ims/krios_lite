defmodule KriosLiteWeb.ItemHTML do
  use KriosLiteWeb, :html

  embed_templates("item_html/*")

  @doc """
  Renders a item form.
  """
  attr(:changeset, Ecto.Changeset, required: true)
  attr(:action, :string, required: true)
  attr(:categories, :any, required: false)

  def item_form(assigns)
end
