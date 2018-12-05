defmodule Fullstacker.Repo do
  use Ecto.Repo,
    otp_app: :fullstacker,
    adapter: Ecto.Adapters.Postgres
end
