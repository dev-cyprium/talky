defmodule TalkyWeb.SessionController do
  use TalkyWeb, :controller

  def destroy(conn, _) do
    if conn.assigns.current_user do
      conn
      |> configure_session(drop: true)
      |> redirect(to: "/")
    else
      redirect(conn, to: "/")
    end
  end
end
