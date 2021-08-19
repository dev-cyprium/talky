defmodule TalkyWeb.BotsLive.New do
  use TalkyWeb, :live_view

  @impl true
  def mount(_, _, socket) do
    {:ok, assign(socket, :actions, [])}
  end

  def handle_event("add_action", _, socket) do
    {:noreply, assign(socket, :actions, [%{} | socket.assigns.actions])}
  end

  def handle_event("save", params, socket) do
    {:noreply, socket}
  end
end
