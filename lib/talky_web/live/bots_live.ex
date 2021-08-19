defmodule TalkyWeb.BotsLive do
  use TalkyWeb, :live_view

  @impl true
  def mount(_, _, socket) do
    {:ok, assign(socket, :mode, :list)}
  end

  @impl true
  def handle_params(arg, bla, socket) do
    IO.inspect(bla)
    {:noreply, socket}
  end
end
