defmodule Fullstacker.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
    create table("users") do
        add :email, :string

        timestamps()
    end
  end
end
