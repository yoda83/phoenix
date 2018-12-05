defmodule Fullstacker.Schema.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Fullstacker.Schema.User

  schema "users" do
    field :email
    field :password_hash

    timestamps()
  end
end
