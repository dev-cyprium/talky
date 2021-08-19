defmodule Talky.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :password, :email])
    |> validate_required([:name, :password, :email])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> add_password_hash
  end

  defp add_password_hash(%{valid?: true, changes: %{password: password}} = changeset) do
    put_change(changeset, :password_hash, Argon2.hash_pwd_salt(password))
  end
  defp add_password_hash(changeset), do: changeset
end
