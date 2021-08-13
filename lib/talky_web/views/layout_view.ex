defmodule TalkyWeb.LayoutView do
  use TalkyWeb, :view

  def logged_in?(conn), do: conn.assigns.current_user
end
