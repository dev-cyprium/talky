defmodule Talky.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :password_hash, :string
      add :email, :string

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
