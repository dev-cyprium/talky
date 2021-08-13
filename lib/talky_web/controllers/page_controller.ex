defmodule TalkyWeb.PageController do
  use TalkyWeb, :controller

  def home(conn, _) do
    render(conn, :home)
  end
end
