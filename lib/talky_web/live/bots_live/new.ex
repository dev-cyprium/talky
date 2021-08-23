defmodule TalkyWeb.BotsLive.New do
  use TalkyWeb, :live_view

  @impl true
  def mount(_, _, socket) do
    {:ok, assign(socket, :actions, [])}
  end

  @impl true
  def handle_event("add_action", _, socket) do
    {:noreply, assign(socket, :actions, [%{} | socket.assigns.actions])}
  end

  @impl true
  def handle_event("save", _, socket) do
    {:noreply, socket}
  end
end
