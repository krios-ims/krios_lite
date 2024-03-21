defmodule KriosLiteWeb.CategoryHTML do
  use KriosLiteWeb, :html

  embed_templates("category_html/*")

  @doc """
  Renders a item form.
  """
  attr(:changeset, Ecto.Changeset, required: true)
  attr(:action, :string, required: true)

  def category_form(assigns)
end
