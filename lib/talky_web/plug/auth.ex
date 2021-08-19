defmodule TalkyWeb.Plug.Auth do
  import Plug.Conn

  alias Talky.Accounts

  def init(default), do: default

  def call(conn, _opts) do
    user_id = get_session(conn, :current_user_id)
    user = if user_id, do: Accounts.get_user(user_id), else: nil

    cond do
      user ->
        assign(conn, :current_user, user)

      true ->
        assign(conn, :current_user, nil)
    end
  end
end
