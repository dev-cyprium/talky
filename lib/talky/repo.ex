defmodule Talky.Repo do
  use Ecto.Repo,
    otp_app: :talky,
    adapter: Ecto.Adapters.Postgres
end
