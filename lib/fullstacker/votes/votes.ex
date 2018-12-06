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

  def create_poll_with_options(poll_attrs, options) do
    Repo.transaction(fn ->
      with {:ok, poll} <- create_poll(poll_attrs),
           {:ok, _options} <- create_options(options, poll)
      do
        poll
      else
        _ -> Repo.rollback("Failed to create poll.")
      end
    end)
  end

  def create_poll(attrs) do
    %Poll{}
    |> Poll.changeset(attrs)
    |> Repo.insert()
  end

  def create_options(options, poll) do
    results = Enum.map(options, fn option ->
      create_option(%{title: option, poll_id: poll.id})
    end)

    if Enum.any?(results, fn {status, _} -> status == :error end) do
      {:error, "Failed to create an option."}
    else
      {:ok, results}
    end
  end

  def create_option(attrs) do
    %Option{}
    |> Option.changeset(attrs)
    |> Repo.insert()
  end

end
