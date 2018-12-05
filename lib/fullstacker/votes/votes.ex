defmodule Fullstacker.Votes do
  import Ecto.Query, warn: false

  alias Fullstacker.Repo
  alias Fullstacker.Votes.Poll
  alias Fullstacker.Votes.Option

  def list_polls do
    Repo.all(Poll) |> Repo.preload(:options)
  end

  def new_poll do
    Poll.changeset(%Poll{}, %{})
  end

end
