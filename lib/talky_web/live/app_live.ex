defmodule TalkyWeb.AppLive do
  use TalkyWeb, :live_view

  alias Talky.Accounts

  @impl true
  def mount(_params, session, socket) do
    user_id = session["current_user_id"]
    user = if user_id, do: Accounts.get_user(session["current_user_id"]), else: nil

    cond do
      user ->
        {:ok, assign(socket, :current_user, user)}
      true ->
        {:ok, socket}
    end
  end
end
