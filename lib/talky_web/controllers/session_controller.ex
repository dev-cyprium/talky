defmodule TalkyWeb.SessionController do
  use TalkyWeb, :controller

  alias Talky.Accounts
  alias Talky.Accounts.Login

  def login_form(conn, _) do
    changeset = Accounts.change_login(%Login{})
    render(conn, :login, changeset: changeset)
  end

  def login(conn, %{"login" => login_params}) do
    case Accounts.login(login_params) do
      {:ok, user} ->
        conn
        |> put_session(:current_user_id, user.id)
        |> configure_session(renew: true)
        |> put_flash(:info, "Successfully signed in!")
        |> redirect(to: "/")
      {:error, changeset} ->
        IO.inspect(changeset)
        render(conn, :login, changeset: changeset)
    end
  end

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
