defmodule TalkyWeb.UserController do
  use TalkyWeb, :controller

  alias Talky.Accounts
  alias Talky.Accounts.User
  alias TalkyWeb.Router.Helpers, as: Routes

  def register_form(conn, _) do
    render(conn, :sign_up, changeset: Accounts.change_user(%User{}))
  end

  def register(conn, %{"user" => user_params}) do
    case Accounts.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_session(:current_user_id, user.id)
        |> configure_session(renew: true)
        |> put_flash(:info, "Successfully signed up!")
        |> redirect(to: "/")
      {:error, changeset} ->
        render(conn, :sign_up, changeset: changeset)
      end
  end
end
