defmodule TalkyWeb.BotsLive do
  use TalkyWeb, :live_view

  @impl true
  def mount(_, _, socket) do
    {:ok, assign(socket, :mode, :list)}
  end
end
