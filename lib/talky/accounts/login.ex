defmodule Talky.Accounts.Login do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :email, :string
    field :password, :string
  end

  @doc false
  def changeset(login, attrs) do
    login
    |> cast(attrs, [:email, :password])
    |> validate_required([:password, :email])
    |> validate_format(:email, ~r/@/)
  end
end
